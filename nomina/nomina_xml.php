<?php
class NominaXml{	
	/**
	 * http://www.lacorona.com.mx/fortiz/sat/xml.php
	 * Calculo de sello
	 */
	function _sella(&$root, $arr, $cadena_original) {
		
		$pkeyid = openssl_get_privatekey( $arr['key_pem'] );			
		
		openssl_sign($cadena_original, $crypttext, $pkeyid, OPENSSL_ALGO_SHA1);
		openssl_free_key($pkeyid);
		 
		$sello = base64_encode($crypttext);      // lo codifica en formato base64
		$root->setAttribute("sello",$sello);
		
		// $certificado = $arr[''];
		$certificado = str_replace('-----BEGIN CERTIFICATE-----','', $arr['cer_pem']);
		$certificado = str_replace('-----END CERTIFICATE-----','', $certificado);
		
		// El certificado como base64 lo agrega al XML para simplificar la validacion
		$certificado= trim($certificado);
		$certificado= preg_replace("(\r\n)", "", $certificado);
		// echo $certificado; exit;
		$root->setAttribute("certificado",$certificado );
		
		return $sello;
	}
	function _generales(&$root, $arr) {	
		// print_r($arr);
		$this->_cargaAtt($root, array("xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
								  "xsi:schemaLocation"=>"http://www.sat.gob.mx/cfd/3  http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv32.xsd"
								 )
							 );
		
		$this->_cargaAtt($root, array(
							  "version"=>$arr['version'],
							  "serie"=>$arr['serie'],
							  "folio"=>$arr['folio'],
							  "fecha"=>$this->_xml_fech($arr['fecha']),
							  "sello"=>"@",
							  // "noAprobacion"=>$arr['noAprobacion'],
							  // "anoAprobacion"=>$arr['anoAprobacion'],
							  "formaDePago"=>$arr['formaDePago'],
							  "noCertificado"=>$arr['noCertificado'],
							  "certificado"=>"@",
							  "subTotal"=>round($arr['subTotal'],6),
							  "descuento"=>round($arr['descuento'],6),
							  "motivoDescuento"=>$arr['motivoDescuento'],
							  "total"=>round($arr['total'], 6),
							  'condicionesDePago'=>$arr['condicionesDePago'],
							  "tipoDeComprobante"=>strtolower($arr['tipoDeComprobante']),
							  "metodoDePago"=>$arr['metodoDePago'],
							  "LugarExpedicion"=>$arr['LugarExpedicion'],
							  "NumCtaPago"=>$arr['NumCtaPago'],
							  "FolioFiscalOrig"=>$arr['FolioFiscalOrig'],
							  "SerieFolioFiscalOrig"=>$arr['SerieFolioFiscalOrig'],
							  "FechaFolioFiscalOrig"=> empty( $arr['FolioFiscalOrig'] )? '' : $this->_xml_fech($arr['FechaFolioFiscalOrig']),
							  "MontoFolioFiscalOrig"=>$arr['MontoFolioFiscalOrig'],
							  "Moneda"=>$arr['Moneda'],
							  "TipoCambio"=>$arr['TipoCambio']
						   )
						);
	}
	
	function _cargaAtt(&$nodo, $attr) {
		$quitar = array('sello'=>1,'noCertificado'=>1,'certificado'=>1);
		foreach ($attr as $key => $val) {
			$val = preg_replace('/\s\s+/', ' ', $val);   // Regla 5a y 5c
			$val = trim($val);                           // Regla 5b
			if (strlen($val)>0) {   // Regla 6
				 // $val = utf8_encode(str_replace("|","/",$val)); // Regla 1
				$val = str_replace("|","/",$val); // Regla 1
				$nodo->setAttribute($key, htmlspecialchars($val, ENT_NOQUOTES, "UTF-8"));
			}
		}
	}
	// }}}
	// {{{ Formateo de la fecha en el formato XML requerido (ISO)
	function _xml_fech($fech) {
		
		if (empty($fech) ){
			return '';
		}
		$fecha=DateTime::createFromFormat ( 'Y-m-d H:i:s' , $fech );
		
		$strFecha = $fecha->format('Y-m-d').'T'.$fecha->format('H:i:s');
		return $strFecha;
	}
	
	
	/**
	 * Detalle de los conceptos/productos de la factura
	 */
	private function _conceptos(&$root, $xml, $arr) {
		 // print_r($arr); exit;
		// print_r($arr);
		$conceptos = $xml->createElement("cfdi:Conceptos");
		$conceptos = $root->appendChild($conceptos);
		for ($i=0; $i<sizeof($arr['conceptos']); $i++) {
			if ( empty($arr['conceptos'][$i]['descripcion']) || empty($arr['conceptos'][$i]['unidad']) ) continue;
			if ( !empty($arr['conceptos'][$i]['eliminado']) ) continue;
			
			$concepto = $xml->createElement("cfdi:Concepto");
			$concepto = $conceptos->appendChild($concepto);
			// $prun = $arr['conceptos'][$i]['valorUnitario'];
			
			
			$this->_cargaAtt($concepto, array("cantidad"=>$arr['conceptos'][$i]['cantidad'],
									  "unidad"=>$arr['conceptos'][$i]['unidad'],
									  "descripcion"=>$arr['conceptos'][$i]['descripcion'],
									  "valorUnitario"=>$arr['conceptos'][$i]['valorUnitario'],
									  "importe"=>round($arr['conceptos'][$i]['importe'],6),
						   )
						);
		}
	}
	/**
	 * Impuesto (IVA)
	 */
	function _impuestos(&$root, $xml, $arr) {
		
		$impuestos = $xml->createElement("cfdi:Impuestos");
		$impuestos = $root->appendChild($impuestos);
		
		$totTras = 0;
		$totRet = 0;
		
		$trasladosArr=array();
		$retencionesArr=array();
		
		$importe = $arr['subTotal'] - $arr['descuento'];
		
		// print_r($arr['impuestos']); exit;
		
		foreach($arr['impuestos'] as $imp){
			if ( empty($imp['seleccionado']) ) continue;
			
			if ($imp['naturaleza'] == 'TRASLADADO'){
				$trasladosArr[] = array(
						'nombre'=>$imp['nombre'],
						'tasa'=>$imp['tasa'] * 1,
						'importe'=>$imp['tasa'] * 1,
					);
				$totTras+= ( ($imp['tasa']/100) * $importe );
				
			}else if ($imp['naturaleza'] == 'RETENIDO'){
				if ( !isset($retencionesArr[$imp['nombre']]) ){
					$retencionesArr[$imp['nombre']] = ($imp['tasa'] * 1);
				}else{
					$retencionesArr[$imp['nombre']] = ($retencionesArr[$imp['nombre']]*1) + ($imp['tasa'] * 1);
				}
				$totRet+= (($imp['tasa']/100) * $importe);
			}
		}
			

		if ( !empty($retencionesArr) ) {
			$impuestos->SetAttribute("totalImpuestosRetenidos",round($totRet,6) );
			$traslados = $xml->createElement("cfdi:Retenciones");
			$traslados = $impuestos->appendChild($traslados);
			foreach($retencionesArr as $key => $value){
				$Retencion = $xml->createElement("cfdi:Retencion");
				$Retencion = $traslados->appendChild($Retencion);
				
				$cantidad = $importe * ($value/100);
				$this->_cargaAtt($Retencion, array("impuesto"=>$key,									  
										  "importe"=>round($cantidad, 6)
										 )
									 );
			}			
		}

		
		if ( !empty($trasladosArr) ) {
			$impuestos->SetAttribute("totalImpuestosTrasladados",round($totTras,6) );
		
			$traslados = $xml->createElement("cfdi:Traslados");
			$traslados = $impuestos->appendChild($traslados);
			foreach($trasladosArr as $value){
				$traslado = $xml->createElement("cfdi:Traslado");
				$traslado = $traslados->appendChild($traslado);
				
				$cantidad = $importe * ($value['tasa']/100);
				$this->_cargaAtt($traslado, array("impuesto"=>$value['nombre'],									  
										  "importe"=>round($cantidad,6),
										  'tasa'=>$value['tasa']
										 )
									 );
			}			
		}
		
		
		
		
	}
		
	/**
	 *  genera_cadena_original
	 */
	function _genera_cadena_original($xml) {
		//http://www.sat.gob.mx/sitio_internet/cfd/3/cadenaoriginal_3_0/cadenaoriginal_3_2.xslt		
		$paso = new DOMDocument;
		$paso->loadXML($xml->saveXML());
		$xsl = new DOMDocument;		
		
		//$file='http://www.sat.gob.mx/sitio_internet/cfd/3/cadenaoriginal_3_0/cadenaoriginal_3_2.xslt';
		// $file='http://www.sat.gob.mx/sitio_internet/cfd/3/cadenaoriginal_3_0/cadenaoriginal_3_2.xslt';
		$file='../sistema/cadenaoriginal_3_2.xslt';
		// $file = realpath ( '../sistema/cadenaoriginal_3_2.xslt' );
		$xsl->load($file);
		$proc = new XSLTProcessor;
		@$proc->importStyleSheet($xsl); 
		$cadena_original = $proc->transformToXML($paso);
		
		// $cadena_original = utf8_decode($cadena_original);
		 // echo $cadena_original ; exit;
		// echo md5($cadena_original); exit;
		return $cadena_original;
	}
	public function generarXml($factura){				
		// ehttp://www.lacorona.com.mx/fortiz/sat/xml.php
		
		// global $xml, $ret;
		
		$xml = new DOMdocument("1.0","UTF-8");
		
		// $root = $xml->createElement("Comprobante");
		$root = $xml->createElementNS('http://www.sat.gob.mx/cfd/3', 'cfdi:Comprobante');
		
		$root = $xml->appendChild($root);
		
		$sello='';
		
		
		
		  $this->_generales($root, $factura);
		  $this->_emisor($root, $xml, $factura);
		$this->_receptor($root, $xml, $factura);
		$this->_conceptos($root, $xml, $factura);				
		$this->_impuestos($root, $xml, $factura);
		
		$this->complementoNomina($root, $xml, $factura['nomina']);
		
		// $cadena = $this->_genera_cadena_original($xml);			
		// return array('success'=>false, 'msg'=>'ErROR DE PRUEBA');
		// $sello = $this->_sella($root, $factura, $cadena);
	
		
		return array(
			'xml'=>$xml,
			// 'sello'=>$sello,
			// 'cadena'=>$cadena,
			'success'=>true
		);
	}
	function generarNomina($nomina){
		// print_r($nomina); exit;
		$factura=array();
		$factura['nomina'] = $nomina;
		
		$factura['version']='3.2';
	    $factura['serie'] = $nomina['serie'];
		$factura['folio'] = $nomina['folio'];	
		// $fecha=DateTime::createFromFormat ( 'Y-m-dTH:i:s' ,  $nomina['fecha_emision'] );
		$factura['fecha'] =  $nomina['fecha_emision'];
		$factura['sello'] =  '@';
		$factura['formaDePago'] = $nomina['nombre_fk_forma_pago']; 
		$factura['noCertificado'] = $nomina['no_serie_fk_certificado']; 
		$factura['certificado'] = '@'; 
		
		$factura['subTotal'] = $nomina['subTotal']; 
		$factura['descuento'] = $nomina['descuento']; 
		$factura['motivoDescuento'] = $nomina['motivo_descuento']; 
		$factura['total'] = $nomina['total']; 
		$factura['condicionesDePago'] = $nomina['condiciones_de_pago']; 
		$factura['tipoDeComprobante'] = 'EGRESO'; 
		$factura['metodoDePago'] = $nomina['nombre_fk_metodo_pago']; 
		
		$factura['NumCtaPago'] = $nomina['num_cta_pago']; 
		$factura['TipoCambio'] = $nomina['tipo_cambio']; 
		
		$factura['FolioFiscalOrig'] ='';
		$factura['FechaFolioFiscalOrig'] ='';
		$factura['SerieFolioFiscalOrig'] ='';		  
		
		$factura['MontoFolioFiscalOrig'] = 0; 
		//----------------------------------------
		$fk_moneda=$nomina['fk_moneda'];
		$monMod = new monedaModelo();
		$moneda = $monMod->obtener($fk_moneda);		
		$factura['Moneda'] = $moneda['codigo']; 	
		//----------------------------------------
		$fk_patron=$nomina['fk_patron'];
		$empMod = new empresaModelo();
		$empresa = $empMod->obtener($fk_patron);		
		//----------------------------------------
		$factura['emisor_rfc'] = $empresa['rfc']; 
		$factura['emisor_razon_social'] = $empresa['razon_social']; 
		$factura['emisor_calle'] = $empresa['calle']; 
		$factura['emisor_numero_exterior'] = $empresa['noExterior']; 
		$factura['emisor_numero_interior'] = $empresa['noInterior']; 
		$factura['emisor_colonia'] = $empresa['colonia']; 
		$factura['emisor_municipio'] = $empresa['nombre_fk_municipio']; 
		$factura['emisor_estado'] = $empresa['nombre_fk_estado']; 
		$factura['emisor_pais'] = $empresa['nombre_fk_pais']; 
		$factura['emisor_codigoPostal'] = $empresa['codigoPostal']; 
		$factura['emisor_localidad'] = $empresa['localidad']; 
		$factura['emisor_referencia'] = $empresa['referencia']; 
		$factura['LugarExpedicion'] = $empresa['localidad'].', '.$empresa['nombre_fk_municipio'].', '.$empresa['nombre_fk_estado'].'. '.$empresa['nombre_fk_pais']; 
		$factura['regimen']='';
		foreach($empresa['regimen_fiscalDeEmpresa'] as $regimen){	
			$factura['regimen'].=$regimen['regimen'].', ';
		}
		$factura['regimen'] = substr($factura['regimen'], 0, strlen($factura['regimen'])-2 );
		//----------------------------------------				
		$fk_empleado=$nomina['fk_empleado'];
		$empMod = new trabajadorModelo();
		$empleado = $empMod->obtener($fk_empleado);			
		//----------------------------------------
		$factura['cliente_rfc'] = $empleado['rfc']; 
		$factura['cliente_nombre'] = $empleado['nombre']; 
		$factura['receptor_calle'] = $empleado['calle']; 
		$factura['receptor_numero_exterior'] = $empleado['noExterior']; 
		$factura['receptor_numero_interior'] = $empleado['noInterior']; 
		$factura['receptor_colonia'] = $empleado['colonia']; 
		$factura['receptor_localidad'] = $empleado['localidad']; 
		$factura['receptor_municipio'] = $empleado['nombre_fk_municipio']; 
		$factura['receptor_estado'] = $empleado['nombre_fk_estado']; 
		$factura['receptor_pais'] = utf8_encode($empleado['nombre_fk_pais']); 
		$factura['receptor_codigo_postal'] = $empleado['codigoPostal']; 
		$factura['receptor_localidad'] = $empleado['localidad']; 
		$factura['receptor_referencia'] = $empleado['referencia']; 
		//----------------------------------------
		$conceptosDeNomina=array();
		foreach($nomina['conceptosDeNomina'] as $concepto){
			$conceptosDeNomina[]=array(
				'cantidad'		=>$concepto['cantidad'],
				'unidad'		=>'Servicio',
				'descripcion'	=>$concepto['nombre_fk_concepto'],
				'valorUnitario' =>$concepto['valorUnitario'],
				'importe' 		=>$concepto['importe']
			);		
		}
		$factura['conceptos']=$conceptosDeNomina;
		//----------------------------------------				
		$impuestosDeNomina=array();
		// foreach($nomina['conceptosDeNomina'] as $concepto){
			// $impuestosDeNomina[]=array(
				// 'cantidad'		=>$concepto['cantidad'],
				// 'unidad'		=>'Servicio',
				// 'descripcion'	=>$concepto['nombre_fk_concepto'],
				// 'valorUnitario' =>$concepto['valorUnitario'],
				// 'importe' 		=>$concepto['importe']
			// );		
		// }
		$factura['impuestos']=$impuestosDeNomina;
		//----------------------------------------	
		$fk_TipoRegimen=$nomina['fk_TipoRegimen'];
		$regMod = new regimen_contratacionModelo();
		$regimen = $regMod->obtener($fk_TipoRegimen);		
		$nomina['TipoRegimen'] = $regimen['clave'];
		//----------------------------------------		
		$fk_Departamento=$nomina['fk_Departamento'];
		$depMod = new departamentoModelo();
		$depto = $depMod->obtener($fk_Departamento);		
		$nomina['Departamento'] = $depto['nombre'];
		//----------------------------------------
		$fk_Banco=$nomina['fk_banco'];
		$bancoMod = new bancoModelo();
		$banco = $bancoMod->obtener($fk_Banco);		
		$nomina['Banco'] = $banco['nombre_corto'];
		//----------------------------------------		
		$res = $this->generarXml($factura);
		$xml=$res['xml'];		
		file_put_contents('../nomina.xml', '  '.$xml->saveXML() );
		$valida = $this->_valida($xml->saveXML());
		// print_r( $valida );
		return $valida;
		// file_put_contents('../nomina.xml', $xml->saveXML());
	}
	function complementoNomina(&$root, $xml, $arr){
		 // xmlns:detallista="http://www.sat.gob.mx/detallista"
		
		
		$complemento = $xml->createElement("cfdi:Complemento");
		$complemento = $root->appendChild($complemento);
		
		 $nomina = $xml->createElementNS('http://www.sat.gob.mx/cfd/nomina/nomina.xslt', 'nomina:Nomina');		
		$nomina = $complemento->appendChild($nomina);
		
		// $nomina = $xml->createElement("nomina:Nomina");
		// $nomina = $complemento->appendChild($nomina);
		
		$this->_cargaAtt($nomina, array(
			"Version"=>'1.1',
			"RegistroPatronal"=>$arr['RegistroPatronal'],
			"NumEmpleado"=>$arr['NumEmpleado'],
			"CURP"=>$arr['CURP'],
			"TipoRegimen"=>$arr['TipoRegimen'],
			"NumSeguridadSocial"=>$arr['NumSeguridadSocial'],
			"FechaPago"=>$arr['FechaPago'],
			"FechaInicialPago"=>$arr['FechaInicialPago'],
			"FechaFinalPago"=>$arr['FechaFinalPago'],
			"NumDiasPagados"=>$arr['NumDiasPagados'],
			"Departamento"=>$arr['Departamento'],
			"CLABE"=>$arr['CLABE'],
			"Banco"=>$arr['Banco'],
			"FechaInicioRelLaboral"=>$arr['FechaInicioRelLaboral'],
			"Antiguedad"=>$arr['Antiguedad'],
			"Puesto"=>$arr['Puesto'],
			"TipoContrato"=>$arr['TipoContrato'],
			"TipoJornada"=>$arr['TipoJornada'],
			"PeriodicidadPago"=>$arr['PeriodicidadPago'],
			"SalarioBaseCotApor"=>$arr['SalarioBaseCotApor'],
			"RiesgoPuesto"=>$arr['RiesgoPuesto'],
			"SalarioDiarioIntegrado"=>$arr['SalarioDiarioIntegrado']
		));
		
	}
	function _receptor($root, $xml, $arr) {
		
		$receptor = $xml->createElement("cfdi:Receptor");
		$receptor = $root->appendChild($receptor);
		$this->_cargaAtt($receptor, array("rfc"=>$arr['cliente_rfc'],
								  "nombre"=>$arr['cliente_nombre']
							  )
						  );
		$domicilio = $xml->createElement("cfdi:Domicilio");
		$domicilio = $receptor->appendChild($domicilio);
		$this->_cargaAtt($domicilio, array("calle"=> $arr['receptor_calle'] ,
								"noExterior"=>$arr['receptor_numero_exterior'],
								"noInterior"=>$arr['receptor_numero_interior'],
							   "colonia"=>$arr['receptor_colonia'],
							   "municipio"=>$arr['receptor_municipio'],
							   "estado"=>$arr['receptor_estado'],
							   "pais"=>utf8_decode($arr['receptor_pais']),
							   "codigoPostal"=>$arr['receptor_codigo_postal'],
							   "localidad"=>$arr['receptor_localidad'],
							   "referencia"=>$arr['receptor_referencia']
						   )
					   );
		}
	function _emisor(&$root, $xml, $arr) {

	$emisor = $xml->createElement("cfdi:Emisor");
	$emisor = $root->appendChild($emisor);
	 // echo '<pre>'; print_r($arr);  echo '</pre>'; exit;
	$this->_cargaAtt($emisor, array("rfc"=>$arr['emisor_rfc'],
						   "nombre"=>$arr['emisor_razon_social']
					   )
					);
$domfis = $xml->createElement("cfdi:DomicilioFiscal");
$domfis = $emisor->appendChild($domfis);

$this->_cargaAtt($domfis, array("calle"=>$arr['emisor_calle'],
                        "noExterior"=>$arr['emisor_numero_exterior'],
                        "noInterior"=>$arr['emisor_numero_interior'],
                        "colonia"=>$arr['emisor_colonia'],
                        "municipio"=>$arr['emisor_municipio'],
                        "estado"=>$arr['emisor_estado'],
                        "pais"=>$arr['emisor_pais'],
                        "codigoPostal"=>$arr['emisor_codigoPostal'],
						"localidad"=>$arr['emisor_localidad'],
						"referencia"=>$arr['emisor_referencia'],
                   )
                );
	
	
	$regimenes=explode(',',$arr['regimen']);
	foreach($regimenes as $regEl){
		$regimen = $xml->createElement("cfdi:RegimenFiscal");
		$regimen = $emisor->appendChild($regimen);
		$this->_cargaAtt($regimen, array("Regimen"=>$regEl));
		
	}

}
// }}}
	function _valida($xml) {
		global $_PETICION;
		 $paso = new DOMDocument;				 
		 $paso->loadXML($xml );
		
		libxml_use_internal_errors(true);  

		// $file="http://www.sat.gob.mx/cfd/3/cfdv32.xsd";  
		$file='../nomina/cfdv32.xsd';
		$ok = @$paso->schemaValidate($file);
		$errors=array();
		
		if (!$ok){
			$errors = libxml_get_errors();			
			libxml_clear_errors();
		}
		
		return array(
			'success'=>$ok,
			'errores'=>$errors
		);
		
	}
}
?>