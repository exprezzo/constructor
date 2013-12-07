<?php
class PlantillaModelo extends Modelo{	
	var $tabla;
	function obtener( $llave ){		
		$sql = '{SQL-obtener}';
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//{FILTRO-OBTENER}
		$exito = $sth->execute();
		if ( !$exito ){
			$error =  $this->getError();
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
	
		$esNuevo=( empty( $datos['{CAMPOLLAVE}'] ) )? true : false;			
		$strCampos='';
		
		//--------------------------------------------
		// CAMPOS A GUARDAR
		//{guardar()-codigoCampos}
		// if  ( isset( $datos['campo1'] ) ){
			// $strCampos = ' campo1=:campo1, ';
		// }
		
		// if  ( isset( $datos['campo2'] ) ){
			// $strCampos = ' campo2=:campo2, ';
		// }
		//--------------------------------------------
		
		$strCampos=substr( $strCampos, strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->$tabla.' SET '.$strCampos;
		}else{
			$sql = 'UPDATE '.$this->$tabla.' SET '.$strCampos.' WHERE {CAMPOLLAVE}=:{CAMPOLLAVE}';
		}
		
		$con = $this->getConexion();
		$sth = $con->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		//{guardar()-codigoBindCampos}
		// if  ( isset( $datos['campo1'] ) ){
		//	$sth->bindValue(':campo1', $datos['campo1'] );
		// }
		if ( !$esNuevo)	{
			$sth->bindValue(':{CAMPOLLAVE}', $datos['{CAMPOLLAVE}'] );
		}	
		//--------------------------------------------
		$exito = $sth->execute();
		if ( !$exito ){
			$error =  $this->getError();
			throw new Exception($error['msg']);
		}
		
		if ( $esNuevo ){
			$idObj=$pdo->lastInsertId();
		}else{
			$idObj=$datos['{CAMPOLLAVE}'];
		}	
		
		$obj=$this->obtener( $idObj );
		
		return array(
			'success'=>true,
			'datos'=>$obj
			'msg'=>$msg
		);
		
	}
}
?>