<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['fk_tipo_de_documento'] ) ){
			
			$fk_tipo_de_documento_listado=array();
			$fk_tipo_de_documento_listado[]=array('id'=>$this->datos['fk_tipo_de_documento'],'nombre'=>$this->datos['nombre_fk_tipo_de_documento'] );
			$this->fk_tipo_de_documento_listado = $fk_tipo_de_documento_listado;
		}else{
			$mod=new tipo_de_documentoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_tipo_de_documento_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_serie'] ) ){
			
			$fk_serie_listado=array();
			$fk_serie_listado[]=array('id'=>$this->datos['fk_serie'],'nombre'=>$this->datos['nombre_fk_serie'] );
			$this->fk_serie_listado = $fk_serie_listado;
		}else{
			$mod=new serieModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_serie_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_transportador'] ) ){
			
			$fk_transportador_listado=array();
			$fk_transportador_listado[]=array('id'=>$this->datos['fk_transportador'],'nombre'=>$this->datos['nombre_fk_transportador'] );
			$this->fk_transportador_listado = $fk_transportador_listado;
		}else{
			$mod=new socioModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_transportador_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_remitente'] ) ){
			
			$fk_remitente_listado=array();
			$fk_remitente_listado[]=array('id'=>$this->datos['fk_remitente'],'nombre'=>$this->datos['nombre_fk_remitente'] );
			$this->fk_remitente_listado = $fk_remitente_listado;
		}else{
			$mod=new socioModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_remitente_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_destinatario'] ) ){
			
			$fk_destinatario_listado=array();
			$fk_destinatario_listado[]=array('id'=>$this->datos['fk_destinatario'],'nombre'=>$this->datos['nombre_fk_destinatario'] );
			$this->fk_destinatario_listado = $fk_destinatario_listado;
		}else{
			$mod=new socioModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_destinatario_listado = $objs['datos'];
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
		 var editor=new EdicionDocumentos();
		 editor.init(config);	
		//-----
		$('[name="fecha_creacion"]').wijinputdate();
		$('[name="fecha_entregar"]').wijinputdate();
		$('[name="fecha_vencimiento"]').wijinputdate();
		$('[name="fecha_cargar"]').wijinputdate();
		$('[name="fecha_cargado"]').wijinputdate();
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Documento</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_fecha_creacion" style=""  >
					<label style="">Creado:</label>
					<input type="text" name="fecha_creacion" class="entradaDatos" value="<?php echo $this->datos['fecha_creacion']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_tipo_de_documento" style=""  >
					<label style="">Tipo de Doc.:</label>
					<select name="fk_tipo_de_documento" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_tipo_de_documento_listado as $tipo_de_documento){
								echo '<option value="'.$tipo_de_documento['id'].' " >'.$tipo_de_documento['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_serie" style=""  >
					<label style="">Serie:</label>
					<select name="fk_serie" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_serie_listado as $serie){
								echo '<option value="'.$serie['id'].' " >'.$serie['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_folio" style=""  >
					<label style="">Folio:</label>
					<input type="text" name="folio" class="entradaDatos" value="<?php echo $this->datos['folio']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_transportador" style=""  >
					<label style="">Transportador:</label>
					<select name="fk_transportador" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_transportador_listado as $socio){
								echo '<option value="'.$socio['id'].' " >'.$socio['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_remitente" style=""  >
					<label style="">Remitente:</label>
					<select name="fk_remitente" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_remitente_listado as $socio){
								echo '<option value="'.$socio['id'].' " >'.$socio['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_destinatario" style=""  >
					<label style="">Destinatario:</label>
					<select name="fk_destinatario" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_destinatario_listado as $socio){
								echo '<option value="'.$socio['id'].' " >'.$socio['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fecha_entregar" style=""  >
					<label style="">Fecha_entregar:</label>
					<input type="text" name="fecha_entregar" class="entradaDatos" value="<?php echo $this->datos['fecha_entregar']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_origen" style=""  >
					<label style="">Origen:</label>
					<input type="text" name="origen" class="entradaDatos" value="<?php echo $this->datos['origen']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_destino" style=""  >
					<label style="">Destino:</label>
					<input type="text" name="destino" class="entradaDatos" value="<?php echo $this->datos['destino']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fecha_vencimiento" style=""  >
					<label style="">Fecha_vencimiento:</label>
					<input type="text" name="fecha_vencimiento" class="entradaDatos" value="<?php echo $this->datos['fecha_vencimiento']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fecha_cargar" style=""  >
					<label style="">Fecha_cargar:</label>
					<input type="text" name="fecha_cargar" class="entradaDatos" value="<?php echo $this->datos['fecha_cargar']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fecha_cargado" style=""  >
					<label style="">Fecha_cargado:</label>
					<input type="text" name="fecha_cargado" class="entradaDatos" value="<?php echo $this->datos['fecha_cargado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_medio_de_transporte" style=""  >
					<label style="">Medio_de_transporte:</label>
					<input type="text" name="medio_de_transporte" class="entradaDatos" value="<?php echo $this->datos['medio_de_transporte']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_datos_del_vehiculo" style=""  >
					<label style="">Datos_del_vehiculo:</label>
					<input type="text" name="datos_del_vehiculo" class="entradaDatos" value="<?php echo $this->datos['datos_del_vehiculo']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_datos_del_chofer" style=""  >
					<label style="">Datos_del_chofer:</label>
					<input type="text" name="datos_del_chofer" class="entradaDatos" value="<?php echo $this->datos['datos_del_chofer']; ?>" style="width:500px;" />
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