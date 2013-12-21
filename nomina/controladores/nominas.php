<?php

require_once $_PETICION->basePath.'/modelos/nomina.php';

require_once $_PETICION->basePath.'/modelos/empresa.php';

require_once $_PETICION->basePath.'/modelos/trabajador.php';

require_once $_PETICION->basePath.'/modelos/serie_nomina.php';

require_once $_PETICION->basePath.'/modelos/regimen_contratacion.php';

require_once $_PETICION->basePath.'/modelos/departamento.php';

require_once $_PETICION->basePath.'/modelos/regimen_contratacion.php';

require_once $_PETICION->basePath.'/modelos/jornada.php';

require_once $_PETICION->basePath.'/modelos/periodo_pago.php';

require_once $_PETICION->basePath.'/modelos/banco.php';

require_once $_PETICION->basePath.'/modelos/riesgo.php';

require_once $_PETICION->basePath.'/modelos/percepcion_nomina.php';

require_once $_PETICION->basePath.'/modelos/deduccion_nomina.php';

require_once $_PETICION->basePath.'/modelos/incapacidad.php';

require_once $_PETICION->basePath.'/modelos/hora_extra_nomina.php';

class nominas extends Controlador{
	var $modelo="nomina";	
	
	
		function buscarEmpresa(){
			$empresaMod= new empresaModelo();
			$res = $empresaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarTrabajador(){
			$trabajadorMod= new trabajadorModelo();
			$res = $trabajadorMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarSerie_nomina(){
			$serie_nominaMod= new serie_nominaModelo();
			$res = $serie_nominaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarRegimen_contratacion(){
			$regimen_contratacionMod= new regimen_contratacionModelo();
			$res = $regimen_contratacionMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarDepartamento(){
			$departamentoMod= new departamentoModelo();
			$res = $departamentoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarJornada(){
			$jornadaMod= new jornadaModelo();
			$res = $jornadaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarPeriodo_pago(){
			$periodo_pagoMod= new periodo_pagoModelo();
			$res = $periodo_pagoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarBanco(){
			$bancoMod= new bancoModelo();
			$res = $bancoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarRiesgo(){
			$riesgoMod= new riesgoModelo();
			$res = $riesgoMod->buscar( array() );
			echo json_encode( $res );
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