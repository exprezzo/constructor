
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
		 var editor=new Edicionpaginas();
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
    	<h1>Nueva Pagina</h1>
	</div>
	<div id="cuerpo" >				
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Titulo:</label>
					<input type="text" name="titulo" class="entradaDatos" value="<?php echo $this->datos['titulo']; ?>" style="width:500px;" />
				</div>

				

				<div class="inputBox" style=""  >
					<label style="">Contenido:</label>
					<input type="text" name="contenido" class="entradaDatos" value="<?php echo $this->datos['contenido']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox" style=""  >
					<label style="">Categoria:</label>
					<input type="text"  class="entradaDatos" value="<?php echo $this->datos['nombre_categoria']; ?>" style="width:500px;" />
				</div>
				
				<div class="inputBox" style=""  >
					<label style="">Fk_categoria_pagina:</label>
					<input type="text" name="fk_categoria_pagina" class="entradaDatos" value="<?php echo $this->datos['fk_categoria_pagina']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox" style=""  >
					<label style="">Autor:</label>
					<input type="text"  class="entradaDatos" value="<?php echo $this->datos['name_autor']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox" style=""  >
					<label style="">fk_utor:</label>
					<input type="text" name="autor" class="entradaDatos" value="<?php echo $this->datos['autor']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Fecha_creacion:</label>
					<input type="text" name="fecha_creacion" class="entradaDatos" value="<?php echo $this->datos['fecha_creacion']; ?>" style="width:500px;" />
				</div>

				<div class="inputBox" style=""  >
					<label style="">Ultima_edicion:</label>
					<input type="text" name="ultima_edicion" class="entradaDatos" value="<?php echo $this->datos['ultima_edicion']; ?>" style="width:500px;" />
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