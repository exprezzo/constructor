
<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;			
	
?>
<script src="<?php echo $_PETICION->url_web; ?>js/navegacion_en_tabla.js"></script>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/edicion.js"></script>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/grid_elementos.js"></script>

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
				nombre:'Catalogos',
				modelo:'Catalogo'
			},			
			pk:"id"
			
		};				
		 var editor=new Edicioncatalogos();
		 editor.init(config);	

		
	});
</script>
<style>
.entradaDatos, input[role="textbox"]{
	/* float:right; */
	background-color:#f2f2f2  !important;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	border-top: 0px;
	border-right: 0px;
	border-left: 0px;
	border-bottom-color:#508b96  !important;
	border-bottom-style:solid !important;
	border-bottom-width:1px  !important;
	-webkit-box-shadow: 0px 3px #d6e6e9  !important;
    -moz-box-shadow: 0px 3px #d6e6e9  !important;
	box-shadow: 0px 3px #d6e6e9  !important;
	/* width:365px; */
	height:23px;
	/*height:43px;*/
	/* margin-bottom:25px; */
	font-family:"OpenSans-Light", sans-serif;
	font-size:17px;
	
	color:black  !important;
}
</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Catalogo</h1>
	</div>
	<div id="cuerpo" >				
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox" style="display:none;"  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Modulo:</label>
					<select name="fk_modulo">
						<?php							
							foreach($this->modulos as $mod){							
								$selected= ( $this->datos['fk_modulo'] == $mod['id'] )? 'selected' : '' ;
								echo '<option '.$selected.' value="'.$mod['id'].'">'.$mod['nombre'].'</option>';
							}
						?>
					</select>					
				</div>

				<div class="inputBox" style=""  >
					<label style="">Nombre:</label>
					<input type="text" name="nombre" class="entradaDatos" value="<?php echo $this->datos['nombre']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Controlador:</label>
					<input type="text" name="controlador" class="entradaDatos" value="<?php echo $this->datos['controlador']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Modelo:</label>
					<input type="text" name="modelo" class="entradaDatos" value="<?php echo $this->datos['modelo']; ?>" style="width:500px;" />
				</div>

				

				<div class="inputBox" style=""  >
					<label style="">Icono:</label>
					<input type="text" name="icono" class="entradaDatos" value="<?php echo $this->datos['icono']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Titulo_nuevo:</label>
					<input type="text" name="titulo_nuevo" class="entradaDatos" value="<?php echo $this->datos['titulo_nuevo']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Titulo_edicion:</label>
					<input type="text" name="titulo_edicion" class="entradaDatos" value="<?php echo $this->datos['titulo_edicion']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Titulo_busqueda:</label>
					<input type="text" name="titulo_busqueda" class="entradaDatos" value="<?php echo $this->datos['titulo_busqueda']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Msg_creado:</label>
					<input type="text" name="msg_creado" class="entradaDatos" value="<?php echo $this->datos['msg_creado']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Msg_actualizado:</label>
					<input type="text" name="msg_actualizado" class="entradaDatos" value="<?php echo $this->datos['msg_actualizado']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Pregunta_eliminar:</label>
					<input type="text" name="pregunta_eliminar" class="entradaDatos" value="<?php echo $this->datos['pregunta_eliminar']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Msg_eliminado:</label>
					<input type="text" name="msg_eliminado" class="entradaDatos" value="<?php echo $this->datos['msg_eliminado']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Msg_cambios:</label>
					<input type="text" name="msg_cambios" class="entradaDatos" value="<?php echo $this->datos['msg_cambios']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox " style=""  >
					<label style="">Campos_busqueda:</label>
					<input type="text" name="campos_busqueda" class="entradaDatos" value="<?php echo $this->datos['campos_busqueda']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedorTabla" style=""  >
					<label style="">Tabla:</label>					
					<select name="tabla">
						<?php							
							foreach($this->tablas as $tabla){							
								$selected= ( $this->datos['tabla'] == $tabla['nombre'] )? 'selected' : '' ;
								echo '<option '.$selected.' >'.$tabla['nombre'].'</option>';
							}
						?>
					</select>
					<input type="button"  class="botonNuevo btnRecargarTabla" value="recargar"  text="recargar" style="margin: auto; position: absolute; margin-left: 13px; height: 32px;" />
				</div>
				
				
				<div class="inputBox" style=""  >
					<label style="">Pk_tabla:</label>
					<input type="text" name="pk_tabla" class="entradaDatos" value="<?php echo $this->datos['pk_tabla']; ?>" style="width:500px;" />
				</div>
			</form>
			<h1>Elementos</h1>
			<table class="tablaElementos">
				<thead>
					<th>id</th>		
					<th>Campo</th>					
					<th>Tipo</th>
				</thead>  	 
				<tbody>			
				</tbody>
			</table>
			<div id="contenedorMenu2" class="toolbarEdicion">
				<input type="submit" value="Nuevo" class="botonNuevo btnNuevo">
				<input type="submit" value="Guardar" class="botonNuevo btnGuardar">
				<input type="submit" value="Eliminar" class="botonNuevo sinMargeDerecho btnDelete">
			</div>
		</div>		
	</div>
</div>