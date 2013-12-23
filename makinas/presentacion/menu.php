<?php
	require_once '../portal/modelos/catalogo_modelo.php';
	require_once '../portal/modelos/modulo.php';
	
	$moduMod = new moduloModelo();
	$modulos = $moduMod->buscar( array() );		
	$modulos = $modulos['datos'];
	
	$catMod = new catalogoModelo();
	

	$params = array(
		'filtros'=>array(
			array(
				'dataKey'=>'fk_modulo',
				'filterOperator'=>'equals',
				'filterValue'=>6
			)
		)
	);
	$catalogos = $catMod->buscar( $params );		
	$catalogos=$catalogos['datos'];
	// 

?>
<ul class="nav">                    	
	<li>
		<a href="#">Catálogos<span class="flecha">∨</span></a>
		<ul>
			<?php
			$size=sizeof($catalogos) - 1;
			for($i=0; $i < $size ; $i++ ){
			
				$cat=$catalogos[$i];
				// print_r($mod);
				 // echo '<li><a href="#" >'.$mod['nombre'].'</a><ul>';
				// foreach($mod['catalogos'] as $cat){
					// print_r($cat);
					if ($i==0){
						$clase='elementoTop';
					}elseif ($i==($size-1)){
						$clase='elementoBottom';
					}else{
						$clase='';
					}
					echo '<li><a href="'.$_PETICION->url_app.$_PETICION->modulo.'/'.$cat['controlador'].'/buscar" class="elemento '.$clase.'">'.$cat['nombre'].'<span class="flecha">∨</span></a></li>';
				// }
				// echo '</ul></li>';
			}
			
			?>
		</ul>
	</li>
	<li>
		<a href="#">Documentos<span class="flecha">∨</span></a>
		<ul>
			<li><a href="<?php echo $_PETICION->url_app.$_PETICION->modulo; ?>/cortes/buscar" class="elementoTop elementoBottom">Cortes<span class="flecha">∨</span></a></li>	
		</ul>
	</li>                                        
	<li>
		<a href="#">Ayuda<span class="flecha">∨</span></a>
		
		
	</li>
</ul>