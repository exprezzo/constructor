<?php
class PlantillaModelo extends Modelo{	
	function obtener( $llave ){		
		$sql = '{SQL-obtener}';
		$con = $this->getConexion();
		$sth = $con->prepare($sql);
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
}
?>