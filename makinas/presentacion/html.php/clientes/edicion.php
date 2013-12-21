<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['fk_pais'] ) ){
			
			$fk_pais_listado=array();
			$fk_pais_listado[]=array('id'=>$this->datos['fk_pais'],'nombre'=>$this->datos['nombre_fk_pais'] );
			$this->fk_pais_listado = $fk_pais_listado;
		}else{
			$mod=new paisModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_pais_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_estado'] ) ){
			
			$fk_estado_listado=array();
			$fk_estado_listado[]=array('id'=>$this->datos['fk_estado'],'nombre'=>$this->datos['nombre_fk_estado'] );
			$this->fk_estado_listado = $fk_estado_listado;
		}else{
			$mod=new estadoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_estado_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_municipio'] ) ){
			
			$fk_municipio_listado=array();
			$fk_municipio_listado[]=array('id'=>$this->datos['fk_municipio'],'nombre'=>$this->datos['nombre_fk_municipio'] );
			$this->fk_municipio_listado = $fk_municipio_listado;
		}else{
			$mod=new municipioModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_municipio_listado = $objs['datos'];
		}
?>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/edicion.js"></script>

<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/pdvs_de_cliente.js"></script>
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
		 var editor=new EdicionClientes();
		 editor.init(config);	
		//-----
		
		var tabId='#'+config.tab.id;
		config={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['pdvsDeCliente']); ?>,
			target:'.tabla_pdvs',
			contenedor:'.contenedor_tabla_pdvs',
		};

		var pdvsDeCliente = new PdvsDeCliente();		
		pdvsDeCliente.init(config);
				
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Cliente</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_nombre" style=""  >
					<label style="">Nombre:</label>
					<input type="text" name="nombre" class="entradaDatos" value="<?php echo $this->datos['nombre']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_email" style=""  >
					<label style="">Email:</label>
					<input type="text" name="email" class="entradaDatos" value="<?php echo $this->datos['email']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_datos_de_contacto" style=""  >
					<label style="">Contacto:</label>
					<input type="text" name="datos_de_contacto" class="entradaDatos" value="<?php echo $this->datos['datos_de_contacto']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_calle" style=""  >
					<label style="">Calle:</label>
					<input type="text" name="calle" class="entradaDatos" value="<?php echo $this->datos['calle']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_numero_interior" style=""  >
					<label style="">No Int:</label>
					<input type="text" name="numero_interior" class="entradaDatos" value="<?php echo $this->datos['numero_interior']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_numero_exterior" style=""  >
					<label style="">No Ext:</label>
					<input type="text" name="numero_exterior" class="entradaDatos" value="<?php echo $this->datos['numero_exterior']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_colonia" style=""  >
					<label style="">Colonia:</label>
					<input type="text" name="colonia" class="entradaDatos" value="<?php echo $this->datos['colonia']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_localidad" style=""  >
					<label style="">Localidad:</label>
					<input type="text" name="localidad" class="entradaDatos" value="<?php echo $this->datos['localidad']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_referencia" style=""  >
					<label style="">Referencia:</label>
					<input type="text" name="referencia" class="entradaDatos" value="<?php echo $this->datos['referencia']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_pais" style=""  >
					<label style="">Pais:</label>
					<select name="fk_pais" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_pais_listado as $pais){
								echo '<option value="'.$pais['id'].' " >'.$pais['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_estado" style=""  >
					<label style="">Estado:</label>
					<select name="fk_estado" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_estado_listado as $estado){
								echo '<option value="'.$estado['id'].' " >'.$estado['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_municipio" style=""  >
					<label style="">Municipio:</label>
					<select name="fk_municipio" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_municipio_listado as $municipio){
								echo '<option value="'.$municipio['id'].' " >'.$municipio['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="tabla contenedor_tabla_pdvs" style=""  >
					
					<h1 style="">Puntos de Venta</h1>
					<div class="toolbar_detalles" style="margin-right: 44px;">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_pdvs">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-punto_de_venta" title="&iquest;Eliminar Punto_de_venta?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Punto_de_venta?</p>
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