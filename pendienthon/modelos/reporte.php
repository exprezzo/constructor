<?php
class reporteModelo extends Modelo{	
	var $tabla='pendienthon_reporte';
	var $pk='id';
	var $campos= array('id', 'descripcion', 'num_reporte', 'fk_autor', 'nombre_usuario', 'fk_solicitante', 'nombre_usuario', 'fk_empresa', 'nombre_empresa', 'status');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' reporte.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='descripcion' ) {
					$filtros .= ' reporte.descripcion like :descripcion OR ';
				} 
				if ( $filtro['dataKey']=='num_reporte' ) {
					$filtros .= ' reporte.num_reporte like :num_reporte OR ';
				} 
				if ( $filtro['dataKey']=='fk_autor' ) {
					$filtros .= ' reporte.fk_autor like :fk_autor OR ';
				} 
				if ( $filtro['dataKey']=='nombre_usuario' ) {
					$filtros .= ' usuario0.nombre like :nombre_usuario OR ';
				} 
				if ( $filtro['dataKey']=='fk_solicitante' ) {
					$filtros .= ' reporte.fk_solicitante like :fk_solicitante OR ';
				} 
				if ( $filtro['dataKey']=='nombre_usuario' ) {
					$filtros .= ' usuario1.nombre like :nombre_usuario OR ';
				} 
				if ( $filtro['dataKey']=='fk_empresa' ) {
					$filtros .= ' reporte.fk_empresa like :fk_empresa OR ';
				} 
				if ( $filtro['dataKey']=='nombre_empresa' ) {
					$filtros .= ' empresa2.nombre like :nombre_empresa OR ';
				} 
				if ( $filtro['dataKey']=='status' ) {
					$filtros .= ' reporte.status like :status OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN pendienthon_usuarios AS usuario0 ON usuario0.id = reporte.fk_autor
 LEFT JOIN pendienthon_usuarios AS usuario1 ON usuario1.id = reporte.fk_solicitante
 LEFT JOIN pendienthon_empresa AS empresa2 ON empresa2.id = reporte.fk_empresa';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' reporte '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion' ) {
				$sth->bindValue(':descripcion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='num_reporte' ) {
				$sth->bindValue(':num_reporte','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_autor' ) {
				$sth->bindValue(':fk_autor','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_usuario' ) {
				$sth->bindValue(':nombre_usuario', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_solicitante' ) {
				$sth->bindValue(':fk_solicitante','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_usuario' ) {
				$sth->bindValue(':nombre_usuario', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_empresa' ) {
				$sth->bindValue(':fk_empresa','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_empresa' ) {
				$sth->bindValue(':nombre_empresa', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='status' ) {
				$sth->bindValue(':status','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT reporte.id, reporte.descripcion, reporte.num_reporte, reporte.fk_autor, usuario0.nombre AS nombre_fk_autor, reporte.fk_solicitante, usuario1.nombre AS nombre_fk_solicitante, reporte.fk_empresa, empresa2.nombre AS nombre_fk_empresa, reporte.status FROM '.$this->tabla.' reporte '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT reporte.id, reporte.descripcion, reporte.num_reporte, reporte.fk_autor, usuario0.nombre AS nombre_fk_autor, reporte.fk_solicitante, usuario1.nombre AS nombre_fk_solicitante, reporte.fk_empresa, empresa2.nombre AS nombre_fk_empresa, reporte.status FROM '.$this->tabla.' reporte '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='descripcion' ) {
				$sth->bindValue(':descripcion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='num_reporte' ) {
				$sth->bindValue(':num_reporte','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_autor' ) {
				$sth->bindValue(':fk_autor','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_usuario' ) {
				$sth->bindValue(':nombre_usuario', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_solicitante' ) {
				$sth->bindValue(':fk_solicitante','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_usuario' ) {
				$sth->bindValue(':nombre_usuario', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_empresa' ) {
				$sth->bindValue(':fk_empresa','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_empresa' ) {
				$sth->bindValue(':nombre_empresa', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='status' ) {
				$sth->bindValue(':status','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['descripcion']='';
			$obj['num_reporte']='';
			$obj['fk_autor']='';
			$obj['nombre_usuario']='';
			$obj['fk_solicitante']='';
			$obj['nombre_usuario']='';
			$obj['fk_empresa']='';
			$obj['nombre_empresa']='';
			$obj['status']='';
			$obj['eventosDeReporte']=array();
			
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT reporte.id, reporte.descripcion, reporte.num_reporte, reporte.fk_autor, usuario0.nombre AS nombre_fk_autor, reporte.fk_solicitante, usuario1.nombre AS nombre_fk_solicitante, reporte.fk_empresa, empresa2.nombre AS nombre_fk_empresa, reporte.status
 FROM pendienthon_reporte AS reporte
 LEFT JOIN pendienthon_usuarios AS usuario0 ON usuario0.id = reporte.fk_autor
 LEFT JOIN pendienthon_usuarios AS usuario1 ON usuario1.id = reporte.fk_solicitante
 LEFT JOIN pendienthon_empresa AS empresa2 ON empresa2.id = reporte.fk_empresa
  WHERE reporte.id=:id';
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
		
				//----------------------------
				$conceptosMod=new eventoModelo();
				$params=array(
					'filtros'=>array(
						array(
							'filterValue'=>$modelos[0]['id'],
							'filterOperator'=>'equals',
							'dataKey'=>'fk_reporte'
						)
					)
				);
				$eventosDeReporte=$conceptosMod->buscar($params);				
				$modelos[0]['eventosDeReporte'] =$eventosDeReporte['datos'];
				//---------------------------
				
		return $modelos[0];			
	}
	
	function guardar( $datos ){
	
		$esNuevo=( empty( $datos['id'] ) )? true : false;			
		$strCampos='';
		
		//--------------------------------------------
		// CAMPOS A GUARDAR
		 
		if ( isset( $datos['descripcion'] ) ){
			$strCampos .= ' descripcion=:descripcion, ';
		} 
		if ( isset( $datos['num_reporte'] ) ){
			$strCampos .= ' num_reporte=:num_reporte, ';
		} 
		if ( isset( $datos['fk_autor'] ) ){
			$strCampos .= ' fk_autor=:fk_autor, ';
		} 
		if ( isset( $datos['fk_solicitante'] ) ){
			$strCampos .= ' fk_solicitante=:fk_solicitante, ';
		} 
		if ( isset( $datos['fk_empresa'] ) ){
			$strCampos .= ' fk_empresa=:fk_empresa, ';
		} 
		if ( isset( $datos['status'] ) ){
			$strCampos .= ' status=:status, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Nuevo Reporte';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Reporte Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['descripcion'] ) ){
			$sth->bindValue(':descripcion', $datos['descripcion'] );
		}
		if  ( isset( $datos['num_reporte'] ) ){
			$sth->bindValue(':num_reporte', $datos['num_reporte'] );
		}
		if  ( isset( $datos['fk_autor'] ) ){
			$sth->bindValue(':fk_autor', $datos['fk_autor'] );
		}
		if  ( isset( $datos['fk_solicitante'] ) ){
			$sth->bindValue(':fk_solicitante', $datos['fk_solicitante'] );
		}
		if  ( isset( $datos['fk_empresa'] ) ){
			$sth->bindValue(':fk_empresa', $datos['fk_empresa'] );
		}
		if  ( isset( $datos['status'] ) ){
			$sth->bindValue(':status', $datos['status'] );
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
		
		
		
		
		$eventoMod = new eventoModelo();
		foreach( $datos['eventosDeReporte'] as $el ){
			if ( !empty($el['eliminado']) ){
				if ( !empty($el['id']) ){
					$res = $eventoMod->eliminar( array('id'=>$el['id']) );
					if ($res )$res =array('success'=>true);
				}else{
					$res=array('success'=>true);
				}					
			 }else{
				unset( $el['eliminado'] );
				$el['fk_reporte']=$idObj;
				// if ( empty($concepto['nombre'])  )  continue;
				$res = $eventoMod->guardar($el);
			 }
			
			
			//-----
			//
			//$res=$eventoMod->guardar($el);
			//if ( !$res['success'] ){											
			//	return $res;
			//}
			
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