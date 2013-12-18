<?php
class concepto_documentoModelo extends Modelo{	
	var $tabla='transportes_concepto_documento';
	var $pk='id';
	var $campos= array('id', 'cantidad', 'concepto', 'um', 'precio_u', 'importe', 'fk_documento');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' concepto_documento.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='cantidad' ) {
					$filtros .= ' concepto_documento.cantidad like :cantidad OR ';
				} 
				if ( $filtro['dataKey']=='concepto' ) {
					$filtros .= ' concepto_documento.concepto like :concepto OR ';
				} 
				if ( $filtro['dataKey']=='um' ) {
					$filtros .= ' concepto_documento.um like :um OR ';
				} 
				if ( $filtro['dataKey']=='precio_u' ) {
					$filtros .= ' concepto_documento.precio_u like :precio_u OR ';
				} 
				if ( $filtro['dataKey']=='importe' ) {
					$filtros .= ' concepto_documento.importe like :importe OR ';
				} 
				if ( $filtro['dataKey']=='fk_documento' ) {
					$filtros .= ' concepto_documento.fk_documento like :fk_documento OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' concepto_documento '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='cantidad' ) {
				$sth->bindValue(':cantidad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='concepto' ) {
				$sth->bindValue(':concepto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='um' ) {
				$sth->bindValue(':um','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='precio_u' ) {
				$sth->bindValue(':precio_u','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='importe' ) {
				$sth->bindValue(':importe','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_documento' ) {
				$sth->bindValue(':fk_documento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT concepto_documento.id, concepto_documento.cantidad, concepto_documento.concepto, concepto_documento.um, concepto_documento.precio_u, concepto_documento.importe, concepto_documento.fk_documento FROM '.$this->tabla.' concepto_documento '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT concepto_documento.id, concepto_documento.cantidad, concepto_documento.concepto, concepto_documento.um, concepto_documento.precio_u, concepto_documento.importe, concepto_documento.fk_documento FROM '.$this->tabla.' concepto_documento '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='cantidad' ) {
				$sth->bindValue(':cantidad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='concepto' ) {
				$sth->bindValue(':concepto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='um' ) {
				$sth->bindValue(':um','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='precio_u' ) {
				$sth->bindValue(':precio_u','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='importe' ) {
				$sth->bindValue(':importe','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_documento' ) {
				$sth->bindValue(':fk_documento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['cantidad']='';
			$obj['concepto']='';
			$obj['um']='';
			$obj['precio_u']='';
			$obj['importe']='';
			$obj['fk_documento']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT concepto_documento.id, concepto_documento.cantidad, concepto_documento.concepto, concepto_documento.um, concepto_documento.precio_u, concepto_documento.importe, concepto_documento.fk_documento
 FROM transportes_concepto_documento AS concepto_documento
  WHERE concepto_documento.id=:id';
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
		 
		if ( isset( $datos['cantidad'] ) ){
			$strCampos .= ' cantidad=:cantidad, ';
		} 
		if ( isset( $datos['concepto'] ) ){
			$strCampos .= ' concepto=:concepto, ';
		} 
		if ( isset( $datos['um'] ) ){
			$strCampos .= ' um=:um, ';
		} 
		if ( isset( $datos['precio_u'] ) ){
			$strCampos .= ' precio_u=:precio_u, ';
		} 
		if ( isset( $datos['importe'] ) ){
			$strCampos .= ' importe=:importe, ';
		} 
		if ( isset( $datos['fk_documento'] ) ){
			$strCampos .= ' fk_documento=:fk_documento, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Concepto Creado';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Concepto Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['cantidad'] ) ){
			$sth->bindValue(':cantidad', $datos['cantidad'] );
		}
		if  ( isset( $datos['concepto'] ) ){
			$sth->bindValue(':concepto', $datos['concepto'] );
		}
		if  ( isset( $datos['um'] ) ){
			$sth->bindValue(':um', $datos['um'] );
		}
		if  ( isset( $datos['precio_u'] ) ){
			$sth->bindValue(':precio_u', $datos['precio_u'] );
		}
		if  ( isset( $datos['importe'] ) ){
			$sth->bindValue(':importe', $datos['importe'] );
		}
		if  ( isset( $datos['fk_documento'] ) ){
			$sth->bindValue(':fk_documento', $datos['fk_documento'] );
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