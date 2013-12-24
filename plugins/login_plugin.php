<?php
class LoginPlugin implements SplObserver {
	 public function update(SplSubject $subject)
    {
		global $_PETICION, $APP_CONFIG;		
        if ( $subject->revisarSession!==false ){
			// print_r($subject); exit;
			$accion = $_PETICION->accion;
			if ( !in_array($accion, $subject->accionesPublicas ) ){
				if ( !isLoged() ){
					$peticion='/'.$_SERVER['SERVER_NAME'].$_PETICION->url_app.$_SERVER['PATH_INFO'];
					sessionAdd('_PETICION',$peticion);
					// $_SESSION[$_PETICION->modulo]['_PETICION'] = ;
					global $_DEFAUL_LAYOUT;
					// $_DEFAUL_LAYOUT='presentacion/userp/login.html.php';
					// echo $APP_CONFIG; exit;
					$vista=$subject->getVista();
					
					$_PETICION->controlador='userp';
					$_PETICION->accion='login';
					$vista->mostrar();
					// header('Location: '.$_PETICION->url_app.'plugins/userp/login');					
					// exit;
				}
			}
		}
		
		return true;
    }
}
?>