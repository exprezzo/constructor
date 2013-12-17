<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['fk_rol'] ) ){
			$rol_listado=array();
			$rol_listado[]=array('id'=>$this->datos['fk_rol'],'nombre'=>$this->datos['nombre_rol'] );
			$this->rol_listado = $rol_listado;
		}else{
			$mod=new rolModelo();
			$objs=$mod->buscar( array() );		
			$this->rol_listado = $objs['datos'];
		}
if ( !empty( $this->datos['fk_empresa'] ) ){
			$empresa_listado=array();
			$empresa_listado[]=array('id'=>$this->datos['fk_empresa'],'nombre'=>$this->datos['nombre_empresa'] );
			$this->empresa_listado = $empresa_listado;
		}else{
			$mod=new empresaModelo();
			$objs=$mod->buscar( array() );		
			$this->empresa_listado = $objs['datos'];
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
		 var editor=new EdicionUsuarios();
		 editor.init(config);	
		//-----
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Usuario</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_nick" style=""  >
					<label style="">Nick:</label>
					<input type="text" name="nick" class="entradaDatos" value="<?php echo $this->datos['nick']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_nombre" style=""  >
					<label style="">Nombre:</label>
					<input type="text" name="nombre" class="entradaDatos" value="<?php echo $this->datos['nombre']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_email" style=""  >
					<label style="">Email:</label>
					<input type="text" name="email" class="entradaDatos" value="<?php echo $this->datos['email']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_pass" style=""  >
					<label style="">Pass:</label>
					<input type="text" name="pass" class="entradaDatos" value="<?php echo $this->datos['pass']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_ip_login" style=""  >
					<label style="">Ip_login:</label>
					<input type="text" name="ip_login" class="entradaDatos" value="<?php echo $this->datos['ip_login']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_last_login" style=""  >
					<label style="">Last_login:</label>
					<input type="text" name="last_login" class="entradaDatos" value="<?php echo $this->datos['last_login']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_rol" style=""  >
					<label style="">Fk_rol:</label>
					<select name="fk_rol" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->rol_listado as $rol){
								echo '<option value="'.$rol['id'].' " >'.$rol['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_empresa" style=""  >
					<label style="">Empresa:</label>
					<select name="fk_empresa" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->empresa_listado as $empresa){
								echo '<option value="'.$empresa['id'].' " >'.$empresa['nombre'].'</option>';
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