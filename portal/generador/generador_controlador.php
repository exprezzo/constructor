<?php
class GeneradorControlador{
	
	function getRequire($modelo){
		return '
require_once $_PETICION->basePath.\'/modelos/'.$modelo.'.php\';';
	}
	
	function generarCodigoCombo( $modelo ){
		$modMay = ucfirst( $modelo );
		$codigo='
		function buscar'.$modMay.'(){
			$'.$modelo.'Mod= new '.$modelo.'Modelo();
			$res = $'.$modelo.'Mod->buscar( array() );
			echo json_encode( $res );
		}
		';
		return $codigo;
	}
	
	function generar($cat, $rutaBase){
		// CREAR CONTROLADOR
		$directorio = $rutaBase.'controladores/';
		if ( !file_exists($directorio)) {
			mkdir($directorio);
		}
		$filename = dirname(__FILE__).'/plantillas/controlador.php';
		$handle = fopen($filename, "r");
		$conStr= fread($handle, filesize($filename));
		fclose($handle);
		//------------------------------------------
		$conStr=$this->generarCodigo( $conStr, $cat );
		//---------------------------------------NUEVO
		$filename = $directorio.$cat['controlador'].'.php';
		$handle = fopen($filename, "w");
		$conStr= fwrite($handle, $conStr, strlen($conStr));
		fclose($handle);
		//----------------------------------------------		
		return array(
			'success'=>true,
			'msg'=>'ContGen. Generado '
		);
	}
	function generarCodigo( $conStr, $cat ){
	
		$conStr = str_replace('{MODELO}', $cat['modelo'], $conStr);
		$conStr = str_replace('class Controlador', 'class '.$cat['controlador'], $conStr);
		
		$crlf = "\r\n";
		$strRequire=$this->getRequire( $cat['modelo'] );
		$codigoCombo='';
		foreach($cat['elementos'] as $el){
			$config=json_decode($el['comp_config'], true);

			if ( strtolower( $el['componente'] ) ==  'combo box' ){
			
				$fk_modelo=$config['target'];
				$modeloMod = new modelocModelo();
				$modeloObj =$modeloMod->obtener( array('id'=>$fk_modelo)  );
				$strRequire .=$crlf.$this->getRequire( $modeloObj['nombre'] );
				
				$codigoCombo .= $this->generarCodigoCombo( $modeloObj['nombre'] );
			}	else if ( strtolower( $el['componente'] ) ==  'tabla' ){
				// print_r($config);
				$fk_catalogo=$config['target'];
				$catMod = new catalogoModelo();
				$cat_obj =$catMod->obtener( array('id'=>$fk_catalogo)  );
				// print_r( $cat_obj );
				$strRequire .=$crlf.$this->getRequire( $cat_obj['modelo'] );
			}			
		}
		
		$conStr = str_replace('//{REQUIRE-CLASES}', $strRequire.$crlf, $conStr);
		$conStr = str_replace('//{FUNCIONES-COMBO}', $codigoCombo, $conStr);
		
		return  $conStr;
		
	}
	
}
?>