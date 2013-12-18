<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
?>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/edicion.js"></script>

<script>			
	$( function(){	
		
		//---------------------
		<?php
		$resAnt = empty($_SESSION['res']) ? array() : $_SESSION['res'];
		unset($_SESSION['res']);
		?>
		var resAnt = <?php echo json_encode($resAnt); ?>;
		
		if (resAnt.success != undefined ){			
			var title='', msg	=resAnt.msg, icon='';
			if(resAnt.success){
				icon=kore.url_web+'imagenes/yes.png';
				title= 'Success';					
			}else{
				icon= kore.url_web+'imagenes/error.png';
				title= 'Error';
			}
			
			$.gritter.add({
				position: 'bottom-left',
				title:title,
				text: msg,
				image: icon,
				class_name: 'my-sticky-class'
			});
		}
		//---------------------
		var config={
			tab:{
				id:'<?php echo $_REQUEST['tabId']; ?>'
			},
			controlador:{
				nombre:'<?php echo $_PETICION->controlador; ?>'
			},
			modulo:{
				nombre:'<?php echo $_PETICION->modulo; ?>'
			},
			catalogo:{
				nombre:'Paginas',
				modelo:'Pagina'
			},			
			pk:"id"
			
		};				
		 var editor=new EdicionConceptos_documento();
		 editor.init(config);	
		//-----
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Concepto de Documento</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_cantidad" style=""  >
					<label style="">Cantidad:</label>
					<input type="text" name="cantidad" class="entradaDatos" value="<?php echo $this->datos['cantidad']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_concepto" style=""  >
					<label style="">Concepto:</label>
					<input type="text" name="concepto" class="entradaDatos" value="<?php echo $this->datos['concepto']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_um" style=""  >
					<label style="">Um:</label>
					<input type="text" name="um" class="entradaDatos" value="<?php echo $this->datos['um']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_precio_u" style=""  >
					<label style="">Precio_u:</label>
					<input type="text" name="precio_u" class="entradaDatos" value="<?php echo $this->datos['precio_u']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_importe" style=""  >
					<label style="">Importe:</label>
					<input type="text" name="importe" class="entradaDatos" value="<?php echo $this->datos['importe']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_documento" style=""  >
					<label style="">Fk_documento:</label>
					<input type="text" name="fk_documento" class="entradaDatos" value="<?php echo $this->datos['fk_documento']; ?>" style="width:500px;" />
				</div>
			</form>
			<div id="contenedorMenu2" class="toolbarEdicion">
				<input type="submit" value="Nuevo" class="botonNuevo btnNuevo">
				<input type="submit" value="Guardar" class="botonNuevo btnGuardar">
				<input type="submit" value="Eliminar" class="botonNuevo sinMargeDerecho btnDelete">
			</div>
		</div>
	</div>
</div>