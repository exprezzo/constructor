<?php
class serieModelo extends Modelo{	
	var $tabla='makinas_serie';
	var $pk='id';
	var $campos= array('id', 'serie', 'fk_owner', 'nombre_owner', 'folio_sig');
	
	function getSigFolio($id_serie){
		
		$serie = $this->obtener($id_serie);			
		$sigFolio = $serie['sig_folio'] + 1;
		
		
		return array(
			'success'=>true,
			'sigFolio'=>$sigFolio
		);
	}
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' serie.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='serie' ) {
					$filtros .= ' serie.serie like :serie OR ';
				} 
				if ( $filtro['dataKey']=='fk_owner' ) {
					$filtros .= ' serie.fk_owner like :fk_owner OR ';
				} 
				if ( $filtro['dataKey']=='nombre_owner' ) {
					$filtros .= ' owner0.nombre like :nombre_owner OR ';
				} 
				if ( $filtro['dataKey']=='folio_sig' ) {
					$filtros .= ' serie.folio_sig like :folio_sig OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN makina_owner AS owner0 ON owner0.id = serie.fk_owner';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' serie '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='serie' ) {
				$sth->bindValue(':serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_owner' ) {
				$sth->bindValue(':fk_owner','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_owner' ) {
				$sth->bindValue(':nombre_owner', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio_sig' ) {
				$sth->bindValue(':folio_sig','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT serie.id, serie.serie, serie.fk_owner, owner0.nombre AS nombre_fk_owner, serie.folio_sig FROM '.$this->tabla.' serie '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT serie.id, serie.serie, serie.fk_owner, owner0.nombre AS nombre_fk_owner, serie.folio_sig FROM '.$this->tabla.' serie '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='serie' ) {
				$sth->bindValue(':serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_owner' ) {
				$sth->bindValue(':fk_owner','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_owner' ) {
				$sth->bindValue(':nombre_owner', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio_sig' ) {
				$sth->bindValue(':folio_sig','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['serie']='';
			$obj['fk_owner']='';
			$obj['nombre_owner']='';
			$obj['folio_sig']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT serie.id, serie.serie, serie.fk_owner, owner0.nombre AS nombre_fk_owner, serie.folio_sig
 FROM makinas_serie AS serie
 LEFT JOIN makina_owner AS owner0 ON owner0.id = serie.fk_owner
  WHERE serie.id=:id';
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
		 
		if ( isset( $datos['serie'] ) ){
			$strCampos .= ' serie=:serie, ';
		} 
		if ( isset( $datos['fk_owner'] ) ){
			$strCampos .= ' fk_owner=:fk_owner, ';
		} 
		if ( isset( $datos['folio_sig'] ) ){
			$strCampos .= ' folio_sig=:folio_sig, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Serie Creada';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Serie Actualizada';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['serie'] ) ){
			$sth->bindValue(':serie', $datos['serie'] );
		}
		if  ( isset( $datos['fk_owner'] ) ){
			$sth->bindValue(':fk_owner', $datos['fk_owner'] );
		}
		if  ( isset( $datos['folio_sig'] ) ){
			$sth->bindValue(':folio_sig', $datos['folio_sig'] );
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