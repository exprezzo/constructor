<?php
class HtmlFormGen{
	function generar($cat){
		$plantillaStr=$this->getPlantilla();
		
		
		foreach($cat['elementos'] as $el){
			$plantillaStr=$this->generarElemento($el);
		}
		
		$this->guardarPlantilla();
	
	}
	function generarElemento($el, $plantillaStr){
	
	}
	
	function getFormularioPlantilla(){
		return '';
	}
}
?>