<?php
class eventoModelo extends Modelo{	
	var $tabla='pendienthon_evento';
	var $pk='id';
	var $campos= array('id', 'fecha', 'descripcion', 'fk_autor', 'nombre_usuario', 'estado', 'fk_reporte', 'num_reporte_reporte');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' evento.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='fecha' ) {
					$filtros .= ' evento.fecha like :fecha OR ';
				} 
				if ( $filtro['dataKey']=='descripcion' ) {
					$filtros .= ' evento.descripcion like :descripcion OR ';
				} 
				if ( $filtro['dataKey']=='fk_autor' ) {
					$filtros .= ' evento.fk_autor like :fk_autor OR ';
				} 
				if ( $filtro['dataKey']=='nombre_usuario' ) {
					$filtros .= ' usuario0.nombre like :nombre_usuario OR ';
				} 
				if ( $filtro['dataKey']=='estado' ) {
					$filtros .= ' evento.estado like :estado OR ';
				} 
				if ( $filtro['dataKey']=='fk_reporte' ) {
					$filtros .= ' evento.fk_reporte like :fk_reporte OR ';
				} 
				if ( $filtro['dataKey']=='num_reporte_reporte' ) {
					$filtros .= ' reporte1.num_reporte like :num_reporte_reporte OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN pendienthon_usuarios AS usuario0 ON usuario0.id = evento.fk_autor
 LEFT JOIN pendienthon_reporte AS reporte1 ON reporte1.id = evento.fk_reporte';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' evento '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha' ) {
				$sth->bindValue(':fecha','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion' ) {
				$sth->bindValue(':descripcion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_autor' ) {
				$sth->bindValue(':fk_autor','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_usuario' ) {
				$sth->bindValue(':nombre_usuario', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='estado' ) {
				$sth->bindValue(':estado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_reporte' ) {
				$sth->bindValue(':fk_reporte','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='num_reporte_reporte' ) {
				$sth->bindValue(':num_reporte_reporte', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT evento.id, evento.fecha, evento.descripcion, evento.fk_autor, usuario0.nombre AS nombre_fk_autor, evento.estado, evento.fk_reporte, reporte1.num_reporte AS num_reporte_fk_reporte FROM '.$this->tabla.' evento '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT evento.id, evento.fecha, evento.descripcion, evento.fk_autor, usuario0.nombre AS nombre_fk_autor, evento.estado, evento.fk_reporte, reporte1.num_reporte AS num_reporte_fk_reporte FROM '.$this->tabla.' evento '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='fecha' ) {
				$sth->bindValue(':fecha','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion' ) {
				$sth->bindValue(':descripcion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_autor' ) {
				$sth->bindValue(':fk_autor','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_usuario' ) {
				$sth->bindValue(':nombre_usuario', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='estado' ) {
				$sth->bindValue(':estado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_reporte' ) {
				$sth->bindValue(':fk_reporte','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='num_reporte_reporte' ) {
				$sth->bindValue(':num_reporte_reporte', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['fecha']='';
			$obj['descripcion']='';
			$obj['fk_autor']='';
			$obj['nombre_usuario']='';
			$obj['estado']='';
			$obj['fk_reporte']='';
			$obj['num_reporte_reporte']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT evento.id, evento.fecha, evento.descripcion, evento.fk_autor, usuario0.nombre AS nombre_fk_autor, evento.estado, evento.fk_reporte, reporte1.num_reporte AS num_reporte_fk_reporte
 FROM pendienthon_evento AS evento
 LEFT JOIN pendienthon_usuarios AS usuario0 ON usuario0.id = evento.fk_autor
 LEFT JOIN pendienthon_reporte AS reporte1 ON reporte1.id = evento.fk_reporte
  WHERE evento.id=:id';
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
		 
		if ( isset( $datos['fecha'] ) ){
			$strCampos .= ' fecha=:fecha, ';
		} 
		if ( isset( $datos['descripcion'] ) ){
			$strCampos .= ' descripcion=:descripcion, ';
		} 
		if ( isset( $datos['fk_autor'] ) ){
			$strCampos .= ' fk_autor=:fk_autor, ';
		} 
		if ( isset( $datos['estado'] ) ){
			$strCampos .= ' estado=:estado, ';
		} 
		if ( isset( $datos['fk_reporte'] ) ){
			$strCampos .= ' fk_reporte=:fk_reporte, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Evento Creado';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Evento Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['fecha'] ) ){
			$sth->bindValue(':fecha', $datos['fecha'] );
		}
		if  ( isset( $datos['descripcion'] ) ){
			$sth->bindValue(':descripcion', $datos['descripcion'] );
		}
		if  ( isset( $datos['fk_autor'] ) ){
			$sth->bindValue(':fk_autor', $datos['fk_autor'] );
		}
		if  ( isset( $datos['estado'] ) ){
			$sth->bindValue(':estado', $datos['estado'] );
		}
		if  ( isset( $datos['fk_reporte'] ) ){
			$sth->bindValue(':fk_reporte', $datos['fk_reporte'] );
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