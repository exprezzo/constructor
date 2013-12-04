<?php
class paginaModelo extends Modelo{	
	function obtener( $llave ){		
		$sql = 'SELECT pagina.id, pagina.titulo, autor0.name, pagina.contenido, categoria1.nombre, pagina.fecha_creacion, pagina.ultima_edicion
 FROM system_pagina AS pagina
 LEFT JOIN system_users AS autor0 ON autor0.id = pagina.autor
 LEFT JOIN cms_categoria AS categoria1 ON categoria1.id = pagina.fk_categoria_pagina
  WHERE pagina.id=:id';
		$con = $this->getConexion();
		$sth = $con->prepare($sql);
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
}
?>