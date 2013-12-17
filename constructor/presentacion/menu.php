<?php
	require_once $_PETICION->basePath.'/modelos/Catalogo.php';
	$catMod = new catalogoModelo();
	$params=array(
		'filtros'=>array(
			array(
				'dataKey'=>'fk_modulo',
				'filterValue'=>3,
				'filterOperator'=>'equals'
			)
		)
	);
	$catalogos = $catMod->buscar( $params );		
	$catalogos = $catalogos['datos'];

?>
<ul class="nav">                    	
	<li>
		<a href="#">Catálogos<span class="flecha">∨</span></a>
		<ul>
			<?php
			foreach($catalogos as $cat){
				// print_r($cat);
				echo '<li><a href="'.$_PETICION->url_app.$_PETICION->modulo.'/'.$cat['controlador'].'/buscar" class="elemento">'.$cat['nombre'].'<span class="flecha">∨</span></a></li>';
			}
			?>
		</ul>
	</li>
	<li>
		<a href="#">Configuración<span class="flecha">∨</span></a>
		
	</li>                                        
	<li>
		<a href="#">Ayuda<span class="flecha">∨</span></a>
		
		
	</li>
</ul>