<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['id'] ) ){
			
			$fk_maquina_listado=array();
			$fk_maquina_listado[]=array('id'=>$this->datos['fk_maquina'],'nombre'=>$this->datos['nombre_fk_maquina'] );
			$this->fk_maquina_listado = $fk_maquina_listado;
		}else{
			$mod=new maquinaModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_maquina_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_cliente_listado=array();
			$fk_cliente_listado[]=array('id'=>$this->datos['fk_cliente'],'nombre'=>$this->datos['nombre_fk_cliente'] );
			$this->fk_cliente_listado = $fk_cliente_listado;
		}else{
			$mod=new clienteModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_cliente_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_pdv_listado=array();
			$fk_pdv_listado[]=array('id'=>$this->datos['fk_pdv'],'nombre'=>$this->datos['nombre_fk_pdv'] );
			$this->fk_pdv_listado = $fk_pdv_listado;
		}else{
			$mod=new punto_de_ventaModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_pdv_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_tecnico_listado=array();
			$fk_tecnico_listado[]=array('id'=>$this->datos['fk_tecnico'],'nombre'=>$this->datos['nombre_fk_tecnico'] );
			$this->fk_tecnico_listado = $fk_tecnico_listado;
		}else{
			$mod=new tecnicoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_tecnico_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_serie_listado=array();
			$fk_serie_listado[]=array('id'=>$this->datos['fk_serie'],'serie'=>$this->datos['serie_fk_serie'] );
			$this->fk_serie_listado = $fk_serie_listado;
			
			
		}else{
			$mod=new serieModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_serie_listado = $objs['datos'];
			
			$fk_serie=$objs['datos'][0]['id'];
			$serMod = new serieModelo();
			$serie=$serMod->obtener( $fk_serie );
			
			$this->datos['folio']=$serie['folio_sig'];
			
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
		 var editor=new EdicionCortes();
		 editor.init(config);	
		//-----
		$('[name="fecha"]').wijinputdate({showTrigger:true, dateFormat:'dd/MM/yyyy'});
		$('[name="hora"]').wijinputdate({showTrigger:false,  dateFormat:'HH:mm'});
		var options={};
		$('[name="cont_entrada"]').wijinputnumber(options);
		$('[name="cont_salida"]').wijinputnumber(options);
		$('[name="saldo_contadores"]').wijinputnumber({readonly: true});
		
		$('[name="monto"]').wijinputnumber(options);
		
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nuevo Corte</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				<div class="inputBox contenedor_fecha" style=""  >
					<label style="">Fecha:</label>
					<input type="text" name="fecha" class="entradaDatos" value="<?php echo $this->datos['fecha']; ?>" style="width:120px;" />
					<label style="width:60px; margin-left:10px;">Hora:</label>
					<input type="text" name="hora" class="entradaDatos" value="<?php echo $this->datos['fecha']; ?>" style="width:60px;" />
				</div>
				<div class="inputBox contenedor_fk_serie" style=""  >
					<label style="">Serie:</label>
					<select name="fk_serie" class="entradaDatos" style="width:110px;">
						<?php
							foreach($this->fk_serie_listado as $serie){
								echo '<option value="'.$serie['id'].' " >'.$serie['serie'].'</option>';
							}
						?>
					</select>
					<label style="margin-left:10px; width:60px;">Folio:</label>
					<input readonly type="text" name="folio" class="entradaDatos" value="<?php echo $this->datos['folio']; ?>" style="width:60px;" />
				</div>
				
				
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_maquina" style=""  >
					<label style="">Maquina:</label>
					<select name="fk_maquina" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_maquina_listado as $maquina){
								echo '<option value="'.$maquina['id'].' " >'.$maquina['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_cliente" style=""  >
					<label style="">Cliente:</label>
					<select name="fk_cliente" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_cliente_listado as $cliente){
								echo '<option value="'.$cliente['id'].' " >'.$cliente['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_pdv" style=""  >
					<label style="">PDV:</label>
					<select name="fk_pdv" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_pdv_listado as $punto_de_venta){
								echo '<option value="'.$punto_de_venta['id'].' " >'.$punto_de_venta['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_tecnico" style=""  >
					<label style="">Tecnico:</label>
					<select name="fk_tecnico" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_tecnico_listado as $tecnico){
								echo '<option value="'.$tecnico['id'].' " >'.$tecnico['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_cont_entrada" style=""  >
					<label style="">Cont Entrada:</label>
					<input type="text" name="cont_entrada" class="entradaDatos" value="<?php echo $this->datos['cont_entrada']; ?>" style="width:200px;" />
				</div>
				<div class="inputBox contenedor_cont_salida" style=""  >
					<label style="">Cont Salida:</label>
					<input type="text" name="cont_salida" class="entradaDatos" value="<?php echo $this->datos['cont_salida']; ?>" style="width:200px;" />
				</div>
				<div class="inputBox contenedor_saldo_contadores" style=""  >
					<label style="">Diferencia:</label>
					<input readonly type="text" name="saldo_contadores" class="entradaDatos" value="<?php echo $this->datos['saldo_contadores']; ?>" style="width:200px;" />
				</div>
				<div class="inputBox contenedor_dato_de_la_placa" style=""  >
					<label style="vertical-align:top;">Dato De La Placa:</label>
					<textarea  maxLength="255" class="entradaDatos" style="width:500px; height:61px; margin-bottom:16px; " name="dato_de_la_placa"><?php echo $this->datos['dato_de_la_placa']; ?></textarea>
					
				</div>
				<div class="inputBox contenedor_monto" style=""  >
					<label style="">Monto:</label>
					<input type="text" name="monto" class="entradaDatos" value="<?php echo $this->datos['monto']; ?>" style="width:200px;" />
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