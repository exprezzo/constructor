<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Hola Mundo</h1>
	</div>
	<div id="cuerpo" style="padding: 20px 0 20px 0;">				
		
			<?php
				$mod=getModelo( 'modulo' );
				$params=array();
				$modulos = $mod->buscar( $params );
				$apps = $modulos['datos'];
				print_r( $apps );
			?>
		
		
	</div>
</div>
