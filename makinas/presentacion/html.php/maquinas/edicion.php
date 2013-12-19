<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['fk_owner'] ) ){
			
			$fk_owner_listado=array();
			$fk_owner_listado[]=array('id'=>$this->datos['fk_owner'],'nombre'=>$this->datos['nombre_fk_owner'] );
			$this->fk_owner_listado = $fk_owner_listado;
		}else{
			$mod=new ownerModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_owner_listado = $objs['datos'];
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
		 var editor=new EdicionMaquinas();
		 editor.init(config);	
		//-----
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nueva Maquina</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				<div class="inputBox contenedor_fk_owner" style=""  >
					<label style="">Dueño:</label>
					<select name="fk_owner" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_owner_listado as $owner){
								echo '<option value="'.$owner['id'].' " >'.$owner['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_nombre" style=""  >
					<label style="">Nombre:</label>
					<input type="text" name="nombre" class="entradaDatos" value="<?php echo $this->datos['nombre']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_ganancias" style=""  >
					<label style="">Ganancias:</label>
					<input type="text" name="ganancias" class="entradaDatos" value="<?php echo $this->datos['ganancias']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_gastos" style=""  >
					<label style="">Gastos:</label>
					<input type="text" name="gastos" class="entradaDatos" value="<?php echo $this->datos['gastos']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_saldo" style=""  >
					<label style="">Saldo:</label>
					<input type="text" name="saldo" class="entradaDatos" value="<?php echo $this->datos['saldo']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_descripcion" style=""  >
					<label style="">Descripcion:</label>
					<input type="text" name="descripcion" class="entradaDatos" value="<?php echo $this->datos['descripcion']; ?>" style="width:500px;" />
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