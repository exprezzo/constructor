<?php
require_once $_PETICION->basePath.'/modelos/catalogo_modelo.php';
require_once $_PETICION->basePath.'/modelos/modulo_modelo.php';
require_once $_PETICION->basePath.'/modelos/elemento_modelo.php';
class catalogos extends Controlador{
	var $modelo="Catalogo";	
	function limpiarCadena($valor){
		$valor = str_ireplace("SELECT","",$valor);
		$valor = str_ireplace("COPY","",$valor);
		$valor = str_ireplace("DELETE","",$valor);
		$valor = str_ireplace("DROP","",$valor);
		$valor = str_ireplace("DUMP","",$valor);
		$valor = str_ireplace(" OR ","",$valor);
		$valor = str_ireplace("%","",$valor);
		$valor = str_ireplace("LIKE","",$valor);
		$valor = str_ireplace("--","",$valor);
		$valor = str_ireplace("^","",$valor);
		$valor = str_ireplace("[","",$valor);
		$valor = str_ireplace("]","",$valor);
		$valor = str_ireplace("\\","",$valor);
		$valor = str_ireplace("!","",$valor);
		$valor = str_ireplace("�","",$valor);
		$valor = str_ireplace("?","",$valor);
		$valor = str_ireplace("=","",$valor);
		$valor = str_ireplace("&","",$valor);
		return $valor;
	}
	function obtenerCamposDeLaTabla(){		
		
		$mod=$this->getModelo();
		$pdo = $mod->getPdo();
		$tabla=addslashes($this->limpiarCadena( $_POST['tabla'] )); 
		// $sql='SHOW COLUMNS FROM :tabla';
		$sql='SHOW COLUMNS FROM '.$tabla;
		$sth=$pdo->prepare($sql);
		// $sth->bindValue(':tabla', $tabla, PDO::PARAM_STR);
		$exito = $sth->execute();		
		if ( !$exito ){
			//si no tuvo exito, imprime el error
			$res= $mod->getError( $sth );
			echo json_encode( $res );
			return $res;
		}
		
		
		$datos = $sth->fetchAll(PDO::FETCH_ASSOC);
		$elementos=array();
		foreach($datos as $campoTabla){
			$elemento=array();
			$elemento['id']=0;			
			$elemento['esDefault'] =$campoTabla['Default'];
			$elemento['extras'] =$campoTabla['Extra'];
			$elemento['campo'] =$campoTabla['Field'];
			$elemento['llave'] =$campoTabla['Key'];
			$elemento['esNulo'] =$campoTabla['Null'];
			$elemento['tipo'] =$campoTabla['Type'];
			$elemento['componente'] ='Text Input';
			$elemento['comp_config'] ='{}';
			$elementos[] = $elemento;
			
		}
		$res=array(
			'success'=>true,
			'msg'=>'Campos Obtenidos',
			'datos'=>$elementos
		);
		echo json_encode($res);
		
		// 
	}
	
	function mostrarVista( $archivos=""){
		$vista= $this->getVista();
		
		global $_TEMA_APP;
		global $_PETICION;
		
		$sql="SHOW TABLES";
		$mod=$this->getModelo();
		$res=$mod->ejecutarSql($sql);
		 // print_r($res);
		$tablas=array();
		 foreach($res['datos'] as $tabla ){		
			 $tablas[]=array(
				'nombre'=>$tabla['Tables_in_constructor']
			 );
		 }	
		$vista->tablas = $tablas;
		
		$moduloMod = new ModuloModelo();
		$mods=$moduloMod->buscar( array() );
		$vista->modulos = $mods['datos'];
		
		return $vista->mostrarTema($_PETICION, $_TEMA_APP);
	}
	
	function nuevo(){		
		$modelo = $this->getModelo();
		$campos=$modelo->campos;
		$vista=$this->getVista();				
		for($i=0; $i<sizeof($campos); $i++){
			$obj[$campos[$i]]="";
		}
		$vista->datos=$obj;		
		
		global $_PETICION;
		$_PETICION->accion="edicion";
		return $this->mostrarVista();			
	}
	
	function guardar(){
		$modelo=$this->getModelo();
		$esNuevo = empty( $_POST['datos'][$modelo->pk] );
		
		ob_start();
		$res = parent::guardar();
		ob_end_clean();
		
		if ( !$res['success'] ){			
			echo json_encode($res);
			return $res;
		}
		
		if ( $esNuevo ){					
			$res['esNuevo']=true;				
			$_SESSION['res']=$res;
		}
		echo json_encode($res);
		return $res;
	}
	function eliminar(){
		return parent::eliminar();
	}
	function editar(){
		global $_PETICION;
		// print_r($_PETICION);
		if ( isset($_PETICION->params[0]) )
		$_REQUEST['id'] = $_PETICION->params[0];
		
		// return parent::editar();
		$id=empty( $_REQUEST['id'])? 0 : $_REQUEST['id'];
		$model=$this->getModelo();
		$params=array(
			$model->pk=>$id
		);		
		
		$obj=$model->obtener( $params );	

		$vista=$this->getVista();				
		$vista->datos=$obj;		
		
		global $_PETICION;
		global $_TEMA_APP;
		$_PETICION->accion="edicion";
		return $this->mostrarVista();
	}
	function buscar(){
		if ( $_SERVER['REQUEST_METHOD']=='POST'  ){
			return parent::buscar();			
		}else{
			global $_PETICION, $_TEMA_APP;
			$vista = $this->getVista();
			$_PETICION->accion='busqueda';
			return $vista->mostrarTema($_PETICION, $_TEMA_APP);
		}
	}
}
?>