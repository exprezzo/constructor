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
		 var editor=new EdicionCatalogos();
		 editor.init(config);	
		//-----
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Catalogo</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_modulo" style=""  >
					<label style="">Fk_modulo:</label>
					<input type="text" name="fk_modulo" class="entradaDatos" value="<?php echo $this->datos['fk_modulo']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_nombre" style=""  >
					<label style="">Nombre:</label>
					<input type="text" name="nombre" class="entradaDatos" value="<?php echo $this->datos['nombre']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_controlador" style=""  >
					<label style="">Controlador:</label>
					<input type="text" name="controlador" class="entradaDatos" value="<?php echo $this->datos['controlador']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_modelo" style=""  >
					<label style="">Modelo:</label>
					<input type="text" name="modelo" class="entradaDatos" value="<?php echo $this->datos['modelo']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_tabla" style=""  >
					<label style="">Tabla:</label>
					<input type="text" name="tabla" class="entradaDatos" value="<?php echo $this->datos['tabla']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_pk_tabla" style=""  >
					<label style="">Pk_tabla:</label>
					<input type="text" name="pk_tabla" class="entradaDatos" value="<?php echo $this->datos['pk_tabla']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_icono" style=""  >
					<label style="">Icono:</label>
					<input type="text" name="icono" class="entradaDatos" value="<?php echo $this->datos['icono']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_titulo_nuevo" style=""  >
					<label style="">Titulo_nuevo:</label>
					<input type="text" name="titulo_nuevo" class="entradaDatos" value="<?php echo $this->datos['titulo_nuevo']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_titulo_edicion" style=""  >
					<label style="">Titulo_edicion:</label>
					<input type="text" name="titulo_edicion" class="entradaDatos" value="<?php echo $this->datos['titulo_edicion']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_titulo_busqueda" style=""  >
					<label style="">Titulo_busqueda:</label>
					<input type="text" name="titulo_busqueda" class="entradaDatos" value="<?php echo $this->datos['titulo_busqueda']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_msg_creado" style=""  >
					<label style="">Msg_creado:</label>
					<input type="text" name="msg_creado" class="entradaDatos" value="<?php echo $this->datos['msg_creado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_msg_actualizado" style=""  >
					<label style="">Msg_actualizado:</label>
					<input type="text" name="msg_actualizado" class="entradaDatos" value="<?php echo $this->datos['msg_actualizado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_pregunta_eliminar" style=""  >
					<label style="">Pregunta_eliminar:</label>
					<input type="text" name="pregunta_eliminar" class="entradaDatos" value="<?php echo $this->datos['pregunta_eliminar']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_msg_eliminado" style=""  >
					<label style="">Msg_eliminado:</label>
					<input type="text" name="msg_eliminado" class="entradaDatos" value="<?php echo $this->datos['msg_eliminado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_msg_cambios" style=""  >
					<label style="">Msg_cambios:</label>
					<input type="text" name="msg_cambios" class="entradaDatos" value="<?php echo $this->datos['msg_cambios']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_campos_busqueda" style=""  >
					<label style="">Campos_busqueda:</label>
					<input type="text" name="campos_busqueda" class="entradaDatos" value="<?php echo $this->datos['campos_busqueda']; ?>" style="width:500px;" />
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