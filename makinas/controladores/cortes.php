<?php

require_once $_PETICION->basePath.'/modelos/corte.php';
require_once $_PETICION->basePath.'/modelos/maquina.php';
require_once $_PETICION->basePath.'/modelos/cliente.php';
require_once $_PETICION->basePath.'/modelos/punto_de_venta.php';
require_once $_PETICION->basePath.'/modelos/tecnico.php';
require_once $_PETICION->basePath.'/modelos/serie.php';
require_once $_PETICION->basePath.'/presentacion/html.php/cortes/corte_detalle_pdf.php';

class cortes extends Controlador{
	var $modelo="corte";	
	
	
		function buscarMaquina(){
			$maquinaMod= new maquinaModelo();
			$res = $maquinaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarCliente(){
			$clienteMod= new clienteModelo();
			$res = $clienteMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarPunto_de_venta(){
			$punto_de_ventaMod= new punto_de_ventaModelo();
			$res = $punto_de_ventaMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarTecnico(){
			$tecnicoMod= new tecnicoModelo();
			$res = $tecnicoMod->buscar( array() );
			echo json_encode( $res );
		}
		
		function buscarSerie(){
			$serieMod= new serieModelo();
			$res = $serieMod->buscar( array() );
			echo json_encode( $res );
		}
		
	
	function mostrarVista( $archivos=""){
		$vista= $this->getVista();
		
		global $_TEMA_APP;
		global $_PETICION;
		return $vista->mostrarTema($_PETICION, $_TEMA_APP);
	}
	
	function getPdf(){
		$corteDetallePdf = new CorteDetallePdf('P','mm','letter');
		
		$corteDetallePdf->AddPage();		
		$nombreArchivo='preview.pdf';
		$pdf=$corteDetallePdf->Output($nombreArchivo.'.pdf', 'S');		
		$filename='preview.pdf';
		
		header ("Content-Length: ".strlen($pdf)); 
		header ("Content-Disposition: attachment; filename=".$nombreArchivo);
		header ("Content-Type: application/octet-stream");
		echo $pdf;
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
		
		$fecha=$_POST['datos']['fecha'].' '.$_POST['datos']['hora'];
		$fecha = date_create_from_format('d/m/Y H:i', $fecha);
		$_POST['datos']['fecha']  = $fecha->format('Y-m-d H:i:s');
		
		$_POST['datos']['diferencia'] = str_replace(',','',$_POST['datos']['diferencia']);
		$_POST['datos']['cont_entrada'] = str_replace(',','',$_POST['datos']['cont_entrada']);
		$_POST['datos']['cont_salida'] = str_replace(',','',$_POST['datos']['cont_salida']);
		$_POST['datos']['saldo_contadores'] = str_replace(',','',$_POST['datos']['saldo_contadores']);
		$_POST['datos']['monto'] = str_replace(',','',$_POST['datos']['monto']);
		
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
		$obj['diferencia'] = number_format($obj['diferencia'],2,'.',',');
		
		$obj['cont_entrada'] = number_format($obj['cont_entrada'],2,'.',',');
		$obj['cont_salida'] = number_format($obj['cont_salida'],2,'.',',');
		$obj['saldo_contadores'] = number_format($obj['saldo_contadores'],2,'.',',');
		$obj['monto'] = number_format($obj['monto'],2,'.',',');
		
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