<?php
	require_once $_PETICION->basePath.'/modelos/Catalogo_modelo.php';
	$catMod = new catalogoModelo();
	$catalogos = $catMod->buscar( array() );
	$catalogos = $catalogos['datos'];
	// echo '<pre>';
	// print_r($catalogos);
	// echo '</pre>';
?>
<ul class="nav">                    	
	<li>
		<a href="#">Catálogos<span class="flecha">∨</span></a>
		<ul>
			<?php
			foreach($catalogos as $cat){
				// print_r($cat);
				echo '<li><a href="'.$_PETICION->url_app.'portal/'.$cat['controlador'].'/buscar" class="elemento">'.$cat['nombre'].'<span class="flecha">∨</span></a></li>';
			}
			?>
		</ul>
	</li>
	<li>
		<a href="#">Configuración<span class="flecha">∨</span></a>
		<ul>
			<li><a href="<?php echo $_PETICION->url_app; ?>usuarios/buscar" class="elementoTop">Usuarios<span class="flecha">∨</span></a></li>	
		</ul>
	</li>                                        
	<li>
		<a href="#">Ayuda<span class="flecha">∨</span></a>
		
		
	</li>
</ul>