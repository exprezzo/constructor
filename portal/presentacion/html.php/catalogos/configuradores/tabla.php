<style>
	.formCompConfig label{ margin-left:0 !important; }
</style>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/config_tabla.js"></script>
<?php 
	$mod = new catalogoModelo();
	$res=$mod->buscar(array());
	$catalogos=$res['datos'];
	// print_r( $this->datos );
?>
<form class="formCompConfig">
	<div>
		<div class="inputBox">
			<label>Titulo</label>
			<input name="titulo"  class="entradaDatos" value="<?php echo $this->datos['titulo']; ?>" />
		</div>				
		<div class="inputBox" style=""  >
			<label style="">Editable:</label>
			<input type="text" name="editable" class="entradaDatos" style="width:200px;" value="<?php echo $this->datos['editable']; ?>" />
		</div>
		<div class="inputBox" style=""  >
			<label style="">Catalogo:</label>
			<select name="target" class="entradaDatos" style="width:200px;">
				<?php
					foreach($catalogos as $cat){
						$selected= ($this->datos['target'] ==$cat['id'] )? 'selected': '';
						echo '<option '.$selected.' value="'.$cat['id'].'" >'.$cat['nombre'].' </option>';
					}
				?>
			</select>		
		</div>				
		
		
	</div>
</form>
<script>
	$( function(){	
		var configTabla=new ConfigTabla();
		configTabla.init();		
	});
</script>