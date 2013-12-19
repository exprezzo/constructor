<?php
require_once '../php_libs/tcpdf/tcpdf.php';


class CorteDetallePdf extends TCPDF{
	//Page header	

	
    public function Header() {
        
        $this->SetFont('Courier', '', 15);				
		$w=0;
		$h = 0;		
		$border =0;
		$ln = 1;
		$align = '';
		$fill = false;
		$link = '';
		$stretch = 0;
		$ignore_min_height = false;
		$calign = 'T';
		$valign = 'M';		
		$xMargen=10;		
		 $this->setY(6);
				
		$this->setX(40);		
		$txt='Corte ';				
		 
		$this->cell($w,$h,$txt, $border, $ln, 'L', $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
					
    }

	
    // Page footer
    public function Footer() {
		
		
		//--------------------------------
		$w=0;
		$h = 0;		
		$border =0;
		$ln = 1;
		$align = '';
		$fill = false;
		$link = '';
		$stretch = 0;
		$ignore_min_height = false;
		$calign = 'T';
		$valign = 'M';		
		
		
        // Position at 15 mm from bottom
        $this->SetY(-10);
		$this->setX(10);
		// $txt = utf8_encode('Este documento es una representación impresa de un CFDI');
		// $this->cell(40,$h,$txt, $border, true, 'L', $fill, $link, $stretch, $ignore_min_height, $calign, $valign);
		
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
		if ( empty($this->datos['modoPrueba']) ){
			$txt = utf8_encode('Este documento es una representación impresa de un CFDI');
		}else{
			$txt='FACTURA DE PRUEBA: este documento no tiene validez fiscal';
		}
		
		$this->Cell(150, 10, $txt, 0, false, 'L', 0, '', 0, false, 'T', 'M');
		
		$this->Cell(57, 10, 'Pagina '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');
		
        // $this->Cell(0, 10, 'Pagina '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
	
	
}
?>