<?php
class maquinaModelo extends Modelo{	
	var $tabla='makinas_maquina';
	var $pk='id';
	var $campos= array('id', 'nombre', 'ganancias', 'gastos', 'saldo', 'descripcion', 'fk_owner', 'nombre_owner');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' maquina.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='nombre' ) {
					$filtros .= ' maquina.nombre like :nombre OR ';
				} 
				if ( $filtro['dataKey']=='ganancias' ) {
					$filtros .= ' maquina.ganancias like :ganancias OR ';
				} 
				if ( $filtro['dataKey']=='gastos' ) {
					$filtros .= ' maquina.gastos like :gastos OR ';
				} 
				if ( $filtro['dataKey']=='saldo' ) {
					$filtros .= ' maquina.saldo like :saldo OR ';
				} 
				if ( $filtro['dataKey']=='descripcion' ) {
					$filtros .= ' maquina.descripcion like :descripcion OR ';
				} 
				if ( $filtro['dataKey']=='fk_owner' ) {
					$filtros .= ' maquina.fk_owner like :fk_owner OR ';
				} 
				if ( $filtro['dataKey']=='nombre_owner' ) {
					$filtros .= ' owner0.nombre like :nombre_owner OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN makina_owner AS owner0 ON owner0.id = maquina.fk_owner';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' maquina '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='ganancias' ) {
				$sth->bindValue(':ganancias','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='gastos' ) {
				$sth->bindValue(':gastos','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='saldo' ) {
				$sth->bindValue(':saldo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion' ) {
				$sth->bindValue(':descripcion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_owner' ) {
				$sth->bindValue(':fk_owner','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_owner' ) {
				$sth->bindValue(':nombre_owner', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT maquina.id, maquina.nombre, maquina.ganancias, maquina.gastos, maquina.saldo, maquina.descripcion, maquina.fk_owner, owner0.nombre AS nombre_fk_owner FROM '.$this->tabla.' maquina '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT maquina.id, maquina.nombre, maquina.ganancias, maquina.gastos, maquina.saldo, maquina.descripcion, maquina.fk_owner, owner0.nombre AS nombre_fk_owner FROM '.$this->tabla.' maquina '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='ganancias' ) {
				$sth->bindValue(':ganancias','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='gastos' ) {
				$sth->bindValue(':gastos','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='saldo' ) {
				$sth->bindValue(':saldo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion' ) {
				$sth->bindValue(':descripcion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_owner' ) {
				$sth->bindValue(':fk_owner','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_owner' ) {
				$sth->bindValue(':nombre_owner', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['ganancias']='';
			$obj['gastos']='';
			$obj['saldo']='';
			$obj['descripcion']='';
			$obj['fk_owner']='';
			$obj['nombre_owner']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT maquina.id, maquina.nombre, maquina.ganancias, maquina.gastos, maquina.saldo, maquina.descripcion, maquina.fk_owner, owner0.nombre AS nombre_fk_owner
 FROM makinas_maquina AS maquina
 LEFT JOIN makina_owner AS owner0 ON owner0.id = maquina.fk_owner
  WHERE maquina.id=:id';
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
		if ( isset( $datos['ganancias'] ) ){
			$strCampos .= ' ganancias=:ganancias, ';
		} 
		if ( isset( $datos['gastos'] ) ){
			$strCampos .= ' gastos=:gastos, ';
		} 
		if ( isset( $datos['saldo'] ) ){
			$strCampos .= ' saldo=:saldo, ';
		} 
		if ( isset( $datos['descripcion'] ) ){
			$strCampos .= ' descripcion=:descripcion, ';
		} 
		if ( isset( $datos['fk_owner'] ) ){
			$strCampos .= ' fk_owner=:fk_owner, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Maquina Creada';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Maquina Actualizada';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['nombre'] ) ){
			$sth->bindValue(':nombre', $datos['nombre'] );
		}
		if  ( isset( $datos['ganancias'] ) ){
			$sth->bindValue(':ganancias', $datos['ganancias'] );
		}
		if  ( isset( $datos['gastos'] ) ){
			$sth->bindValue(':gastos', $datos['gastos'] );
		}
		if  ( isset( $datos['saldo'] ) ){
			$sth->bindValue(':saldo', $datos['saldo'] );
		}
		if  ( isset( $datos['descripcion'] ) ){
			$sth->bindValue(':descripcion', $datos['descripcion'] );
		}
		if  ( isset( $datos['fk_owner'] ) ){
			$sth->bindValue(':fk_owner', $datos['fk_owner'] );
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