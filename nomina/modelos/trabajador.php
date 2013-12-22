<?php
require_once '../php_libs/tcpdf/tcpdf.php';
require_once $_PETICION->basePath.'/presentacion/html.php/trabajadores/trabajador_pdf.php';
class trabajadorModelo extends Modelo{	
	var $tabla='nomina_trabajador';
	var $pk='id';
	var $campos= array('id', 'nombre', 'rfc', 'email', 'CURP', 'fk_TipoRegimen', 'nombre_regimen_contratacion', 'NumSeguridadSocial', 'calle', 'noExterior', 'noInterior', 'colonia', 'localidad', 'referencia', 'fk_pais', 'nombre_pais', 'fk_estado', 'nombre_estado', 'fk_municipio', 'nombre_municipio', 'codigoPostal', 'NoEmpleado');
	
	function generaPdf( $datos ){
		$nominaPdf = new TrabajadorPdf('P','mm','letter');
		$nominaPdf->datos=$datos;
		$nominaPdf->AddPage();
		$nominaPdf->imprimir(  );
		$path='../nomina/archivos/';
		$nombreArchivo=$nominaPdf->titulo.'_'.$datos['id'];
			
		//http://stackoverflow.com/questions/2021624/string-sanitizer-for-filename
		// $nombreArchivo = preg_replace("([^\w\s\d\-_~,;:\[\]\(\]]|[\.]{2,})", '', $nombreArchivo);
		// $nombreArchivo=preg_replace("[^\w\s\d\.\-_~,;:\[\]\(\]]", '', $nombreArchivo);
		$nombreArchivo = preg_replace('/[^a-zA-Z0-9-_\.]/','_', $nombreArchivo);
		$fullPath=$path.$nombreArchivo.'.pdf';
		$nominaStr=$nominaPdf->Output($fullPath, 'F');
		// echo $fullPath; exit;
		// echo $nominaStr; exit;
	}
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' trabajador.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='nombre' ) {
					$filtros .= ' trabajador.nombre like :nombre OR ';
				} 
				if ( $filtro['dataKey']=='rfc' ) {
					$filtros .= ' trabajador.rfc like :rfc OR ';
				} 
				if ( $filtro['dataKey']=='email' ) {
					$filtros .= ' trabajador.email like :email OR ';
				} 
				if ( $filtro['dataKey']=='CURP' ) {
					$filtros .= ' trabajador.CURP like :CURP OR ';
				} 
				if ( $filtro['dataKey']=='fk_TipoRegimen' ) {
					$filtros .= ' trabajador.fk_TipoRegimen like :fk_TipoRegimen OR ';
				} 
				if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
					$filtros .= ' regimen_contratacion0.nombre like :nombre_regimen_contratacion OR ';
				} 
				if ( $filtro['dataKey']=='NumSeguridadSocial' ) {
					$filtros .= ' trabajador.NumSeguridadSocial like :NumSeguridadSocial OR ';
				} 
				if ( $filtro['dataKey']=='calle' ) {
					$filtros .= ' trabajador.calle like :calle OR ';
				} 
				if ( $filtro['dataKey']=='noExterior' ) {
					$filtros .= ' trabajador.noExterior like :noExterior OR ';
				} 
				if ( $filtro['dataKey']=='noInterior' ) {
					$filtros .= ' trabajador.noInterior like :noInterior OR ';
				} 
				if ( $filtro['dataKey']=='colonia' ) {
					$filtros .= ' trabajador.colonia like :colonia OR ';
				} 
				if ( $filtro['dataKey']=='localidad' ) {
					$filtros .= ' trabajador.localidad like :localidad OR ';
				} 
				if ( $filtro['dataKey']=='referencia' ) {
					$filtros .= ' trabajador.referencia like :referencia OR ';
				} 
				if ( $filtro['dataKey']=='fk_pais' ) {
					$filtros .= ' trabajador.fk_pais like :fk_pais OR ';
				} 
				if ( $filtro['dataKey']=='nombre_pais' ) {
					$filtros .= ' pais1.nombre like :nombre_pais OR ';
				} 
				if ( $filtro['dataKey']=='fk_estado' ) {
					$filtros .= ' trabajador.fk_estado like :fk_estado OR ';
				} 
				if ( $filtro['dataKey']=='nombre_estado' ) {
					$filtros .= ' estado2.nombre like :nombre_estado OR ';
				} 
				if ( $filtro['dataKey']=='fk_municipio' ) {
					$filtros .= ' trabajador.fk_municipio like :fk_municipio OR ';
				} 
				if ( $filtro['dataKey']=='nombre_municipio' ) {
					$filtros .= ' municipio3.nombre like :nombre_municipio OR ';
				} 
				if ( $filtro['dataKey']=='codigoPostal' ) {
					$filtros .= ' trabajador.codigoPostal like :codigoPostal OR ';
				} 
				if ( $filtro['dataKey']=='NoEmpleado' ) {
					$filtros .= ' trabajador.NoEmpleado like :NoEmpleado OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN nomina_regimen_contratacion AS regimen_contratacion0 ON regimen_contratacion0.id = trabajador.fk_TipoRegimen
 LEFT JOIN system_ubicacion_paises AS pais1 ON pais1.id = trabajador.fk_pais
 LEFT JOIN system_ubicacion_estados AS estado2 ON estado2.id = trabajador.fk_estado
 LEFT JOIN system_ubicacion_municipios AS municipio3 ON municipio3.id = trabajador.fk_municipio';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' trabajador '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='rfc' ) {
				$sth->bindValue(':rfc','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='email' ) {
				$sth->bindValue(':email','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='CURP' ) {
				$sth->bindValue(':CURP','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_TipoRegimen' ) {
				$sth->bindValue(':fk_TipoRegimen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
				$sth->bindValue(':nombre_regimen_contratacion', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumSeguridadSocial' ) {
				$sth->bindValue(':NumSeguridadSocial','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='calle' ) {
				$sth->bindValue(':calle','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='noExterior' ) {
				$sth->bindValue(':noExterior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='noInterior' ) {
				$sth->bindValue(':noInterior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='colonia' ) {
				$sth->bindValue(':colonia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='localidad' ) {
				$sth->bindValue(':localidad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='referencia' ) {
				$sth->bindValue(':referencia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_pais' ) {
				$sth->bindValue(':fk_pais','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_pais' ) {
				$sth->bindValue(':nombre_pais', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_estado' ) {
				$sth->bindValue(':fk_estado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_estado' ) {
				$sth->bindValue(':nombre_estado', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_municipio' ) {
				$sth->bindValue(':fk_municipio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_municipio' ) {
				$sth->bindValue(':nombre_municipio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='codigoPostal' ) {
				$sth->bindValue(':codigoPostal','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NoEmpleado' ) {
				$sth->bindValue(':NoEmpleado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}		
			}
		}
		$exito = $sth->execute();		
		if ( !$exito ){
			$error = $this->getError( $sth );
			throw new Exception($error['msg']); //TODO: agregar numero de error, crear una exception MiEscepcion
		}
		
		$tot = $sth->fetchAll(PDO::FETCH_ASSOC);
		$total = $tot[0]['total'];
		
		$paginar=false;
		if ( isset($params['limit']) && isset($params['start']) ){
			$paginar=true;
		}
		
		if ($paginar){
			$limit=$params['limit'];
			$start=$params['start'];
			$sql = 'SELECT trabajador.id, trabajador.nombre, trabajador.rfc, trabajador.email, trabajador.CURP, trabajador.fk_TipoRegimen, regimen_contratacion0.nombre AS nombre_fk_TipoRegimen, trabajador.NumSeguridadSocial, trabajador.calle, trabajador.noExterior, trabajador.noInterior, trabajador.colonia, trabajador.localidad, trabajador.referencia, trabajador.fk_pais, pais1.nombre AS nombre_fk_pais, trabajador.fk_estado, estado2.nombre AS nombre_fk_estado, trabajador.fk_municipio, municipio3.nombre AS nombre_fk_municipio, trabajador.codigoPostal, trabajador.NoEmpleado FROM '.$this->tabla.' trabajador '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT trabajador.id, trabajador.nombre, trabajador.rfc, trabajador.email, trabajador.CURP, trabajador.fk_TipoRegimen, regimen_contratacion0.nombre AS nombre_fk_TipoRegimen, trabajador.NumSeguridadSocial, trabajador.calle, trabajador.noExterior, trabajador.noInterior, trabajador.colonia, trabajador.localidad, trabajador.referencia, trabajador.fk_pais, pais1.nombre AS nombre_fk_pais, trabajador.fk_estado, estado2.nombre AS nombre_fk_estado, trabajador.fk_municipio, municipio3.nombre AS nombre_fk_municipio, trabajador.codigoPostal, trabajador.NoEmpleado FROM '.$this->tabla.' trabajador '.$joins.$filtros;
		}
				
		$sth = $pdo->prepare($sql);
		if ($paginar){
			$sth->bindValue(':limit',$limit,PDO::PARAM_INT);
			$sth->bindValue(':start',$start,PDO::PARAM_INT);
		}
		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='rfc' ) {
				$sth->bindValue(':rfc','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='email' ) {
				$sth->bindValue(':email','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='CURP' ) {
				$sth->bindValue(':CURP','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_TipoRegimen' ) {
				$sth->bindValue(':fk_TipoRegimen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
				$sth->bindValue(':nombre_regimen_contratacion', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumSeguridadSocial' ) {
				$sth->bindValue(':NumSeguridadSocial','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='calle' ) {
				$sth->bindValue(':calle','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='noExterior' ) {
				$sth->bindValue(':noExterior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='noInterior' ) {
				$sth->bindValue(':noInterior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='colonia' ) {
				$sth->bindValue(':colonia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='localidad' ) {
				$sth->bindValue(':localidad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='referencia' ) {
				$sth->bindValue(':referencia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_pais' ) {
				$sth->bindValue(':fk_pais','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_pais' ) {
				$sth->bindValue(':nombre_pais', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_estado' ) {
				$sth->bindValue(':fk_estado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_estado' ) {
				$sth->bindValue(':nombre_estado', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_municipio' ) {
				$sth->bindValue(':fk_municipio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_municipio' ) {
				$sth->bindValue(':nombre_municipio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='codigoPostal' ) {
				$sth->bindValue(':codigoPostal','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NoEmpleado' ) {
				$sth->bindValue(':NoEmpleado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}	
			}
		}
		$exito = $sth->execute();

		
		if ( !$exito ){		
			$error = $this->getError( $sth );
			throw new Exception($error['msg']); //TODO: agregar numero de error, crear una exception MiEscepcion			
		}
		
		$modelos = $sth->fetchAll(PDO::FETCH_ASSOC);				
		
		return array(
			'success'=>true,
			'total'=>$total,
			'datos'=>$modelos
		);
	}
	
	function nuevo( $params ){
		$obj=array();
		
			$obj['id']='';
			$obj['nombre']='';
			$obj['rfc']='';
			$obj['email']='';
			$obj['CURP']='';
			$obj['fk_TipoRegimen']='';
			$obj['nombre_regimen_contratacion']='';
			$obj['NumSeguridadSocial']='';
			$obj['calle']='';
			$obj['noExterior']='';
			$obj['noInterior']='';
			$obj['colonia']='';
			$obj['localidad']='';
			$obj['referencia']='';
			$obj['fk_pais']='';
			$obj['nombre_pais']='';
			$obj['fk_estado']='';
			$obj['nombre_estado']='';
			$obj['fk_municipio']='';
			$obj['nombre_municipio']='';
			$obj['codigoPostal']='';
			$obj['NoEmpleado']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT trabajador.id, trabajador.nombre, trabajador.rfc, trabajador.email, trabajador.CURP, trabajador.fk_TipoRegimen, regimen_contratacion0.nombre AS nombre_fk_TipoRegimen, trabajador.NumSeguridadSocial, trabajador.calle, trabajador.noExterior, trabajador.noInterior, trabajador.colonia, trabajador.localidad, trabajador.referencia, trabajador.fk_pais, pais1.nombre AS nombre_fk_pais, trabajador.fk_estado, estado2.nombre AS nombre_fk_estado, trabajador.fk_municipio, municipio3.nombre AS nombre_fk_municipio, trabajador.codigoPostal, trabajador.NoEmpleado
 FROM nomina_trabajador AS trabajador
 LEFT JOIN nomina_regimen_contratacion AS regimen_contratacion0 ON regimen_contratacion0.id = trabajador.fk_TipoRegimen
 LEFT JOIN system_ubicacion_paises AS pais1 ON pais1.id = trabajador.fk_pais
 LEFT JOIN system_ubicacion_estados AS estado2 ON estado2.id = trabajador.fk_estado
 LEFT JOIN system_ubicacion_municipios AS municipio3 ON municipio3.id = trabajador.fk_municipio
  WHERE trabajador.id=:id';
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		 $sth->BindValue(':id',$llave ); 
		$exito = $sth->execute();
		if ( !$exito ){
			$error =  $this->getError( $sth );
			throw new Exception($error['msg']);
		}
		
		$modelos = $sth->fetchAll(PDO::FETCH_ASSOC);
		
		if ( empty($modelos) ){						
			throw new Exception("Elemento no encontrado");
		}
		
		if ( sizeof($modelos) > 1 ){			
			throw new Exception("El identificador está duplicado"); //TODO: agregar numero de error, crear una exception MiEscepcion
		}
		
		return $modelos[0];			
	}
	
	function guardar( $datos ){
	
		$esNuevo=( empty( $datos['id'] ) )? true : false;			
		$strCampos='';
		
		//--------------------------------------------
		// CAMPOS A GUARDAR
		 
		if ( isset( $datos['nombre'] ) ){
			$strCampos .= ' nombre=:nombre, ';
		} 
		if ( isset( $datos['rfc'] ) ){
			$strCampos .= ' rfc=:rfc, ';
		} 
		if ( isset( $datos['email'] ) ){
			$strCampos .= ' email=:email, ';
		} 
		if ( isset( $datos['CURP'] ) ){
			$strCampos .= ' CURP=:CURP, ';
		} 
		if ( isset( $datos['fk_TipoRegimen'] ) ){
			$strCampos .= ' fk_TipoRegimen=:fk_TipoRegimen, ';
		} 
		if ( isset( $datos['NumSeguridadSocial'] ) ){
			$strCampos .= ' NumSeguridadSocial=:NumSeguridadSocial, ';
		} 
		if ( isset( $datos['calle'] ) ){
			$strCampos .= ' calle=:calle, ';
		} 
		if ( isset( $datos['noExterior'] ) ){
			$strCampos .= ' noExterior=:noExterior, ';
		} 
		if ( isset( $datos['noInterior'] ) ){
			$strCampos .= ' noInterior=:noInterior, ';
		} 
		if ( isset( $datos['colonia'] ) ){
			$strCampos .= ' colonia=:colonia, ';
		} 
		if ( isset( $datos['localidad'] ) ){
			$strCampos .= ' localidad=:localidad, ';
		} 
		if ( isset( $datos['referencia'] ) ){
			$strCampos .= ' referencia=:referencia, ';
		} 
		if ( isset( $datos['fk_pais'] ) ){
			$strCampos .= ' fk_pais=:fk_pais, ';
		} 
		if ( isset( $datos['fk_estado'] ) ){
			$strCampos .= ' fk_estado=:fk_estado, ';
		} 
		if ( isset( $datos['fk_municipio'] ) ){
			$strCampos .= ' fk_municipio=:fk_municipio, ';
		} 
		if ( isset( $datos['codigoPostal'] ) ){
			$strCampos .= ' codigoPostal=:codigoPostal, ';
		} 
		if ( isset( $datos['NoEmpleado'] ) ){
			$strCampos .= ' NoEmpleado=:NoEmpleado, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Trabajador Creado';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Trabajador Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['nombre'] ) ){
			$sth->bindValue(':nombre', $datos['nombre'] );
		}
		if  ( isset( $datos['rfc'] ) ){
			$sth->bindValue(':rfc', $datos['rfc'] );
		}
		if  ( isset( $datos['email'] ) ){
			$sth->bindValue(':email', $datos['email'] );
		}
		if  ( isset( $datos['CURP'] ) ){
			$sth->bindValue(':CURP', $datos['CURP'] );
		}
		if  ( isset( $datos['fk_TipoRegimen'] ) ){
			$sth->bindValue(':fk_TipoRegimen', $datos['fk_TipoRegimen'] );
		}
		if  ( isset( $datos['NumSeguridadSocial'] ) ){
			$sth->bindValue(':NumSeguridadSocial', $datos['NumSeguridadSocial'] );
		}
		if  ( isset( $datos['calle'] ) ){
			$sth->bindValue(':calle', $datos['calle'] );
		}
		if  ( isset( $datos['noExterior'] ) ){
			$sth->bindValue(':noExterior', $datos['noExterior'] );
		}
		if  ( isset( $datos['noInterior'] ) ){
			$sth->bindValue(':noInterior', $datos['noInterior'] );
		}
		if  ( isset( $datos['colonia'] ) ){
			$sth->bindValue(':colonia', $datos['colonia'] );
		}
		if  ( isset( $datos['localidad'] ) ){
			$sth->bindValue(':localidad', $datos['localidad'] );
		}
		if  ( isset( $datos['referencia'] ) ){
			$sth->bindValue(':referencia', $datos['referencia'] );
		}
		if  ( isset( $datos['fk_pais'] ) ){
			$sth->bindValue(':fk_pais', $datos['fk_pais'] );
		}
		if  ( isset( $datos['fk_estado'] ) ){
			$sth->bindValue(':fk_estado', $datos['fk_estado'] );
		}
		if  ( isset( $datos['fk_municipio'] ) ){
			$sth->bindValue(':fk_municipio', $datos['fk_municipio'] );
		}
		if  ( isset( $datos['codigoPostal'] ) ){
			$sth->bindValue(':codigoPostal', $datos['codigoPostal'] );
		}
		if  ( isset( $datos['NoEmpleado'] ) ){
			$sth->bindValue(':NoEmpleado', $datos['NoEmpleado'] );
		}		
		if ( !$esNuevo)	{
			$sth->bindValue(':id', $datos['id'] );
		}	
		//--------------------------------------------
		$exito = $sth->execute();
		if ( !$exito ){
			$error =  $this->getError( $sth );
			throw new Exception($error['msg']);
		}
		
		if ( $esNuevo ){
			$idObj=$pdo->lastInsertId();
		}else{
			$idObj=$datos['id'];
		}	
		
		
		
		
		$obj=$this->obtener( $idObj );
		$this->generaPdf( $obj );
		return array(
			'success'=>true,
			'datos'=>$obj,
			'msg'=>$msg
		);
		
	}
}
?>