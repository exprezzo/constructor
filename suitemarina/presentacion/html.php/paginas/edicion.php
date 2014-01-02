<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['id'] ) ){
			
			$autor_listado=array();
			$autor_listado[]=array('id'=>$this->datos['autor'],'name'=>$this->datos['name_autor'] );
			$this->autor_listado = $autor_listado;
		}else{
			$mod=new UsuarioModelo();
			$objs=$mod->buscar( array() );		
			$this->autor_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_categoria_pagina_listado=array();
			$fk_categoria_pagina_listado[]=array('id'=>$this->datos['fk_categoria_pagina'],'nombre'=>$this->datos['nombre_fk_categoria_pagina'] );
			$this->fk_categoria_pagina_listado = $fk_categoria_pagina_listado;
		}else{
			$mod=new UsuarioModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_categoria_pagina_listado = $objs['datos'];
		}
?>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/edicion.js"></script>

<script>			
	$( function(){	
		
		//---------------------
		<?php
		$resAntS = sessionGet('res');
		$resAnt = empty($resAntS) ? array() : $resAntS;		
		sessionUnset('res');
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
		 var editor=new EdicionPaginas();
		 editor.init(config);	
		//-----
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nueva Pagina</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input title="" type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_titulo oculto" style=""  >
					<label style="">Titulo:</label>
					<input title="" type="text" name="titulo" class="entradaDatos" value="<?php echo $this->datos['titulo']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_autor" style=""  >
					<label style="">Autor:</label>
					<select name="autor" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->autor_listado as $Usuario){
								echo '<option value="'.$Usuario['id'].' " >'.$Usuario['name'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_contenido" style=""  >
					<label style="">Contenido:</label>
					<input title="" type="text" name="contenido" class="entradaDatos" value="<?php echo $this->datos['contenido']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_categoria_pagina" style=""  >
					<label style="">Fk_categoria_pagina:</label>
					<select name="fk_categoria_pagina" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_categoria_pagina_listado as $Usuario){
								echo '<option value="'.$Usuario['id'].' " >'.$Usuario['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fecha_creacion oculto" style=""  >
					<label style="">Fecha Creacion:</label>
					<input title="" type="text" name="fecha_creacion" class="entradaDatos" value="<?php echo $this->datos['fecha_creacion']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_ultima_edicion" style=""  >
					<label style="">:</label>
					<input title="" type="text" name="ultima_edicion" class="entradaDatos" value="<?php echo $this->datos['ultima_edicion']; ?>" style="width:500px;" />
				</div>
			</form>
			<div id="contenedorMenu2" class="toolbarEdicion">
				<input type="submit" value="Nuevo" class="botonNuevo btnNuevo">
				<input type="submit" value="Guardar" class="botonNuevo btnGuardar">
				<input type="submit" value="PDF" class="botonNuevo btnPdf">
				<input type="submit" value="Eliminar" class="botonNuevo sinMargeDerecho btnDelete">
			</div>
		</div>
	</div>
</div>