<?php
class punto_de_ventaModelo extends Modelo{	
	var $tabla='makina_punto_de_venta';
	var $pk='id';
	var $campos= array('id', 'nombre', 'datos_de_contacto', 'calle', 'numero_interior', 'numero_exterior', 'colonia', 'localidad', 'referencia', 'fk_pais', 'nombre_pais', 'fk_estado', 'nombre_estado', 'fk_municipio', 'nombre_municipio', 'fk_cliente', 'nombre_cliente');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' punto_de_venta.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='nombre' ) {
					$filtros .= ' punto_de_venta.nombre like :nombre OR ';
				} 
				if ( $filtro['dataKey']=='datos_de_contacto' ) {
					$filtros .= ' punto_de_venta.datos_de_contacto like :datos_de_contacto OR ';
				} 
				if ( $filtro['dataKey']=='calle' ) {
					$filtros .= ' punto_de_venta.calle like :calle OR ';
				} 
				if ( $filtro['dataKey']=='numero_interior' ) {
					$filtros .= ' punto_de_venta.numero_interior like :numero_interior OR ';
				} 
				if ( $filtro['dataKey']=='numero_exterior' ) {
					$filtros .= ' punto_de_venta.numero_exterior like :numero_exterior OR ';
				} 
				if ( $filtro['dataKey']=='colonia' ) {
					$filtros .= ' punto_de_venta.colonia like :colonia OR ';
				} 
				if ( $filtro['dataKey']=='localidad' ) {
					$filtros .= ' punto_de_venta.localidad like :localidad OR ';
				} 
				if ( $filtro['dataKey']=='referencia' ) {
					$filtros .= ' punto_de_venta.referencia like :referencia OR ';
				} 
				if ( $filtro['dataKey']=='fk_pais' ) {
					$filtros .= ' punto_de_venta.fk_pais like :fk_pais OR ';
				} 
				if ( $filtro['dataKey']=='nombre_pais' ) {
					$filtros .= ' pais0.nombre like :nombre_pais OR ';
				} 
				if ( $filtro['dataKey']=='fk_estado' ) {
					$filtros .= ' punto_de_venta.fk_estado like :fk_estado OR ';
				} 
				if ( $filtro['dataKey']=='nombre_estado' ) {
					$filtros .= ' estado1.nombre like :nombre_estado OR ';
				} 
				if ( $filtro['dataKey']=='fk_municipio' ) {
					$filtros .= ' punto_de_venta.fk_municipio like :fk_municipio OR ';
				} 
				if ( $filtro['dataKey']=='nombre_municipio' ) {
					$filtros .= ' municipio2.nombre like :nombre_municipio OR ';
				} 
				if ( $filtro['dataKey']=='fk_cliente' ) {
					$filtros .= ' punto_de_venta.fk_cliente like :fk_cliente OR ';
				} 
				if ( $filtro['dataKey']=='nombre_cliente' ) {
					$filtros .= ' cliente3.nombre like :nombre_cliente OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN system_ubicacion_paises AS pais0 ON pais0.id = punto_de_venta.fk_pais
 LEFT JOIN system_ubicacion_estados AS estado1 ON estado1.id = punto_de_venta.fk_estado
 LEFT JOIN system_ubicacion_municipios AS municipio2 ON municipio2.id = punto_de_venta.fk_municipio
 LEFT JOIN makina_cliente AS cliente3 ON cliente3.id = punto_de_venta.fk_cliente';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' punto_de_venta '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre' ) {
				$sth->bindValue(':nombre','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='datos_de_contacto' ) {
				$sth->bindValue(':datos_de_contacto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='calle' ) {
				$sth->bindValue(':calle','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='numero_interior' ) {
				$sth->bindValue(':numero_interior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='numero_exterior' ) {
				$sth->bindValue(':numero_exterior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='colonia' ) {
				$sth->bindValue(':colonia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='localidad' ) {
				$sth->bindValue(':localidad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='referencia' ) {
				$sth->bindValue(':referencia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_pais' ) {
				$sth->bindValue(':fk_pais','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_pais' ) {
				$sth->bindValue(':nombre_pais', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_estado' ) {
				$sth->bindValue(':fk_estado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_estado' ) {
				$sth->bindValue(':nombre_estado', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_municipio' ) {
				$sth->bindValue(':fk_municipio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_municipio' ) {
				$sth->bindValue(':nombre_municipio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_cliente' ) {
				$sth->bindValue(':fk_cliente','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_cliente' ) {
				$sth->bindValue(':nombre_cliente', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT punto_de_venta.id, punto_de_venta.nombre, punto_de_venta.datos_de_contacto, punto_de_venta.calle, punto_de_venta.numero_interior, punto_de_venta.numero_exterior, punto_de_venta.colonia, punto_de_venta.localidad, punto_de_venta.referencia, punto_de_venta.fk_pais, pais0.nombre AS nombre_fk_pais, punto_de_venta.fk_estado, estado1.nombre AS nombre_fk_estado, punto_de_venta.fk_municipio, municipio2.nombre AS nombre_fk_municipio, punto_de_venta.fk_cliente, cliente3.nombre AS nombre_fk_cliente FROM '.$this->tabla.' punto_de_venta '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT punto_de_venta.id, punto_de_venta.nombre, punto_de_venta.datos_de_contacto, punto_de_venta.calle, punto_de_venta.numero_interior, punto_de_venta.numero_exterior, punto_de_venta.colonia, punto_de_venta.localidad, punto_de_venta.referencia, punto_de_venta.fk_pais, pais0.nombre AS nombre_fk_pais, punto_de_venta.fk_estado, estado1.nombre AS nombre_fk_estado, punto_de_venta.fk_municipio, municipio2.nombre AS nombre_fk_municipio, punto_de_venta.fk_cliente, cliente3.nombre AS nombre_fk_cliente FROM '.$this->tabla.' punto_de_venta '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='datos_de_contacto' ) {
				$sth->bindValue(':datos_de_contacto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='calle' ) {
				$sth->bindValue(':calle','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='numero_interior' ) {
				$sth->bindValue(':numero_interior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='numero_exterior' ) {
				$sth->bindValue(':numero_exterior','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='colonia' ) {
				$sth->bindValue(':colonia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='localidad' ) {
				$sth->bindValue(':localidad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='referencia' ) {
				$sth->bindValue(':referencia','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_pais' ) {
				$sth->bindValue(':fk_pais','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_pais' ) {
				$sth->bindValue(':nombre_pais', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_estado' ) {
				$sth->bindValue(':fk_estado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_estado' ) {
				$sth->bindValue(':nombre_estado', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_municipio' ) {
				$sth->bindValue(':fk_municipio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_municipio' ) {
				$sth->bindValue(':nombre_municipio', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_cliente' ) {
				$sth->bindValue(':fk_cliente','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_cliente' ) {
				$sth->bindValue(':nombre_cliente', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['datos_de_contacto']='';
			$obj['calle']='';
			$obj['numero_interior']='';
			$obj['numero_exterior']='';
			$obj['colonia']='';
			$obj['localidad']='';
			$obj['referencia']='';
			$obj['fk_pais']='';
			$obj['nombre_pais']='';
			$obj['fk_estado']='';
			$obj['nombre_estado']='';
			$obj['fk_municipio']='';
			$obj['nombre_municipio']='';
			$obj['fk_cliente']='';
			$obj['nombre_cliente']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT punto_de_venta.id, punto_de_venta.nombre, punto_de_venta.datos_de_contacto, punto_de_venta.calle, punto_de_venta.numero_interior, punto_de_venta.numero_exterior, punto_de_venta.colonia, punto_de_venta.localidad, punto_de_venta.referencia, punto_de_venta.fk_pais, pais0.nombre AS nombre_fk_pais, punto_de_venta.fk_estado, estado1.nombre AS nombre_fk_estado, punto_de_venta.fk_municipio, municipio2.nombre AS nombre_fk_municipio, punto_de_venta.fk_cliente, cliente3.nombre AS nombre_fk_cliente
 FROM makina_punto_de_venta AS punto_de_venta
 LEFT JOIN system_ubicacion_paises AS pais0 ON pais0.id = punto_de_venta.fk_pais
 LEFT JOIN system_ubicacion_estados AS estado1 ON estado1.id = punto_de_venta.fk_estado
 LEFT JOIN system_ubicacion_municipios AS municipio2 ON municipio2.id = punto_de_venta.fk_municipio
 LEFT JOIN makina_cliente AS cliente3 ON cliente3.id = punto_de_venta.fk_cliente
  WHERE punto_de_venta.id=:id';
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
		if ( isset( $datos['datos_de_contacto'] ) ){
			$strCampos .= ' datos_de_contacto=:datos_de_contacto, ';
		} 
		if ( isset( $datos['calle'] ) ){
			$strCampos .= ' calle=:calle, ';
		} 
		if ( isset( $datos['numero_interior'] ) ){
			$strCampos .= ' numero_interior=:numero_interior, ';
		} 
		if ( isset( $datos['numero_exterior'] ) ){
			$strCampos .= ' numero_exterior=:numero_exterior, ';
		} 
		if ( isset( $datos['colonia'] ) ){
			$strCampos .= ' colonia=:colonia, ';
		} 
		if ( isset( $datos['localidad'] ) ){
			$strCampos .= ' localidad=:localidad, ';
		} 
		if ( isset( $datos['referencia'] ) ){
			$strCampos .= ' referencia=:referencia, ';
		} 
		if ( isset( $datos['fk_pais'] ) ){
			$strCampos .= ' fk_pais=:fk_pais, ';
		} 
		if ( isset( $datos['fk_estado'] ) ){
			$strCampos .= ' fk_estado=:fk_estado, ';
		} 
		if ( isset( $datos['fk_municipio'] ) ){
			$strCampos .= ' fk_municipio=:fk_municipio, ';
		} 
		if ( isset( $datos['fk_cliente'] ) ){
			$strCampos .= ' fk_cliente=:fk_cliente, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Punto de Venta Creada';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Punto de Venta Actualizada';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['nombre'] ) ){
			$sth->bindValue(':nombre', $datos['nombre'] );
		}
		if  ( isset( $datos['datos_de_contacto'] ) ){
			$sth->bindValue(':datos_de_contacto', $datos['datos_de_contacto'] );
		}
		if  ( isset( $datos['calle'] ) ){
			$sth->bindValue(':calle', $datos['calle'] );
		}
		if  ( isset( $datos['numero_interior'] ) ){
			$sth->bindValue(':numero_interior', $datos['numero_interior'] );
		}
		if  ( isset( $datos['numero_exterior'] ) ){
			$sth->bindValue(':numero_exterior', $datos['numero_exterior'] );
		}
		if  ( isset( $datos['colonia'] ) ){
			$sth->bindValue(':colonia', $datos['colonia'] );
		}
		if  ( isset( $datos['localidad'] ) ){
			$sth->bindValue(':localidad', $datos['localidad'] );
		}
		if  ( isset( $datos['referencia'] ) ){
			$sth->bindValue(':referencia', $datos['referencia'] );
		}
		if  ( isset( $datos['fk_pais'] ) ){
			$sth->bindValue(':fk_pais', $datos['fk_pais'] );
		}
		if  ( isset( $datos['fk_estado'] ) ){
			$sth->bindValue(':fk_estado', $datos['fk_estado'] );
		}
		if  ( isset( $datos['fk_municipio'] ) ){
			$sth->bindValue(':fk_municipio', $datos['fk_municipio'] );
		}
		if  ( isset( $datos['fk_cliente'] ) ){
			$sth->bindValue(':fk_cliente', $datos['fk_cliente'] );
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