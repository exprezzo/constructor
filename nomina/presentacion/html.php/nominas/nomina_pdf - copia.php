<?php 
require_once '../php_libs/tcpdf/tcpdf.php';
class NominaPdf extends TCPDF{
	
	function imprimir(  ){
		$datos=$this->datos;
		$w=0;
		$h = 0;
		$txt = '';
		$border = 0;
		$ln = 0;
		$align = '';
		$fill = false;
		$link = '';
		$stretch = 0;
		$ignore_min_height = false;
		$calign = 'T';
		$valign = 'M' ;
		// $this->Cell($w, $h, $txt, $border, $ln, $align, $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
		
		$lblW=24;
		//-----------------------
		$txt= 'Patrón: ';
		$this->SetFont($family='Courier', $style = 'B', $size = null, $fontfile = '', $subset = 'default', $out = true );		
		$this->Cell($lblW, $h, $txt, $border, $ln, $align, $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
		
		$txt= $datos['razon_social_fk_patron'];		
		$this->SetFont($family='Courier', $style = '', $size = null, $fontfile = '', $subset = 'default', $out = true );		
		$this->Cell($w, $h, $txt, $border, 1, $align, $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
		//-----------------------
		$txt= 'Empleado: ';
		$this->SetFont($family='Courier', $style = 'B', $size = null, $fontfile = '', $subset = 'default', $out = true );		
		$this->Cell($lblW, $h, $txt, $border, $ln, $align, $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
		
		$txt= $datos['nombre_fk_empleado'];		
		$this->SetFont($family='Courier', $style = '', $size = null, $fontfile = '', $subset = 'default', $out = true );		
		$this->Cell($w, $h, $txt, $border, 1, $align, $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
		//-----------------------
	}
	
	function header(){
		$datos=$this->datos;
		$w=0;
		$h = 0;
		$txt = '';
		$border = 0;
		$ln = 0;
		$align = '';
		$fill = false;
		$link = '';
		$stretch = 0;
		$ignore_min_height = false;
		$calign = 'T';
		$valign = 'M' ;
		// $this->Cell($w, $h, $txt, $border, $ln, $align, $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
		
		$txt= 'Recibo de Nomina: '.$datos['serie'].' '.$datos['folio'];
		$this->Cell($w, $h, $txt, $border, $ln, 'C', $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
	}
}
?>