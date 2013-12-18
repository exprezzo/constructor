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
if ( !empty( $this->datos['fk_solicitante'] ) ){
			
			$fk_solicitante_listado=array();
			$fk_solicitante_listado[]=array('id'=>$this->datos['fk_solicitante'],'nombre'=>$this->datos['nombre_fk_solicitante'] );
			$this->fk_solicitante_listado = $fk_solicitante_listado;
		}else{
			$mod=new usuarioModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_solicitante_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_empresa'] ) ){
			
			$fk_empresa_listado=array();
			$fk_empresa_listado[]=array('id'=>$this->datos['fk_empresa'],'nombre'=>$this->datos['nombre_fk_empresa'] );
			$this->fk_empresa_listado = $fk_empresa_listado;
		}else{
			$mod=new empresaModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_empresa_listado = $objs['datos'];
		}
?>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/edicion.js"></script>

<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/eventos_de_reporte.js"></script>
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
		 var editor=new EdicionReportes();
		 editor.init(config);	
		//-----
		
		var tabId='#'+config.tab.id;
		config={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['eventosDeReporte']); ?>,
			target:'.tabla_eventos',
			contenedor:'.contenedor_tabla_eventos',
		};

		var eventosDeReporte = new EventosDeReporte();		
		eventosDeReporte.init(config);
				
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Reporte</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_descripcion" style=""  >
					<label style="">Descripcion:</label>
					<input type="text" name="descripcion" class="entradaDatos" value="<?php echo $this->datos['descripcion']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_num_reporte" style=""  >
					<label style="">No de Reporte:</label>
					<input type="text" name="num_reporte" class="entradaDatos" value="<?php echo $this->datos['num_reporte']; ?>" style="width:500px;" />
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
				<div class="inputBox contenedor_fk_solicitante" style=""  >
					<label style="">Solicitante:</label>
					<select name="fk_solicitante" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_solicitante_listado as $usuario){
								echo '<option value="'.$usuario['id'].' " >'.$usuario['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_empresa" style=""  >
					<label style="">Empresa:</label>
					<select name="fk_empresa" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_empresa_listado as $empresa){
								echo '<option value="'.$empresa['id'].' " >'.$empresa['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_status" style=""  >
					<label style="">Status:</label>
					<input type="text" name="status" class="entradaDatos" value="<?php echo $this->datos['status']; ?>" style="width:500px;" />
				</div>
				<div class="tabla contenedor_tabla_eventos" style=""  >
					
					<h1 style="">Eventos</h1>
					<div class="toolbar_detalles" style="margin-right: 44px;">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_eventos">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-evento" title="&iquest;Eliminar Evento?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Evento?</p>
					</div> 
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