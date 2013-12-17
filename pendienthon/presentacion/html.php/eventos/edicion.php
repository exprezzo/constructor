<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['fk_autor'] ) ){
			
			$fk_autor_listado=array();
			$fk_autor_listado[]=array('id'=>$this->datos['fk_autor'],'nombre'=>$this->datos['nombre_fk_autor'] );
			$this->fk_autor_listado = $fk_autor_listado;
		}else{
			$mod=new usuarioModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_autor_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_reporte'] ) ){
			
			$fk_reporte_listado=array();
			$fk_reporte_listado[]=array('id'=>$this->datos['fk_reporte'],'num_reporte'=>$this->datos['num_reporte_fk_reporte'] );
			$this->fk_reporte_listado = $fk_reporte_listado;
		}else{
			$mod=new reporteModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_reporte_listado = $objs['datos'];
		}
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
		 var editor=new EdicionEventos();
		 editor.init(config);	
		//-----
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Evento</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fecha" style=""  >
					<label style="">Fecha:</label>
					<input type="text" name="fecha" class="entradaDatos" value="<?php echo $this->datos['fecha']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_descripcion" style=""  >
					<label style="">Descripcion:</label>
					<input type="text" name="descripcion" class="entradaDatos" value="<?php echo $this->datos['descripcion']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_autor" style=""  >
					<label style="">Autor:</label>
					<select name="fk_autor" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_autor_listado as $usuario){
								echo '<option value="'.$usuario['id'].' " >'.$usuario['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_estado" style=""  >
					<label style="">Estado:</label>
					<input type="text" name="estado" class="entradaDatos" value="<?php echo $this->datos['estado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_reporte" style=""  >
					<label style="">Fk_reporte:</label>
					<select name="fk_reporte" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_reporte_listado as $reporte){
								echo '<option value="'.$reporte['id'].' " >'.$reporte['num_reporte'].'</option>';
							}
						?>
					</select>
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