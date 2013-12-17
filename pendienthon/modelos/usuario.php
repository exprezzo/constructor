<?php
class usuarioModelo extends Modelo{	
	var $tabla='pendienthon_usuarios';
	var $pk='id';
	var $campos= array('id', 'nick', 'nombre', 'email', 'pass', 'ip_login', 'last_login', 'fk_rol', 'nombre_rol', 'fk_empresa', 'nombre_empresa');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' usuario.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='nick' ) {
					$filtros .= ' usuario.nick like :nick OR ';
				} 
				if ( $filtro['dataKey']=='nombre' ) {
					$filtros .= ' usuario.nombre like :nombre OR ';
				} 
				if ( $filtro['dataKey']=='email' ) {
					$filtros .= ' usuario.email like :email OR ';
				} 
				if ( $filtro['dataKey']=='pass' ) {
					$filtros .= ' usuario.pass like :pass OR ';
				} 
				if ( $filtro['dataKey']=='ip_login' ) {
					$filtros .= ' usuario.ip_login like :ip_login OR ';
				} 
				if ( $filtro['dataKey']=='last_login' ) {
					$filtros .= ' usuario.last_login like :last_login OR ';
				} 
				if ( $filtro['dataKey']=='fk_rol' ) {
					$filtros .= ' usuario.fk_rol like :fk_rol OR ';
				} 
				if ( $filtro['dataKey']=='nombre_rol' ) {
					$filtros .= ' rol0.nombre like :nombre_rol OR ';
				} 
				if ( $filtro['dataKey']=='fk_empresa' ) {
					$filtros .= ' usuario.fk_empresa like :fk_empresa OR ';
				} 
				if ( $filtro['dataKey']=='nombre_empresa' ) {
					$filtros .= ' empresa1.nombre like :nombre_empresa OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN pentienthon_rol AS rol0 ON rol0.id = usuario.fk_rol
 LEFT JOIN pendienthon_empresa AS empresa1 ON empresa1.id = usuario.fk_empresa';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' usuario '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nick' ) {
				$sth->bindValue(':nick','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='email' ) {
				$sth->bindValue(':email','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='pass' ) {
				$sth->bindValue(':pass','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='ip_login' ) {
				$sth->bindValue(':ip_login','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='last_login' ) {
				$sth->bindValue(':last_login','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_rol' ) {
				$sth->bindValue(':fk_rol','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_rol' ) {
				$sth->bindValue(':nombre_rol', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_empresa' ) {
				$sth->bindValue(':fk_empresa','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_empresa' ) {
				$sth->bindValue(':nombre_empresa', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT usuario.id, usuario.nick, usuario.nombre, usuario.email, usuario.pass, usuario.ip_login, usuario.last_login, usuario.fk_rol, rol0.nombre AS nombre_rol, usuario.fk_empresa, empresa1.nombre AS nombre_empresa FROM '.$this->tabla.' usuario '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT usuario.id, usuario.nick, usuario.nombre, usuario.email, usuario.pass, usuario.ip_login, usuario.last_login, usuario.fk_rol, rol0.nombre AS nombre_rol, usuario.fk_empresa, empresa1.nombre AS nombre_empresa FROM '.$this->tabla.' usuario '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='nick' ) {
				$sth->bindValue(':nick','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='email' ) {
				$sth->bindValue(':email','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='pass' ) {
				$sth->bindValue(':pass','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='ip_login' ) {
				$sth->bindValue(':ip_login','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='last_login' ) {
				$sth->bindValue(':last_login','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_rol' ) {
				$sth->bindValue(':fk_rol','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_rol' ) {
				$sth->bindValue(':nombre_rol', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_empresa' ) {
				$sth->bindValue(':fk_empresa','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_empresa' ) {
				$sth->bindValue(':nombre_empresa', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['nick']='';
			$obj['nombre']='';
			$obj['email']='';
			$obj['pass']='';
			$obj['ip_login']='';
			$obj['last_login']='';
			$obj['fk_rol']='';
			$obj['nombre_rol']='';
			$obj['fk_empresa']='';
			$obj['nombre_empresa']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT usuario.id, usuario.nick, usuario.nombre, usuario.email, usuario.pass, usuario.ip_login, usuario.last_login, usuario.fk_rol, rol0.nombre AS nombre_rol, usuario.fk_empresa, empresa1.nombre AS nombre_empresa
 FROM pendienthon_usuarios AS usuario
 LEFT JOIN pentienthon_rol AS rol0 ON rol0.id = usuario.fk_rol
 LEFT JOIN pendienthon_empresa AS empresa1 ON empresa1.id = usuario.fk_empresa
  WHERE usuario.id=:id';
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
		 
		if ( isset( $datos['nick'] ) ){
			$strCampos .= ' nick=:nick, ';
		} 
		if ( isset( $datos['nombre'] ) ){
			$strCampos .= ' nombre=:nombre, ';
		} 
		if ( isset( $datos['email'] ) ){
			$strCampos .= ' email=:email, ';
		} 
		if ( isset( $datos['pass'] ) ){
			$strCampos .= ' pass=:pass, ';
		} 
		if ( isset( $datos['ip_login'] ) ){
			$strCampos .= ' ip_login=:ip_login, ';
		} 
		if ( isset( $datos['last_login'] ) ){
			$strCampos .= ' last_login=:last_login, ';
		} 
		if ( isset( $datos['fk_rol'] ) ){
			$strCampos .= ' fk_rol=:fk_rol, ';
		} 
		if ( isset( $datos['fk_empresa'] ) ){
			$strCampos .= ' fk_empresa=:fk_empresa, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Usuario Creado';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Usuario Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['nick'] ) ){
			$sth->bindValue(':nick', $datos['nick'] );
		}
		if  ( isset( $datos['nombre'] ) ){
			$sth->bindValue(':nombre', $datos['nombre'] );
		}
		if  ( isset( $datos['email'] ) ){
			$sth->bindValue(':email', $datos['email'] );
		}
		if  ( isset( $datos['pass'] ) ){
			$sth->bindValue(':pass', $datos['pass'] );
		}
		if  ( isset( $datos['ip_login'] ) ){
			$sth->bindValue(':ip_login', $datos['ip_login'] );
		}
		if  ( isset( $datos['last_login'] ) ){
			$sth->bindValue(':last_login', $datos['last_login'] );
		}
		if  ( isset( $datos['fk_rol'] ) ){
			$sth->bindValue(':fk_rol', $datos['fk_rol'] );
		}
		if  ( isset( $datos['fk_empresa'] ) ){
			$sth->bindValue(':fk_empresa', $datos['fk_empresa'] );
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