<?php

require_once $_PETICION->basePath.'/modelos/nomina.php';
require_once $_PETICION->basePath.'/presentacion/html.php/nominas/nomina_pdf.php';

require_once $_PETICION->basePath.'/modelos/empresa.php';

require_once $_PETICION->basePath.'/modelos/trabajador.php';

require_once $_PETICION->basePath.'/modelos/serie_nomina.php';

require_once $_PETICION->basePath.'/modelos/regimen_contratacion.php';

require_once $_PETICION->basePath.'/modelos/departamento.php';

require_once $_PETICION->basePath.'/modelos/regimen_contratacion.php';

require_once $_PETICION->basePath.'/modelos/jornada.php';

require_once $_PETICION->basePath.'/modelos/periodo_pago.php';

require_once $_PETICION->basePath.'/modelos/banco.php';

require_once $_PETICION->basePath.'/modelos/riesgo.php';

require_once $_PETICION->basePath.'/modelos/percepcion_nomina.php';

require_once $_PETICION->basePath.'/modelos/deduccion_nomina.php';

require_once $_PETICION->basePath.'/modelos/incapacidad.php';

require_once $_PETICION->basePath.'/modelos/hora_extra_nomina.php';

require_once $_PETICION->basePath.'/modelos/forma_de_pago.php';

require_once $_PETICION->basePath.'/modelos/certificado.php';

require_once $_PETICION->basePath.'/modelos/moneda.php';

require_once $_PETICION->basePath.'/modelos/metodo_de_pago.php';

require_once $_PETICION->basePath.'/modelos/concepto_de_nomina.php';

require_once $_PETICION->basePath.'/modelos/impuesto_de_nomina.php';
require_once $_PETICION->basePath.'/nomina_xml.php';
require_once $_PETICION->basePath.'/modelos/regimen.php';

class nominas extends Controlador{
	var $modelo="nomina";	
	
	
		function buscarEmpresa(){
			$empresaMod= new empresaModelo();
			$res = $empresaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarTrabajador(){
			$trabajadorMod= new trabajadorModelo();
			$res = $trabajadorMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarSerie_nomina(){
			$serie_nominaMod= new serie_nominaModelo();
			$res = $serie_nominaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarRegimen_contratacion(){
			$regimen_contratacionMod= new regimen_contratacionModelo();
			$res = $regimen_contratacionMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarDepartamento(){
			$departamentoMod= new departamentoModelo();
			$res = $departamentoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarJornada(){
			$jornadaMod= new jornadaModelo();
			$res = $jornadaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarPeriodo_pago(){
			$periodo_pagoMod= new periodo_pagoModelo();
			$res = $periodo_pagoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarBanco(){
			$bancoMod= new bancoModelo();
			$res = $bancoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarRiesgo(){
			$riesgoMod= new riesgoModelo();
			$res = $riesgoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarForma_de_pago(){
			$forma_de_pagoMod= new forma_de_pagoModelo();
			$res = $forma_de_pagoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarCertificado(){
			$certificadoMod= new certificadoModelo();
			$res = $certificadoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarMoneda(){
			$monedaMod= new monedaModelo();
			$res = $monedaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarMetodo_de_pago(){
			$metodo_de_pagoMod= new metodo_de_pagoModelo();
			$res = $metodo_de_pagoMod->buscar( array() );
			echo json_encode( $res );
		}
		
	
	function bajarPdf(){
		//-------
		$mod= $this->getModelo();
		global $_PETICION;
		$id=$_PETICION->params[0];
		$datos= $mod->obtener( $id );
		//-------
		$objPdf = new NominaPdf('P','mm','letter');
		$objPdf->datos=$datos;
		$objPdf->AddPage();
		$objPdf->imprimir(  );
		//-------
		$path='../';
		$nombreArchivo=$objPdf->titulo.'_'.$datos['id'];			
		//http://stackoverflow.com/questions/2021624/string-sanitizer-for-filename			
		$nombreArchivo = preg_replace('/[^a-zA-Z0-9-_\.]/','_', $nombreArchivo);
		$fullPath=$path.$nombreArchivo.'.pdf';
		$pdfStr=$objPdf->Output($fullPath, 'S');
		//-------
		header ("Content-Length: ".strlen($pdfStr)); 
		header ("Content-Disposition: attachment; filename=".$nombreArchivo.'.pdf');
		header ("Content-Type: application/octet-stream");
		echo $pdfStr;
	}
		
	function mostrarVista( $archivos=""){
		$vista= $this->getVista();
		
		global $_TEMA_APP;
		global $_PETICION;
		return $vista->mostrarTema($_PETICION, $_TEMA_APP);
	}
	
	function nuevo(){		
		$modelo = $this->getModelo();
		$obj=$modelo->nuevo( array() );
		
		$vista=$this->getVista();
		$vista->datos=$obj;		
		
		global $_TEMA_APP;
		global $_PETICION;
		$_PETICION->accion="edicion";
		return $vista->mostrarTema($_PETICION, $_TEMA_APP);
		
	
	}
	
	function guardar(){
		$modelo=$this->getModelo();
		$esNuevo = empty( $_POST['datos'][$modelo->pk] );
		
		ob_start();
		$res = parent::guardar();
		ob_end_clean();
		
		if ( !$res['success'] ){			
			echo json_encode($res);
			return $res;
		}
		
		if ( $esNuevo ){					
			$res['esNuevo']=true;				
			sessionSet('res', $res);			
		}
		
		$nomXml = new nominaXml();
		$resN = $nomXml->generarNomina( $res['datos'] );
		
		if ( !$resN['success']){
			// $resN['msg']='errores en el XML';
			echo json_encode($resN);
		}else{
			echo json_encode($res);
		}
		
		return $res;
	}
	function eliminar(){
		return parent::eliminar();
	}
	function editar(){
		global $_PETICION;
		// print_r($_PETICION);
		if ( isset($_PETICION->params[0]) )
		$_REQUEST['id'] = $_PETICION->params[0];
		
		// return parent::editar();
		$id=empty( $_REQUEST['id'])? 0 : $_REQUEST['id'];
		$model=$this->getModelo();
		$params=array(
			$model->pk=>$id
		);		
		
		$obj=$model->obtener( $id );			
		$vista=$this->getVista();				
		$vista->datos=$obj;		
		
		global $_PETICION;
		global $_TEMA_APP;
		$_PETICION->accion="edicion";
		$vista->mostrarTema($_PETICION,$_TEMA_APP);
	}
	function buscar(){
		if ( $_SERVER['REQUEST_METHOD']=='POST'  ){
			return parent::buscar();			
		}else{
			global $_PETICION, $_TEMA_APP;
			$vista = $this->getVista();
			$_PETICION->accion='busqueda';
			return $vista->mostrarTema($_PETICION, $_TEMA_APP);
		}
	}
}
?>