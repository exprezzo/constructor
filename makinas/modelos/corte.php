<?php
class corteModelo extends Modelo{	
	var $tabla='makinas_corte';
	var $pk='id';
	var $campos= array('id', 'fk_maquina', 'nombre_maquina', 'fk_cliente', 'nombre_cliente', 'fk_pdv', 'nombre_punto_de_venta', 'fk_tecnico', 'nombre_tecnico', 'cont_entrada', 'cont_salida', 'saldo_contadores', 'dato_de_la_placa', 'monto', 'fecha', 'fk_serie', 'serie_serie', 'folio');
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' corte.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='fk_maquina' ) {
					$filtros .= ' corte.fk_maquina like :fk_maquina OR ';
				} 
				if ( $filtro['dataKey']=='nombre_maquina' ) {
					$filtros .= ' maquina0.nombre like :nombre_maquina OR ';
				} 
				if ( $filtro['dataKey']=='fk_cliente' ) {
					$filtros .= ' corte.fk_cliente like :fk_cliente OR ';
				} 
				if ( $filtro['dataKey']=='nombre_cliente' ) {
					$filtros .= ' cliente1.nombre like :nombre_cliente OR ';
				} 
				if ( $filtro['dataKey']=='fk_pdv' ) {
					$filtros .= ' corte.fk_pdv like :fk_pdv OR ';
				} 
				if ( $filtro['dataKey']=='nombre_punto_de_venta' ) {
					$filtros .= ' punto_de_venta2.nombre like :nombre_punto_de_venta OR ';
				} 
				if ( $filtro['dataKey']=='fk_tecnico' ) {
					$filtros .= ' corte.fk_tecnico like :fk_tecnico OR ';
				} 
				if ( $filtro['dataKey']=='nombre_tecnico' ) {
					$filtros .= ' tecnico3.nombre like :nombre_tecnico OR ';
				} 
				if ( $filtro['dataKey']=='cont_entrada' ) {
					$filtros .= ' corte.cont_entrada like :cont_entrada OR ';
				} 
				if ( $filtro['dataKey']=='cont_salida' ) {
					$filtros .= ' corte.cont_salida like :cont_salida OR ';
				} 
				if ( $filtro['dataKey']=='saldo_contadores' ) {
					$filtros .= ' corte.saldo_contadores like :saldo_contadores OR ';
				} 
				if ( $filtro['dataKey']=='dato_de_la_placa' ) {
					$filtros .= ' corte.dato_de_la_placa like :dato_de_la_placa OR ';
				} 
				if ( $filtro['dataKey']=='monto' ) {
					$filtros .= ' corte.monto like :monto OR ';
				} 
				if ( $filtro['dataKey']=='fecha' ) {
					$filtros .= ' corte.fecha like :fecha OR ';
				} 
				if ( $filtro['dataKey']=='fk_serie' ) {
					$filtros .= ' corte.fk_serie like :fk_serie OR ';
				} 
				if ( $filtro['dataKey']=='serie_serie' ) {
					$filtros .= ' serie4.serie like :serie_serie OR ';
				} 
				if ( $filtro['dataKey']=='folio' ) {
					$filtros .= ' corte.folio like :folio OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN makinas_maquina AS maquina0 ON maquina0.id = corte.fk_maquina
 LEFT JOIN makina_cliente AS cliente1 ON cliente1.id = corte.fk_cliente
 LEFT JOIN makina_punto_de_venta AS punto_de_venta2 ON punto_de_venta2.id = corte.fk_pdv
 LEFT JOIN makina_tecnico AS tecnico3 ON tecnico3.id = corte.fk_tecnico
 LEFT JOIN makinas_serie AS serie4 ON serie4.id = corte.fk_serie';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' corte '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_maquina' ) {
				$sth->bindValue(':fk_maquina','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_maquina' ) {
				$sth->bindValue(':nombre_maquina', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_cliente' ) {
				$sth->bindValue(':fk_cliente','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_cliente' ) {
				$sth->bindValue(':nombre_cliente', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_pdv' ) {
				$sth->bindValue(':fk_pdv','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_punto_de_venta' ) {
				$sth->bindValue(':nombre_punto_de_venta', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_tecnico' ) {
				$sth->bindValue(':fk_tecnico','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_tecnico' ) {
				$sth->bindValue(':nombre_tecnico', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='cont_entrada' ) {
				$sth->bindValue(':cont_entrada','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='cont_salida' ) {
				$sth->bindValue(':cont_salida','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='saldo_contadores' ) {
				$sth->bindValue(':saldo_contadores','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='dato_de_la_placa' ) {
				$sth->bindValue(':dato_de_la_placa','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='monto' ) {
				$sth->bindValue(':monto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha' ) {
				$sth->bindValue(':fecha','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_serie' ) {
				$sth->bindValue(':fk_serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='serie_serie' ) {
				$sth->bindValue(':serie_serie', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio' ) {
				$sth->bindValue(':folio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$sql = 'SELECT corte.id, corte.fk_maquina, maquina0.nombre AS nombre_fk_maquina, corte.fk_cliente, cliente1.nombre AS nombre_fk_cliente, corte.fk_pdv, punto_de_venta2.nombre AS nombre_fk_pdv, corte.fk_tecnico, tecnico3.nombre AS nombre_fk_tecnico, corte.cont_entrada, corte.cont_salida, corte.saldo_contadores, corte.dato_de_la_placa, corte.monto, corte.fecha, corte.fk_serie, serie4.serie AS serie_fk_serie, corte.folio FROM '.$this->tabla.' corte '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT corte.id, corte.fk_maquina, maquina0.nombre AS nombre_fk_maquina, corte.fk_cliente, cliente1.nombre AS nombre_fk_cliente, corte.fk_pdv, punto_de_venta2.nombre AS nombre_fk_pdv, corte.fk_tecnico, tecnico3.nombre AS nombre_fk_tecnico, corte.cont_entrada, corte.cont_salida, corte.saldo_contadores, corte.dato_de_la_placa, corte.monto, corte.fecha, corte.fk_serie, serie4.serie AS serie_fk_serie, corte.folio FROM '.$this->tabla.' corte '.$joins.$filtros;
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
			if ( $filtro['dataKey']=='fk_maquina' ) {
				$sth->bindValue(':fk_maquina','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_maquina' ) {
				$sth->bindValue(':nombre_maquina', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_cliente' ) {
				$sth->bindValue(':fk_cliente','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_cliente' ) {
				$sth->bindValue(':nombre_cliente', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_pdv' ) {
				$sth->bindValue(':fk_pdv','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_punto_de_venta' ) {
				$sth->bindValue(':nombre_punto_de_venta', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_tecnico' ) {
				$sth->bindValue(':fk_tecnico','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_tecnico' ) {
				$sth->bindValue(':nombre_tecnico', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='cont_entrada' ) {
				$sth->bindValue(':cont_entrada','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='cont_salida' ) {
				$sth->bindValue(':cont_salida','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='saldo_contadores' ) {
				$sth->bindValue(':saldo_contadores','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='dato_de_la_placa' ) {
				$sth->bindValue(':dato_de_la_placa','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='monto' ) {
				$sth->bindValue(':monto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fecha' ) {
				$sth->bindValue(':fecha','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_serie' ) {
				$sth->bindValue(':fk_serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='serie_serie' ) {
				$sth->bindValue(':serie_serie', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio' ) {
				$sth->bindValue(':folio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
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
			$obj['fk_maquina']='';
			$obj['nombre_maquina']='';
			$obj['fk_cliente']='';
			$obj['nombre_cliente']='';
			$obj['fk_pdv']='';
			$obj['nombre_punto_de_venta']='';
			$obj['fk_tecnico']='';
			$obj['nombre_tecnico']='';
			$obj['cont_entrada']='';
			$obj['cont_salida']='';
			$obj['saldo_contadores']='';
			$obj['dato_de_la_placa']='';
			$obj['monto']='';
			$obj['fecha']='';
			$obj['fk_serie']='';
			$obj['serie_serie']='';
			$obj['folio']='';
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT corte.id, corte.fk_maquina, maquina0.nombre AS nombre_fk_maquina, corte.fk_cliente, cliente1.nombre AS nombre_fk_cliente, corte.fk_pdv, punto_de_venta2.nombre AS nombre_fk_pdv, corte.fk_tecnico, tecnico3.nombre AS nombre_fk_tecnico, corte.cont_entrada, corte.cont_salida, corte.saldo_contadores, corte.dato_de_la_placa, corte.monto, corte.fecha, corte.fk_serie, serie4.serie AS serie_fk_serie, corte.folio
 FROM makinas_corte AS corte
 LEFT JOIN makinas_maquina AS maquina0 ON maquina0.id = corte.fk_maquina
 LEFT JOIN makina_cliente AS cliente1 ON cliente1.id = corte.fk_cliente
 LEFT JOIN makina_punto_de_venta AS punto_de_venta2 ON punto_de_venta2.id = corte.fk_pdv
 LEFT JOIN makina_tecnico AS tecnico3 ON tecnico3.id = corte.fk_tecnico
 LEFT JOIN makinas_serie AS serie4 ON serie4.id = corte.fk_serie
  WHERE corte.id=:id';
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
		$pdo=$this->getPdo();		
		$exito = $pdo->exec('LOCK TABLES makinas_series WRITE, makinas_corte WRITE');
		$pdo->beginTransaction();	
		
		if ( $esNuevo ){
			//obtener el siguiente folio
			$fk_serie=$datos['fk_serie'];
			$serMod = new serieModelo();
			$serie=$serMod->obtener( $fk_serie );			
			$this->datos['folio']=$serie['folio_sig'];
			$serie['folio_sig'] = $serie['folio_sig']+1;
			try{
				$serMod->guardar( $serie );
			}catch(Exception $err){
				
				$exito = $pdo->exec('UNLOCK TABLES');
				$pdo->rollBack();
				return array(
					'success'=>false,
					'msg'=>$err
				);				
			}
			
		}
		//--------------------------------------------
		// CAMPOS A GUARDAR
		 
		if ( isset( $datos['fk_maquina'] ) ){
			$strCampos .= ' fk_maquina=:fk_maquina, ';
		} 
		if ( isset( $datos['fk_cliente'] ) ){
			$strCampos .= ' fk_cliente=:fk_cliente, ';
		} 
		if ( isset( $datos['fk_pdv'] ) ){
			$strCampos .= ' fk_pdv=:fk_pdv, ';
		} 
		if ( isset( $datos['fk_tecnico'] ) ){
			$strCampos .= ' fk_tecnico=:fk_tecnico, ';
		} 
		if ( isset( $datos['cont_entrada'] ) ){
			$strCampos .= ' cont_entrada=:cont_entrada, ';
		} 
		if ( isset( $datos['cont_salida'] ) ){
			$strCampos .= ' cont_salida=:cont_salida, ';
		} 
		if ( isset( $datos['saldo_contadores'] ) ){
			$strCampos .= ' saldo_contadores=:saldo_contadores, ';
		} 
		if ( isset( $datos['dato_de_la_placa'] ) ){
			$strCampos .= ' dato_de_la_placa=:dato_de_la_placa, ';
		} 
		if ( isset( $datos['monto'] ) ){
			$strCampos .= ' monto=:monto, ';
		} 
		if ( isset( $datos['fecha'] ) ){
			$strCampos .= ' fecha=:fecha, ';
		} 
		if ( isset( $datos['fk_serie'] ) ){
			$strCampos .= ' fk_serie=:fk_serie, ';
		} 
		if ( isset( $datos['folio'] ) ){
			$strCampos .= ' folio=:folio, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Corte Creado';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Corte Actualizado';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['fk_maquina'] ) ){
			$sth->bindValue(':fk_maquina', $datos['fk_maquina'] );
		}
		if  ( isset( $datos['fk_cliente'] ) ){
			$sth->bindValue(':fk_cliente', $datos['fk_cliente'] );
		}
		if  ( isset( $datos['fk_pdv'] ) ){
			$sth->bindValue(':fk_pdv', $datos['fk_pdv'] );
		}
		if  ( isset( $datos['fk_tecnico'] ) ){
			$sth->bindValue(':fk_tecnico', $datos['fk_tecnico'] );
		}
		if  ( isset( $datos['cont_entrada'] ) ){
			$sth->bindValue(':cont_entrada', $datos['cont_entrada'] );
		}
		if  ( isset( $datos['cont_salida'] ) ){
			$sth->bindValue(':cont_salida', $datos['cont_salida'] );
		}
		if  ( isset( $datos['saldo_contadores'] ) ){
			$sth->bindValue(':saldo_contadores', $datos['saldo_contadores'] );
		}
		if  ( isset( $datos['dato_de_la_placa'] ) ){
			$sth->bindValue(':dato_de_la_placa', $datos['dato_de_la_placa'] );
		}
		if  ( isset( $datos['monto'] ) ){
			$sth->bindValue(':monto', $datos['monto'] );
		}
		if  ( isset( $datos['fecha'] ) ){
			$sth->bindValue(':fecha', $datos['fecha'] );
		}
		if  ( isset( $datos['fk_serie'] ) ){
			$sth->bindValue(':fk_serie', $datos['fk_serie'] );
		}
		if  ( isset( $datos['folio'] ) ){
			$sth->bindValue(':folio', $datos['folio'] );
		}		
		if ( !$esNuevo)	{
			$sth->bindValue(':id', $datos['id'] );
		}	
		//--------------------------------------------
		$exito = $sth->execute();
		if ( !$exito ){
			$error =  $this->getError( $sth );
			$pdo->exec('UNLOCK TABLES');
			$pdo->rollBack();	
			throw new Exception($error['msg']);
		}
		
		
			
		if ( $esNuevo ){
			$idObj=$pdo->lastInsertId();
		}else{
			$idObj=$datos['id'];
		}	
		
		
		
		try{
			$obj=$this->obtener( $idObj );
		}catch(Exception $err){
			$pdo->exec('UNLOCK TABLES');
			$pdo->rollBack();
			return array(
				'success'=>false,
				'msg'=>$err
			);
		}
		
		
		$pdo->exec('UNLOCK TABLES');
		$pdo->commit();
		
		return array(
			'success'=>true,
			'datos'=>$obj,
			'msg'=>$msg
		);
		
	}
}
?>