<?php
class CatalogoModelo extends Modelo{	
	var $tabla='system_catalogos';
	var $pk='id';
	var $campos= array('id', 'fk_modulo', 'nombre', 'controlador', 'modelo', 'tabla', 'pk_tabla', 'icono', 'titulo_nuevo', 'titulo_edicion', 'titulo_busqueda', 'msg_creado', 'msg_actualizado', 'pregunta_eliminar', 'msg_eliminado', 'msg_cambios', 'campos_busqueda');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' Catalogo.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='fk_modulo' ) {
					$filtros .= ' Catalogo.fk_modulo like :fk_modulo OR ';
				} 
				if ( $filtro['dataKey']=='nombre' ) {
					$filtros .= ' Catalogo.nombre like :nombre OR ';
				} 
				if ( $filtro['dataKey']=='controlador' ) {
					$filtros .= ' Catalogo.controlador like :controlador OR ';
				} 
				if ( $filtro['dataKey']=='modelo' ) {
					$filtros .= ' Catalogo.modelo like :modelo OR ';
				} 
				if ( $filtro['dataKey']=='tabla' ) {
					$filtros .= ' Catalogo.tabla like :tabla OR ';
				} 
				if ( $filtro['dataKey']=='pk_tabla' ) {
					$filtros .= ' Catalogo.pk_tabla like :pk_tabla OR ';
				} 
				if ( $filtro['dataKey']=='icono' ) {
					$filtros .= ' Catalogo.icono like :icono OR ';
				} 
				if ( $filtro['dataKey']=='titulo_nuevo' ) {
					$filtros .= ' Catalogo.titulo_nuevo like :titulo_nuevo OR ';
				} 
				if ( $filtro['dataKey']=='titulo_edicion' ) {
					$filtros .= ' Catalogo.titulo_edicion like :titulo_edicion OR ';
				} 
				if ( $filtro['dataKey']=='titulo_busqueda' ) {
					$filtros .= ' Catalogo.titulo_busqueda like :titulo_busqueda OR ';
				} 
				if ( $filtro['dataKey']=='msg_creado' ) {
					$filtros .= ' Catalogo.msg_creado like :msg_creado OR ';
				} 
				if ( $filtro['dataKey']=='msg_actualizado' ) {
					$filtros .= ' Catalogo.msg_actualizado like :msg_actualizado OR ';
				} 
				if ( $filtro['dataKey']=='pregunta_eliminar' ) {
					$filtros .= ' Catalogo.pregunta_eliminar like :pregunta_eliminar OR ';
				} 
				if ( $filtro['dataKey']=='msg_eliminado' ) {
					$filtros .= ' Catalogo.msg_eliminado like :msg_eliminado OR ';
				} 
				if ( $filtro['dataKey']=='msg_cambios' ) {
					$filtros .= ' Catalogo.msg_cambios like :msg_cambios OR ';
				} 
				if ( $filtro['dataKey']=='campos_busqueda' ) {
					$filtros .= ' Catalogo.campos_busqueda like :campos_busqueda OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' Catalogo '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_modulo' ) {
				$sth->bindValue(':fk_modulo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='controlador' ) {
				$sth->bindValue(':controlador','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='modelo' ) {
				$sth->bindValue(':modelo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='tabla' ) {
				$sth->bindValue(':tabla','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='pk_tabla' ) {
				$sth->bindValue(':pk_tabla','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='icono' ) {
				$sth->bindValue(':icono','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='titulo_nuevo' ) {
				$sth->bindValue(':titulo_nuevo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='titulo_edicion' ) {
				$sth->bindValue(':titulo_edicion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='titulo_busqueda' ) {
				$sth->bindValue(':titulo_busqueda','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_creado' ) {
				$sth->bindValue(':msg_creado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_actualizado' ) {
				$sth->bindValue(':msg_actualizado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='pregunta_eliminar' ) {
				$sth->bindValue(':pregunta_eliminar','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_eliminado' ) {
				$sth->bindValue(':msg_eliminado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_cambios' ) {
				$sth->bindValue(':msg_cambios','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='campos_busqueda' ) {
				$sth->bindValue(':campos_busqueda','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT Catalogo.id, Catalogo.fk_modulo, Catalogo.nombre, Catalogo.controlador, Catalogo.modelo, Catalogo.tabla, Catalogo.pk_tabla, Catalogo.icono, Catalogo.titulo_nuevo, Catalogo.titulo_edicion, Catalogo.titulo_busqueda, Catalogo.msg_creado, Catalogo.msg_actualizado, Catalogo.pregunta_eliminar, Catalogo.msg_eliminado, Catalogo.msg_cambios, Catalogo.campos_busqueda FROM '.$this->tabla.' Catalogo '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT Catalogo.id, Catalogo.fk_modulo, Catalogo.nombre, Catalogo.controlador, Catalogo.modelo, Catalogo.tabla, Catalogo.pk_tabla, Catalogo.icono, Catalogo.titulo_nuevo, Catalogo.titulo_edicion, Catalogo.titulo_busqueda, Catalogo.msg_creado, Catalogo.msg_actualizado, Catalogo.pregunta_eliminar, Catalogo.msg_eliminado, Catalogo.msg_cambios, Catalogo.campos_busqueda FROM '.$this->tabla.' Catalogo '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='fk_modulo' ) {
				$sth->bindValue(':fk_modulo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='controlador' ) {
				$sth->bindValue(':controlador','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='modelo' ) {
				$sth->bindValue(':modelo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='tabla' ) {
				$sth->bindValue(':tabla','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='pk_tabla' ) {
				$sth->bindValue(':pk_tabla','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='icono' ) {
				$sth->bindValue(':icono','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='titulo_nuevo' ) {
				$sth->bindValue(':titulo_nuevo','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='titulo_edicion' ) {
				$sth->bindValue(':titulo_edicion','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='titulo_busqueda' ) {
				$sth->bindValue(':titulo_busqueda','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_creado' ) {
				$sth->bindValue(':msg_creado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_actualizado' ) {
				$sth->bindValue(':msg_actualizado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='pregunta_eliminar' ) {
				$sth->bindValue(':pregunta_eliminar','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_eliminado' ) {
				$sth->bindValue(':msg_eliminado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='msg_cambios' ) {
				$sth->bindValue(':msg_cambios','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='campos_busqueda' ) {
				$sth->bindValue(':campos_busqueda','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['fk_modulo']='';
			$obj['nombre']='';
			$obj['controlador']='';
			$obj['modelo']='';
			$obj['tabla']='';
			$obj['pk_tabla']='';
			$obj['icono']='';
			$obj['titulo_nuevo']='';
			$obj['titulo_edicion']='';
			$obj['titulo_busqueda']='';
			$obj['msg_creado']='';
			$obj['msg_actualizado']='';
			$obj['pregunta_eliminar']='';
			$obj['msg_eliminado']='';
			$obj['msg_cambios']='';
			$obj['campos_busqueda']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT Catalogo.id, Catalogo.fk_modulo, Catalogo.nombre, Catalogo.controlador, Catalogo.modelo, Catalogo.tabla, Catalogo.pk_tabla, Catalogo.icono, Catalogo.titulo_nuevo, Catalogo.titulo_edicion, Catalogo.titulo_busqueda, Catalogo.msg_creado, Catalogo.msg_actualizado, Catalogo.pregunta_eliminar, Catalogo.msg_eliminado, Catalogo.msg_cambios, Catalogo.campos_busqueda
 FROM system_catalogos AS Catalogo
  WHERE Catalogo.id=:id';
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
		 
		if ( isset( $datos['fk_modulo'] ) ){
			$strCampos .= ' fk_modulo=:fk_modulo, ';
		} 
		if ( isset( $datos['nombre'] ) ){
			$strCampos .= ' nombre=:nombre, ';
		} 
		if ( isset( $datos['controlador'] ) ){
			$strCampos .= ' controlador=:controlador, ';
		} 
		if ( isset( $datos['modelo'] ) ){
			$strCampos .= ' modelo=:modelo, ';
		} 
		if ( isset( $datos['tabla'] ) ){
			$strCampos .= ' tabla=:tabla, ';
		} 
		if ( isset( $datos['pk_tabla'] ) ){
			$strCampos .= ' pk_tabla=:pk_tabla, ';
		} 
		if ( isset( $datos['icono'] ) ){
			$strCampos .= ' icono=:icono, ';
		} 
		if ( isset( $datos['titulo_nuevo'] ) ){
			$strCampos .= ' titulo_nuevo=:titulo_nuevo, ';
		} 
		if ( isset( $datos['titulo_edicion'] ) ){
			$strCampos .= ' titulo_edicion=:titulo_edicion, ';
		} 
		if ( isset( $datos['titulo_busqueda'] ) ){
			$strCampos .= ' titulo_busqueda=:titulo_busqueda, ';
		} 
		if ( isset( $datos['msg_creado'] ) ){
			$strCampos .= ' msg_creado=:msg_creado, ';
		} 
		if ( isset( $datos['msg_actualizado'] ) ){
			$strCampos .= ' msg_actualizado=:msg_actualizado, ';
		} 
		if ( isset( $datos['pregunta_eliminar'] ) ){
			$strCampos .= ' pregunta_eliminar=:pregunta_eliminar, ';
		} 
		if ( isset( $datos['msg_eliminado'] ) ){
			$strCampos .= ' msg_eliminado=:msg_eliminado, ';
		} 
		if ( isset( $datos['msg_cambios'] ) ){
			$strCampos .= ' msg_cambios=:msg_cambios, ';
		} 
		if ( isset( $datos['campos_busqueda'] ) ){
			$strCampos .= ' campos_busqueda=:campos_busqueda, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Catalogo Creado';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Catalogo Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['fk_modulo'] ) ){
			$sth->bindValue(':fk_modulo', $datos['fk_modulo'] );
		}
		if  ( isset( $datos['nombre'] ) ){
			$sth->bindValue(':nombre', $datos['nombre'] );
		}
		if  ( isset( $datos['controlador'] ) ){
			$sth->bindValue(':controlador', $datos['controlador'] );
		}
		if  ( isset( $datos['modelo'] ) ){
			$sth->bindValue(':modelo', $datos['modelo'] );
		}
		if  ( isset( $datos['tabla'] ) ){
			$sth->bindValue(':tabla', $datos['tabla'] );
		}
		if  ( isset( $datos['pk_tabla'] ) ){
			$sth->bindValue(':pk_tabla', $datos['pk_tabla'] );
		}
		if  ( isset( $datos['icono'] ) ){
			$sth->bindValue(':icono', $datos['icono'] );
		}
		if  ( isset( $datos['titulo_nuevo'] ) ){
			$sth->bindValue(':titulo_nuevo', $datos['titulo_nuevo'] );
		}
		if  ( isset( $datos['titulo_edicion'] ) ){
			$sth->bindValue(':titulo_edicion', $datos['titulo_edicion'] );
		}
		if  ( isset( $datos['titulo_busqueda'] ) ){
			$sth->bindValue(':titulo_busqueda', $datos['titulo_busqueda'] );
		}
		if  ( isset( $datos['msg_creado'] ) ){
			$sth->bindValue(':msg_creado', $datos['msg_creado'] );
		}
		if  ( isset( $datos['msg_actualizado'] ) ){
			$sth->bindValue(':msg_actualizado', $datos['msg_actualizado'] );
		}
		if  ( isset( $datos['pregunta_eliminar'] ) ){
			$sth->bindValue(':pregunta_eliminar', $datos['pregunta_eliminar'] );
		}
		if  ( isset( $datos['msg_eliminado'] ) ){
			$sth->bindValue(':msg_eliminado', $datos['msg_eliminado'] );
		}
		if  ( isset( $datos['msg_cambios'] ) ){
			$sth->bindValue(':msg_cambios', $datos['msg_cambios'] );
		}
		if  ( isset( $datos['campos_busqueda'] ) ){
			$sth->bindValue(':campos_busqueda', $datos['campos_busqueda'] );
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