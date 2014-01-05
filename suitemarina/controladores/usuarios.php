<?php

require_once $_PETICION->basePath.'/modelos/Usuario.php';

class usuarios extends Controlador{
	var $modelo="Usuario";	
	
	var $accionesPublicas=array('login');
	
	function logout(){
		// global $_TEMA_APP, $_PETICION;
		
		
		// session_unset();
		 // session_destroy();
		// session_start();
		// session_regenerate_id(true);
		logout();
		global $_PETICION;		
		header('Location: '.$_PETICION->url_app.$_PETICION->modulo.'/usuarios/login');
	}
	function login(){
		function isAjax(){
		   return !empty($_SERVER['HTTP_X_REQUESTED_WITH']) &&
		   strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
		}
		$vista= $this->getVista();
		global $_TEMA_APP, $_PETICION;		
		$layout='login';
		if ( $_SERVER['REQUEST_METHOD']=='POST'  ){
			//Login con ajax o el post del form 
			$usrMod = $this->getModelo();
			$res = $usrMod->identificar($_POST['nick'], $_POST['pass']);			
			
			
			if ($res['success']){
				// isLoged(true);					
				// addUser( $res['usuario'] );
				sessionAdd('isLoged', true);
				
				unset($res['usuario']['pass']);					
				sessionAdd('user', $res['usuario']);
								
				if ( isAjax() ){
					$res = array(
						'success'=>true,
						'msg'=>'Usuario identificado'
					);
					echo json_enode( $res );
				}else{
					$url=sessionGet('_PETICION');
					$url=( empty($url) ) ? $_PETICION->url_app.$_PETICION->modulo.'/paginas/inicio' : '/'.$url;
					// echo $url; exit;
					 header('Location:'.$url);
				}
					
			}else{								
				if ( isAjax() ){
					$res = array(
						'success'=>false,
						'msg'=>$res['msg']
					);
					echo json_enode( $res );
				}else{
					$vista->error= $res['msg'];//'USUARIO O CONTRASEÑA INCORRECTA';
					$vista->username=$_POST['nick'];
					return $vista->mostrarTema($_PETICION, $_TEMA_APP, $layout);
				}
			}			
		}else{
			//PETICION GET U OTRA DIFERENTE DE POST			
			$vista->username='';
			return $vista->mostrarTema($_PETICION, $_TEMA_APP, $layout);
		}				
	}
	
	function mostrarVista( $archivos=""){
		$vista= $this->getVista();
		
		global $_TEMA_APP;
		global $_PETICION;
		return $vista->mostrarTema($_PETICION, $_TEMA_APP);
	}
	
	function nuevo(){		
		$modelo = $this->getModelo();
		$obj=$modelo->nuevo( array() );
		
		$vista=$this->getVista();
		$vista->datos=$obj;		
		
		global $_TEMA_APP;
		global $_PETICION;
		$_PETICION->accion="edicion";
		return $vista->mostrarTema($_PETICION, $_TEMA_APP);
		
	
	}
	
	function guardar(){
		$modelo=$this->getModelo();
		$esNuevo = empty( $_POST['datos'][$modelo->pk] );
		global $_PETICION;
		$id=$_POST['datos'][$modelo->pk];
		
		if ( ( !empty($_POST['datos']['pass']) || !empty($_POST['datos']['confirmacion']) ) && ($_POST['datos']['pass'] != $_POST['datos']['confirmacion']) ){
			$respuesta = array(
				'success'	=>false,
				'msg'		=>'Las contraseñas no coinciden'
			);
			echo json_encode( $respuesta );
			return $respuesta;
		}
		
		$user = sessionGet('user');
		if ( $user['fk_rol'] != 1 && $user['id'] != $id && !$esNuevo ){
			$respuesta = array(
				'success'	=>false,
				'msg'		=>'No tiene permiso para editar este usuario',
				'titulo'	=>'Mensaje de la capa de seguridad'
			);
			
			echo json_encode($respuesta);
			return $respuesta;
		}
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
		
		$obj=$model->obtener( $id );			
		$vista=$this->getVista();				
		$vista->datos=$obj;		
		
		global $_PETICION;
		global $_TEMA_APP;
		$_PETICION->accion="edicion";
		$vista->mostrarTema($_PETICION,$_TEMA_APP);
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