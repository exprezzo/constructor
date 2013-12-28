<?php
	$id=$_PETICION->controlador.'-'.$_PETICION->accion;
	$_REQUEST['tabId'] =$id;
	
	
if ( !empty( $this->datos['id'] ) ){
			
			$fk_patron_listado=array();
			$fk_patron_listado[]=array('id'=>$this->datos['fk_patron'],'razon_social'=>$this->datos['razon_social_fk_patron'] );
			$this->fk_patron_listado = $fk_patron_listado;
		}else{
			$mod=new empresaModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_patron_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_empleado_listado=array();
			$fk_empleado_listado[]=array('id'=>$this->datos['fk_empleado'],'nombre'=>$this->datos['nombre_fk_empleado'] );
			$this->fk_empleado_listado = $fk_empleado_listado;
		}else{
			// $mod=new trabajadorModelo();
			// $objs=$mod->buscar( array() );		
			// $this->fk_empleado_listado = $objs['datos'];
			$this->fk_empleado_listado = array();
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_serie_listado=array();
			$fk_serie_listado[]=array('id'=>$this->datos['fk_serie'],'serie'=>$this->datos['serie_fk_serie'] );
			$this->fk_serie_listado = $fk_serie_listado;
		}else{
			$mod=new serie_nominaModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_serie_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_TipoRegimen_listado=array();
			$fk_TipoRegimen_listado[]=array('id'=>$this->datos['fk_TipoRegimen'],'nombre'=>$this->datos['nombre_fk_TipoRegimen'] );
			$this->fk_TipoRegimen_listado = $fk_TipoRegimen_listado;
		}else{
			$mod=new regimen_contratacionModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_TipoRegimen_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_Departamento_listado=array();
			$fk_Departamento_listado[]=array('id'=>$this->datos['fk_Departamento'],'nombre'=>$this->datos['nombre_fk_Departamento'] );
			$this->fk_Departamento_listado = $fk_Departamento_listado;
		}else{
			$mod=new departamentoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_Departamento_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$TipoContrato_listado=array();
			$TipoContrato_listado[]=array('id'=>$this->datos['TipoContrato'],'nombre'=>$this->datos['nombre_TipoContrato'] );
			$this->TipoContrato_listado = $TipoContrato_listado;
		}else{
			$mod=new tipo_de_contratoModelo();
			$objs=$mod->buscar( array() );		
			$this->TipoContrato_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$TipoJornada_listado=array();
			$TipoJornada_listado[]=array('id'=>$this->datos['TipoJornada'],'nombre'=>$this->datos['nombre_TipoJornada'] );
			$this->TipoJornada_listado = $TipoJornada_listado;
		}else{
			$mod=new jornadaModelo();
			$objs=$mod->buscar( array() );		
			$this->TipoJornada_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$PeriodicidadPago_listado=array();
			$PeriodicidadPago_listado[]=array('id'=>$this->datos['PeriodicidadPago'],'descripcion'=>$this->datos['descripcion_PeriodicidadPago'] );
			$this->PeriodicidadPago_listado = $PeriodicidadPago_listado;
		}else{
			$mod=new periodo_pagoModelo();
			$objs=$mod->buscar( array() );		
			$this->PeriodicidadPago_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_banco_listado=array();
			$fk_banco_listado[]=array('id'=>$this->datos['fk_banco'],'nombre_corto'=>$this->datos['nombre_corto_fk_banco'] );
			$this->fk_banco_listado = $fk_banco_listado;
		}else{
			$mod=new bancoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_banco_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_RiesgoPuesto_listado=array();
			$fk_RiesgoPuesto_listado[]=array('id'=>$this->datos['fk_RiesgoPuesto'],'descripcion'=>$this->datos['descripcion_fk_RiesgoPuesto'] );
			$this->fk_RiesgoPuesto_listado = $fk_RiesgoPuesto_listado;
		}else{
			$mod=new riesgoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_RiesgoPuesto_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_forma_pago_listado=array();
			$fk_forma_pago_listado[]=array('id'=>$this->datos['fk_forma_pago'],'nombre'=>$this->datos['nombre_fk_forma_pago'] );
			$this->fk_forma_pago_listado = $fk_forma_pago_listado;
		}else{
			$mod=new forma_de_pagoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_forma_pago_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_certificado_listado=array();
			$fk_certificado_listado[]=array('id'=>$this->datos['fk_certificado'],'no_serie'=>$this->datos['no_serie_fk_certificado'] );
			$this->fk_certificado_listado = $fk_certificado_listado;
		}else{
			$mod=new certificadoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_certificado_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_moneda_listado=array();
			$fk_moneda_listado[]=array('id'=>$this->datos['fk_moneda'],'moneda'=>$this->datos['moneda_fk_moneda'] );
			$this->fk_moneda_listado = $fk_moneda_listado;
		}else{
			$mod=new monedaModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_moneda_listado = $objs['datos'];
		}
if ( !empty( $this->datos['id'] ) ){
			
			$fk_metodo_pago_listado=array();
			$fk_metodo_pago_listado[]=array('id'=>$this->datos['fk_metodo_pago'],'nombre'=>$this->datos['nombre_fk_metodo_pago'] );
			$this->fk_metodo_pago_listado = $fk_metodo_pago_listado;
		}else{
			$mod=new metodo_de_pagoModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_metodo_pago_listado = $objs['datos'];
		}
?>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/edicion.js"></script>

<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/percepciones_de_nomina.js"></script>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/deducciones_de_nomina.js"></script>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/incapacidades_de_nomina.js"></script>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/horas_extra_de_nomina.js"></script>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/conceptos_de_nomina.js"></script>
<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/impuestos_de_nomina.js"></script>
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
		 var editor=new EdicionNominas();
		 editor.init(config);	
		//-----
		
		var tabId='#'+config.tab.id;
		configDet={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['percepcionesDeNomina']); ?>,
			target:'.tabla_percepciones',
			contenedor:'.contenedor_tabla_percepciones',
		};

		var percepcionesDeNomina = new PercepcionesDeNomina();		
		percepcionesDeNomina.init(configDet);
				
		var tabId='#'+config.tab.id;
		configDet={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['deduccionesDeNomina']); ?>,
			target:'.tabla_deducciones',
			contenedor:'.contenedor_tabla_deducciones',
		};

		var deduccionesDeNomina = new DeduccionesDeNomina();		
		deduccionesDeNomina.init(configDet);
				
		var tabId='#'+config.tab.id;
		configDet={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['incapacidadesDeNomina']); ?>,
			target:'.tabla_incapacidades',
			contenedor:'.contenedor_tabla_incapacidades',
		};

		var incapacidadesDeNomina = new IncapacidadesDeNomina();		
		incapacidadesDeNomina.init(configDet);
				
		var tabId='#'+config.tab.id;
		configDet={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['horas_extraDeNomina']); ?>,
			target:'.tabla_horas_extra',
			contenedor:'.contenedor_tabla_horas_extra',
		};

		var horas_extraDeNomina = new Horas_extraDeNomina();		
		horas_extraDeNomina.init(configDet);
				
		var tabId='#'+config.tab.id;
		configDet={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['conceptosDeNomina']); ?>,
			target:'.tabla_conceptos',
			contenedor:'.contenedor_tabla_conceptos',
		};

		var conceptosDeNomina = new ConceptosDeNomina();		
		conceptosDeNomina.init(configDet);
				
		var tabId='#'+config.tab.id;
		configDet={
			padre:editor,
			tabId:'#<?php echo $_REQUEST['tabId']; ?>',
			elementos: <?php echo json_encode($this->datos['impuestosDeNomina']); ?>,
			target:'.tabla_impuestos',
			contenedor:'.contenedor_tabla_impuestos',
		};

		var impuestosDeNomina = new ImpuestosDeNomina();		
		impuestosDeNomina.init(configDet);
		
		var options={requireOpenedPane: false, active: false, collapsible: true};
		// $(".datos_empleado").wijaccordion(options);
		// $(".datos_empleado").accordion(options);
		$(".datos_facturacion").accordion(options);
		
		
	});
</script>
<style>
.wijmo-wijinput{display:inline-block; }

.contenedor_fecha_emision .inputBox div[role="combobox"] {width: 91px !important;}
div[role="combobox"] input[role="textbox"] {height:24px !important; }
#datos_empleado .inputBox label:nth-child(1), .datos_facturacion .inputBox label:nth-child(1){
	margin-left:0;
}
#tablaFechas thead td{width:164px;}
#tablaFechas thead td{width:164px;}
</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nueva Nomina</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id oculto"   >
					<label style="">Id:</label>
					<input title="Id" type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fecha_emision" style="display:inline-block;"  >
					<div style="display:inline-block;">
						<label style="">Fecha Emision:</label>
						<input title="Fecha Emision" type="text" name="fecha_emision" class="entradaDatos" value="<?php echo $this->datos['fecha_emision']; ?>" style="width:150px;" />
					</div>
					<div class="inputBox contenedor_fk_serie" style="display:inline-block;"  >
						<label style="margin:0 10px 0 20px; width:auto;">Serie Y Folio:</label>
						<select name="fk_serie" class="entradaDatos" style="width:80px;">
							<?php
								foreach($this->fk_serie_listado as $serie_nomina){
									echo '<option value="'.$serie_nomina['id'].' " >'.$serie_nomina['serie'].'</option>';
								}
							?>
						</select>
											
							<input title="Folio" type="text" name="folio" class="entradaDatos" value="<?php echo $this->datos['folio']; ?>" style="width:20px; display:inline-block;" />
						
					</div>
				</div>
				<div class="inputBox contenedor_serie oculto" style=""  >
					<label style="">Serie:</label>
					<input title="Serie" type="text" name="serie" class="entradaDatos" value="<?php echo $this->datos['serie']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_empleado" style=""  >
					<label style="">Empleado:</label>
					<select name="fk_empleado" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_empleado_listado as $trabajador){
								echo '<option value="'.$trabajador['id'].' " >'.$trabajador['nombre'].'</option>';
							}
						?>
					</select>
					<a id="lnkDetallesTrabajador" href="#datos_empleado" style="text-decoration:underline;">ver detalles</a>
				</div>
				<div id="datos_empleado" title="Datos del empleado" style="width:800px; margin:10px 0 20px 100px;">
					<?php 
					// $path=dirname (__FILE__);
					// echo $path; 
					?>
					
						
						<div>
							<?php include dirname(__FILE__).'/_datos_empleado.php'; ?>	
						</div>
					
				</div>
				
				
				
				<div id="tablaFechas" style="text-align:center; margin:33px 0 20px 0;">
					<table style="display:inline-block; text-align:left;">
						<thead>
							<tr>
								<td><div class="inputBox"><label style="margin-left:0;">Fecha Pago</label></div></td>
								<td><div class="inputBox"><label style="margin-left:0;">F. Inicial Pago</label></div></td>
								<td><div class="inputBox"><label style="margin-left:0;">F. Final Pago</label></div></td>
								<td><div class="inputBox"><label style="margin-left:0;">Dias Pagados</label></div></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input title="FechaPago" type="text" name="FechaPago" class="entradaDatos" value="<?php echo $this->datos['FechaPago']; ?>" style="width:150px; display:inline-block;" /></td>
								<td><input title="FechaInicialPago" type="text" name="FechaInicialPago" class="entradaDatos" value="<?php echo $this->datos['FechaInicialPago']; ?>" style="width:150px;" /></td>
								<td><input title="FechaFinalPago" type="text" name="FechaFinalPago" class="entradaDatos" value="<?php echo $this->datos['FechaFinalPago']; ?>" style="width:150px;" /></td>
								<td><input title="Numero de Días pagados" type="text" name="NumDiasPagados" class="entradaDatos" value="<?php echo $this->datos['NumDiasPagados']; ?>" style="width:115px;" /></td>
								
								
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tabla contenedor_tabla_percepciones" style="position: relative; margin-top: 26px;"  >
					
					<h1 class="tituloTabla" >Percepciones</h1>
					<div class="toolbar_detalles" style="">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_percepciones">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-percepcion_nomina" title="&iquest;Eliminar Percepcion_nomina?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Percepcion_nomina?</p>
					</div> 
				</div>
				<div style="display:none;">
					<div class="inputBox contenedor_percepcionesTotalGravado" style=""  >
						<label style="">P. Tot. Gravado:</label>
						<input title="Percepciones Total Gravado" type="text" name="percepcionesTotalGravado" class="entradaDatos" value="<?php echo $this->datos['percepcionesTotalGravado']; ?>" style="width:500px;" />
					</div>
					<div class="inputBox contenedor_percepcionesTotalExcento" style=""  >
						<label style="">P. Tot. Excento:</label>
						<input title="Percepciones Total Excento" type="text" name="percepcionesTotalExcento" class="entradaDatos" value="<?php echo $this->datos['percepcionesTotalExcento']; ?>" style="width:500px;" />
					</div>
				</div>
				
				<div class="tabla contenedor_tabla_deducciones" style="position: relative; margin-top: 26px;"  >
					
					<h1 class="tituloTabla" >Deducciones</h1>
					<div class="toolbar_detalles" style="">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_deducciones">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-deduccion_nomina" title="&iquest;Eliminar Deduccion_nomina?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Deduccion_nomina?</p>
					</div> 
				</div>
				<div style="display:none;">
					<div class="inputBox contenedor_deduccionesTotalGravado" style=""  >
						<label style="">D Tot. Gravado:</label>
						<input title="Deducciones Total Gravado" type="text" name="deduccionesTotalGravado" class="entradaDatos" value="<?php echo $this->datos['deduccionesTotalGravado']; ?>" style="width:500px;" />
					</div>
					<div class="inputBox contenedor_deduccionesTotalExcento" style=""  >
						<label style="">D. Tot. Excento:</label>
						<input title="Deducciones" type="text" name="deduccionesTotalExcento" class="entradaDatos" value="<?php echo $this->datos['deduccionesTotalExcento']; ?>" style="width:500px;" />
					</div>
				</div>
				
				<div class="tabla contenedor_tabla_incapacidades" style="position: relative; margin-top: 26px;"  >
					
					<h1 class="tituloTabla" >Incapacidades</h1>
					<div class="toolbar_detalles" style="">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_incapacidades">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-incapacidad" title="&iquest;Eliminar Incapacidad?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Incapacidad?</p>
					</div> 
				</div>
				<div class="tabla contenedor_tabla_horas_extra" style="position: relative; margin-top: 26px;"  >
					
					<h1 class="tituloTabla" >Horas Extra</h1>
					<div class="toolbar_detalles" style="">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_horas_extra">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-hora_extra_nomina" title="&iquest;Eliminar Hora_extra_nomina?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Hora_extra_nomina?</p>
					</div> 
				</div>
				
				<div class="datos_facturacion" style="width:800px; margin:10px 0 20px 100px;">
					<?php 
					// $path=dirname (__FILE__);
					// echo $path; 
					?>
					
						<h3>Datos de Facturacion</h3>
						<div>
							<?php include dirname(__FILE__).'/_datos_facturacion.php'; ?>	
						</div>
					
				</div>
				
				<div   style="display:none;"> 
					<div class="inputBox contenedor_fk_patron"  >
						<label style="">Patron:</label>
						<select name="fk_patron" class="entradaDatos" style="width:250px;">
							<?php
								foreach($this->fk_patron_listado as $empresa){
									echo '<option value="'.$empresa['id'].' " >'.$empresa['razon_social'].'</option>';
								}
							?>
						</select>
					</div>
					
					<div class="inputBox contenedor_Version" style=""  >
						<label style="">Version:</label>
						<input title="Version" type="text" name="Version" class="entradaDatos" value="<?php echo $this->datos['Version']; ?>" style="width:500px;" />
					</div>
					<div class="inputBox contenedor_RegistroPatronal" style=""  >
						<label style="">RegistroPatronal:</label>
						<input title="RegistroPatronal" type="text" name="RegistroPatronal" class="entradaDatos" value="<?php echo $this->datos['RegistroPatronal']; ?>" style="width:500px;" />
					</div>
				</div>
			</form>
			<div id="contenedorMenu2" class="toolbarEdicion">
				<input type="submit" value="Nuevo" class="botonNuevo btnNuevo">
				<input type="submit" value="Guardar" class="botonNuevo btnGuardar">
				<input type="submit" value="Timbrar" class="botonNuevo btnTimbrar">
				<input type="submit" value="PDF" class="botonNuevo btnPdf">
				<input type="submit" value="XML" class="botonNuevo btnXML">
				<input type="submit" value="ZIP" class="botonNuevo btnZip">
				<input type="submit" value="Cancelar" class="botonNuevo sinMargeDerecho btnCancelar">
			</div>
		</div>
	</div>
</div>