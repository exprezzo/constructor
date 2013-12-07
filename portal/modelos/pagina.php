<?php
class paginaModelo extends Modelo{	
	var $tabla;
	function obtener( $llave ){		
		$sql = 'SELECT pagina.id, pagina.titulo, autor0.name, pagina.contenido, categoria1.nombre, pagina.fecha_creacion, pagina.ultima_edicion
 FROM system_pagina AS pagina
 LEFT JOIN system_users AS autor0 ON autor0.id = pagina.autor
 LEFT JOIN cms_categoria AS categoria1 ON categoria1.id = pagina.fk_categoria_pagina
  WHERE pagina.id=:id';
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		 $sth->BindValue(':id',$llave ); 
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
	
		$esNuevo=( empty( $datos['id'] ) )? true : false;			
		$strCampos='';
		
		//--------------------------------------------
		// CAMPOS A GUARDAR
		 
		if ( isset( $datos['titulo'] ) ){
			$strCampos = ' titulo=:titulo, ';
		}
 
		if ( isset( $datos['autor'] ) ){
			$strCampos = ' autor=:autor, ';
		}
 
		if ( isset( $datos['contenido'] ) ){
			$strCampos = ' contenido=:contenido, ';
		}
 
		if ( isset( $datos['fk_categoria_pagina'] ) ){
			$strCampos = ' fk_categoria_pagina=:fk_categoria_pagina, ';
		}
 
		if ( isset( $datos['fecha_creacion'] ) ){
			$strCampos = ' fecha_creacion=:fecha_creacion, ';
		}
 
		if ( isset( $datos['ultima_edicion'] ) ){
			$strCampos = ' ultima_edicion=:ultima_edicion, ';
		}

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
			$sql = 'UPDATE '.$this->$tabla.' SET '.$strCampos.' WHERE id=:id';
		}
		
		$con = $this->getConexion();
		$sth = $con->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['titulo'] ) ){
			$sth->bindValue(':titulo', $datos['titulo'] );
		}

		if  ( isset( $datos['autor'] ) ){
			$sth->bindValue(':autor', $datos['autor'] );
		}

		if  ( isset( $datos['contenido'] ) ){
			$sth->bindValue(':contenido', $datos['contenido'] );
		}

		if  ( isset( $datos['fk_categoria_pagina'] ) ){
			$sth->bindValue(':fk_categoria_pagina', $datos['fk_categoria_pagina'] );
		}

		if  ( isset( $datos['fecha_creacion'] ) ){
			$sth->bindValue(':fecha_creacion', $datos['fecha_creacion'] );
		}

		if  ( isset( $datos['ultima_edicion'] ) ){
			$sth->bindValue(':ultima_edicion', $datos['ultima_edicion'] );
		}

		// if  ( isset( $datos['campo1'] ) ){
		//	$sth->bindValue(':campo1', $datos['campo1'] );
		// }
		if ( !$esNuevo)	{
			$sth->bindValue(':id', $datos['id'] );
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
			$idObj=$datos['id'];
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