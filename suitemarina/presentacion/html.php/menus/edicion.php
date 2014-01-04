<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['id'] ) ){
			
			$fk_parent_listado=array();
			$fk_parent_listado[]=array('id'=>$this->datos['fk_parent'],'texto'=>$this->datos['texto_fk_parent'] );
			$this->fk_parent_listado = $fk_parent_listado;
		}else{
			$mod=new menuModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_parent_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_app_listado=array();
			$fk_app_listado[]=array('id'=>$this->datos['fk_app'],'nombre'=>$this->datos['nombre_fk_app'] );
			$this->fk_app_listado = $fk_app_listado;
		}else{
			$mod=new appModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_app_listado = $objs['datos'];
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
		 var editor=new EdicionMenus();
		 editor.init(config);	
		//-----
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Menu</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input title="Id" type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_texto" style=""  >
					<label style="">Texto:</label>
					<input title="Texto" type="text" name="texto" class="entradaDatos" value="<?php echo $this->datos['texto']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_target" style=""  >
					<label style="">Target:</label>
					<input title="Target" type="text" name="target" class="entradaDatos" value="<?php echo $this->datos['target']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_icon" style=""  >
					<label style="">Icon:</label>
					<input title="Icon" type="text" name="icon" class="entradaDatos" value="<?php echo $this->datos['icon']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_tipo" style=""  >
					<label style="">Tipo:</label>
					<input title="Tipo" type="text" name="tipo" class="entradaDatos" value="<?php echo $this->datos['tipo']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_parent" style=""  >
					<label style="">Menu Padre:</label>
					<select name="fk_parent" class="entradaDatos" style="width:350px;">
						<?php
							foreach($this->fk_parent_listado as $menu){
								echo '<option value="'.$menu['id'].' " >'.$menu['texto'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_app" style=""  >
					<label style="">App:</label>
					<select name="fk_app" class="entradaDatos" style="width:350px;">
						<?php
							foreach($this->fk_app_listado as $app){
								echo '<option value="'.$app['id'].' " >'.$app['nombre'].'</option>';
							}
						?>
					</select>
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