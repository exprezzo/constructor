<?php
class documentoModelo extends Modelo{	
	var $tabla='transportes_documento';
	var $pk='id';
	var $campos= array('fecha_creacion', 'fk_tipo_de_documento', 'nombre_tipo_de_documento', 'fk_serie', 'nombre_serie', 'folio', 'id', 'fk_transportador', 'nombre_socio', 'fk_remitente', 'nombre_socio', 'fk_destinatario', 'nombre_socio', 'fecha_entregar', 'origen', 'destino', 'fecha_vencimiento', 'fecha_cargar', 'fecha_cargado', 'medio_de_transporte', 'datos_del_vehiculo', 'datos_del_chofer');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='fecha_creacion' ) {
					$filtros .= ' documento.fecha_creacion like :fecha_creacion OR ';
				} 
				if ( $filtro['dataKey']=='fk_tipo_de_documento' ) {
					$filtros .= ' documento.fk_tipo_de_documento like :fk_tipo_de_documento OR ';
				} 
				if ( $filtro['dataKey']=='nombre_tipo_de_documento' ) {
					$filtros .= ' tipo_de_documento0.nombre like :nombre_tipo_de_documento OR ';
				} 
				if ( $filtro['dataKey']=='fk_serie' ) {
					$filtros .= ' documento.fk_serie like :fk_serie OR ';
				} 
				if ( $filtro['dataKey']=='nombre_serie' ) {
					$filtros .= ' serie1.nombre like :nombre_serie OR ';
				} 
				if ( $filtro['dataKey']=='folio' ) {
					$filtros .= ' documento.folio like :folio OR ';
				} 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' documento.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='fk_transportador' ) {
					$filtros .= ' documento.fk_transportador like :fk_transportador OR ';
				} 
				if ( $filtro['dataKey']=='nombre_socio' ) {
					$filtros .= ' socio2.nombre like :nombre_socio OR ';
				} 
				if ( $filtro['dataKey']=='fk_remitente' ) {
					$filtros .= ' documento.fk_remitente like :fk_remitente OR ';
				} 
				if ( $filtro['dataKey']=='nombre_socio' ) {
					$filtros .= ' socio3.nombre like :nombre_socio OR ';
				} 
				if ( $filtro['dataKey']=='fk_destinatario' ) {
					$filtros .= ' documento.fk_destinatario like :fk_destinatario OR ';
				} 
				if ( $filtro['dataKey']=='nombre_socio' ) {
					$filtros .= ' socio4.nombre like :nombre_socio OR ';
				} 
				if ( $filtro['dataKey']=='fecha_entregar' ) {
					$filtros .= ' documento.fecha_entregar like :fecha_entregar OR ';
				} 
				if ( $filtro['dataKey']=='origen' ) {
					$filtros .= ' documento.origen like :origen OR ';
				} 
				if ( $filtro['dataKey']=='destino' ) {
					$filtros .= ' documento.destino like :destino OR ';
				} 
				if ( $filtro['dataKey']=='fecha_vencimiento' ) {
					$filtros .= ' documento.fecha_vencimiento like :fecha_vencimiento OR ';
				} 
				if ( $filtro['dataKey']=='fecha_cargar' ) {
					$filtros .= ' documento.fecha_cargar like :fecha_cargar OR ';
				} 
				if ( $filtro['dataKey']=='fecha_cargado' ) {
					$filtros .= ' documento.fecha_cargado like :fecha_cargado OR ';
				} 
				if ( $filtro['dataKey']=='medio_de_transporte' ) {
					$filtros .= ' documento.medio_de_transporte like :medio_de_transporte OR ';
				} 
				if ( $filtro['dataKey']=='datos_del_vehiculo' ) {
					$filtros .= ' documento.datos_del_vehiculo like :datos_del_vehiculo OR ';
				} 
				if ( $filtro['dataKey']=='datos_del_chofer' ) {
					$filtros .= ' documento.datos_del_chofer like :datos_del_chofer OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN transportes_tipo_documento AS tipo_de_documento0 ON tipo_de_documento0.id = documento.fk_tipo_de_documento
 LEFT JOIN transportes_serie AS serie1 ON serie1.id = documento.fk_serie
 LEFT JOIN transportes_socio AS socio2 ON socio2.id = documento.fk_transportador
 LEFT JOIN transportes_socio AS socio3 ON socio3.id = documento.fk_remitente
 LEFT JOIN transportes_socio AS socio4 ON socio4.id = documento.fk_destinatario';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' documento '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='fecha_creacion' ) {
				$sth->bindValue(':fecha_creacion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_tipo_de_documento' ) {
				$sth->bindValue(':fk_tipo_de_documento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_tipo_de_documento' ) {
				$sth->bindValue(':nombre_tipo_de_documento', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_serie' ) {
				$sth->bindValue(':fk_serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_serie' ) {
				$sth->bindValue(':nombre_serie', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio' ) {
				$sth->bindValue(':folio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_transportador' ) {
				$sth->bindValue(':fk_transportador','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_socio' ) {
				$sth->bindValue(':nombre_socio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_remitente' ) {
				$sth->bindValue(':fk_remitente','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_socio' ) {
				$sth->bindValue(':nombre_socio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_destinatario' ) {
				$sth->bindValue(':fk_destinatario','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_socio' ) {
				$sth->bindValue(':nombre_socio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_entregar' ) {
				$sth->bindValue(':fecha_entregar','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='origen' ) {
				$sth->bindValue(':origen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='destino' ) {
				$sth->bindValue(':destino','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_vencimiento' ) {
				$sth->bindValue(':fecha_vencimiento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_cargar' ) {
				$sth->bindValue(':fecha_cargar','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_cargado' ) {
				$sth->bindValue(':fecha_cargado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='medio_de_transporte' ) {
				$sth->bindValue(':medio_de_transporte','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='datos_del_vehiculo' ) {
				$sth->bindValue(':datos_del_vehiculo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='datos_del_chofer' ) {
				$sth->bindValue(':datos_del_chofer','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT documento.fecha_creacion, documento.fk_tipo_de_documento, tipo_de_documento0.nombre AS nombre_fk_tipo_de_documento, documento.fk_serie, serie1.nombre AS nombre_fk_serie, documento.folio, documento.id, documento.fk_transportador, socio2.nombre AS nombre_fk_transportador, documento.fk_remitente, socio3.nombre AS nombre_fk_remitente, documento.fk_destinatario, socio4.nombre AS nombre_fk_destinatario, documento.fecha_entregar, documento.origen, documento.destino, documento.fecha_vencimiento, documento.fecha_cargar, documento.fecha_cargado, documento.medio_de_transporte, documento.datos_del_vehiculo, documento.datos_del_chofer FROM '.$this->tabla.' documento '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT documento.fecha_creacion, documento.fk_tipo_de_documento, tipo_de_documento0.nombre AS nombre_fk_tipo_de_documento, documento.fk_serie, serie1.nombre AS nombre_fk_serie, documento.folio, documento.id, documento.fk_transportador, socio2.nombre AS nombre_fk_transportador, documento.fk_remitente, socio3.nombre AS nombre_fk_remitente, documento.fk_destinatario, socio4.nombre AS nombre_fk_destinatario, documento.fecha_entregar, documento.origen, documento.destino, documento.fecha_vencimiento, documento.fecha_cargar, documento.fecha_cargado, documento.medio_de_transporte, documento.datos_del_vehiculo, documento.datos_del_chofer FROM '.$this->tabla.' documento '.$joins.$filtros;
		}
				
		$sth = $pdo->prepare($sql);
		if ($paginar){
			$sth->bindValue(':limit',$limit,PDO::PARAM_INT);
			$sth->bindValue(':start',$start,PDO::PARAM_INT);
		}
		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='fecha_creacion' ) {
				$sth->bindValue(':fecha_creacion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_tipo_de_documento' ) {
				$sth->bindValue(':fk_tipo_de_documento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_tipo_de_documento' ) {
				$sth->bindValue(':nombre_tipo_de_documento', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_serie' ) {
				$sth->bindValue(':fk_serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_serie' ) {
				$sth->bindValue(':nombre_serie', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio' ) {
				$sth->bindValue(':folio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_transportador' ) {
				$sth->bindValue(':fk_transportador','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_socio' ) {
				$sth->bindValue(':nombre_socio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_remitente' ) {
				$sth->bindValue(':fk_remitente','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_socio' ) {
				$sth->bindValue(':nombre_socio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_destinatario' ) {
				$sth->bindValue(':fk_destinatario','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_socio' ) {
				$sth->bindValue(':nombre_socio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_entregar' ) {
				$sth->bindValue(':fecha_entregar','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='origen' ) {
				$sth->bindValue(':origen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='destino' ) {
				$sth->bindValue(':destino','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_vencimiento' ) {
				$sth->bindValue(':fecha_vencimiento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_cargar' ) {
				$sth->bindValue(':fecha_cargar','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha_cargado' ) {
				$sth->bindValue(':fecha_cargado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='medio_de_transporte' ) {
				$sth->bindValue(':medio_de_transporte','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='datos_del_vehiculo' ) {
				$sth->bindValue(':datos_del_vehiculo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='datos_del_chofer' ) {
				$sth->bindValue(':datos_del_chofer','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
		
			$obj['fecha_creacion']='';
			$obj['fk_tipo_de_documento']='';
			$obj['nombre_tipo_de_documento']='';
			$obj['fk_serie']='';
			$obj['nombre_serie']='';
			$obj['folio']='';
			$obj['id']='';
			$obj['fk_transportador']='';
			$obj['nombre_socio']='';
			$obj['fk_remitente']='';
			$obj['nombre_socio']='';
			$obj['fk_destinatario']='';
			$obj['nombre_socio']='';
			$obj['fecha_entregar']='';
			$obj['origen']='';
			$obj['destino']='';
			$obj['fecha_vencimiento']='';
			$obj['fecha_cargar']='';
			$obj['fecha_cargado']='';
			$obj['medio_de_transporte']='';
			$obj['datos_del_vehiculo']='';
			$obj['datos_del_chofer']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT documento.fecha_creacion, documento.fk_tipo_de_documento, tipo_de_documento0.nombre AS nombre_fk_tipo_de_documento, documento.fk_serie, serie1.nombre AS nombre_fk_serie, documento.folio, documento.id, documento.fk_transportador, socio2.nombre AS nombre_fk_transportador, documento.fk_remitente, socio3.nombre AS nombre_fk_remitente, documento.fk_destinatario, socio4.nombre AS nombre_fk_destinatario, documento.fecha_entregar, documento.origen, documento.destino, documento.fecha_vencimiento, documento.fecha_cargar, documento.fecha_cargado, documento.medio_de_transporte, documento.datos_del_vehiculo, documento.datos_del_chofer
 FROM transportes_documento AS documento
 LEFT JOIN transportes_tipo_documento AS tipo_de_documento0 ON tipo_de_documento0.id = documento.fk_tipo_de_documento
 LEFT JOIN transportes_serie AS serie1 ON serie1.id = documento.fk_serie
 LEFT JOIN transportes_socio AS socio2 ON socio2.id = documento.fk_transportador
 LEFT JOIN transportes_socio AS socio3 ON socio3.id = documento.fk_remitente
 LEFT JOIN transportes_socio AS socio4 ON socio4.id = documento.fk_destinatario
  WHERE documento.id=:id';
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
		 
		if ( isset( $datos['fecha_creacion'] ) ){
			$strCampos .= ' fecha_creacion=:fecha_creacion, ';
		} 
		if ( isset( $datos['fk_tipo_de_documento'] ) ){
			$strCampos .= ' fk_tipo_de_documento=:fk_tipo_de_documento, ';
		} 
		if ( isset( $datos['fk_serie'] ) ){
			$strCampos .= ' fk_serie=:fk_serie, ';
		} 
		if ( isset( $datos['folio'] ) ){
			$strCampos .= ' folio=:folio, ';
		} 
		if ( isset( $datos['fk_transportador'] ) ){
			$strCampos .= ' fk_transportador=:fk_transportador, ';
		} 
		if ( isset( $datos['fk_remitente'] ) ){
			$strCampos .= ' fk_remitente=:fk_remitente, ';
		} 
		if ( isset( $datos['fk_destinatario'] ) ){
			$strCampos .= ' fk_destinatario=:fk_destinatario, ';
		} 
		if ( isset( $datos['fecha_entregar'] ) ){
			$strCampos .= ' fecha_entregar=:fecha_entregar, ';
		} 
		if ( isset( $datos['origen'] ) ){
			$strCampos .= ' origen=:origen, ';
		} 
		if ( isset( $datos['destino'] ) ){
			$strCampos .= ' destino=:destino, ';
		} 
		if ( isset( $datos['fecha_vencimiento'] ) ){
			$strCampos .= ' fecha_vencimiento=:fecha_vencimiento, ';
		} 
		if ( isset( $datos['fecha_cargar'] ) ){
			$strCampos .= ' fecha_cargar=:fecha_cargar, ';
		} 
		if ( isset( $datos['fecha_cargado'] ) ){
			$strCampos .= ' fecha_cargado=:fecha_cargado, ';
		} 
		if ( isset( $datos['medio_de_transporte'] ) ){
			$strCampos .= ' medio_de_transporte=:medio_de_transporte, ';
		} 
		if ( isset( $datos['datos_del_vehiculo'] ) ){
			$strCampos .= ' datos_del_vehiculo=:datos_del_vehiculo, ';
		} 
		if ( isset( $datos['datos_del_chofer'] ) ){
			$strCampos .= ' datos_del_chofer=:datos_del_chofer, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Documento Creado';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Documento Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['fecha_creacion'] ) ){
			$sth->bindValue(':fecha_creacion', $datos['fecha_creacion'] );
		}
		if  ( isset( $datos['fk_tipo_de_documento'] ) ){
			$sth->bindValue(':fk_tipo_de_documento', $datos['fk_tipo_de_documento'] );
		}
		if  ( isset( $datos['fk_serie'] ) ){
			$sth->bindValue(':fk_serie', $datos['fk_serie'] );
		}
		if  ( isset( $datos['folio'] ) ){
			$sth->bindValue(':folio', $datos['folio'] );
		}
		if  ( isset( $datos['fk_transportador'] ) ){
			$sth->bindValue(':fk_transportador', $datos['fk_transportador'] );
		}
		if  ( isset( $datos['fk_remitente'] ) ){
			$sth->bindValue(':fk_remitente', $datos['fk_remitente'] );
		}
		if  ( isset( $datos['fk_destinatario'] ) ){
			$sth->bindValue(':fk_destinatario', $datos['fk_destinatario'] );
		}
		if  ( isset( $datos['fecha_entregar'] ) ){
			$sth->bindValue(':fecha_entregar', $datos['fecha_entregar'] );
		}
		if  ( isset( $datos['origen'] ) ){
			$sth->bindValue(':origen', $datos['origen'] );
		}
		if  ( isset( $datos['destino'] ) ){
			$sth->bindValue(':destino', $datos['destino'] );
		}
		if  ( isset( $datos['fecha_vencimiento'] ) ){
			$sth->bindValue(':fecha_vencimiento', $datos['fecha_vencimiento'] );
		}
		if  ( isset( $datos['fecha_cargar'] ) ){
			$sth->bindValue(':fecha_cargar', $datos['fecha_cargar'] );
		}
		if  ( isset( $datos['fecha_cargado'] ) ){
			$sth->bindValue(':fecha_cargado', $datos['fecha_cargado'] );
		}
		if  ( isset( $datos['medio_de_transporte'] ) ){
			$sth->bindValue(':medio_de_transporte', $datos['medio_de_transporte'] );
		}
		if  ( isset( $datos['datos_del_vehiculo'] ) ){
			$sth->bindValue(':datos_del_vehiculo', $datos['datos_del_vehiculo'] );
		}
		if  ( isset( $datos['datos_del_chofer'] ) ){
			$sth->bindValue(':datos_del_chofer', $datos['datos_del_chofer'] );
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
		return array(
			'success'=>true,
			'datos'=>$obj,
			'msg'=>$msg
		);
		
	}
}
?>