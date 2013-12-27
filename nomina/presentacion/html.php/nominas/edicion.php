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
			$mod=new trabajadorModelo();
			$objs=$mod->buscar( array() );		
			$this->fk_empleado_listado = $objs['datos'];
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
			$mod=new regimen_contratacionModelo();
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
				
	});
</script>
<style>

</style>
<div class="contenedor_formulario" id="<?php echo $id; ?>">
	<div id="titulo">
    	<h1>Nueva Nomina</h1>
	</div>
	<div id="cuerpo">
		<div id="contenedorDatos2">
			<form class="frmEdicion" style="">
				
				<div class="inputBox contenedor_id oculto" style=""  >
					<label style="">Id:</label>
					<input title="Id" type="text" name="id" class="entradaDatos" value="<?php echo $this->datos['id']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_patron" style=""  >
					<label style="">Patron:</label>
					<select name="fk_patron" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_patron_listado as $empresa){
								echo '<option value="'.$empresa['id'].' " >'.$empresa['razon_social'].'</option>';
							}
						?>
					</select>
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
				</div>
				<div class="inputBox contenedor_fk_serie" style=""  >
					<label style="">Serie:</label>
					<select name="fk_serie" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_serie_listado as $serie_nomina){
								echo '<option value="'.$serie_nomina['id'].' " >'.$serie_nomina['serie'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_serie oculto" style=""  >
					<label style="">Serie:</label>
					<input title="Serie" type="text" name="serie" class="entradaDatos" value="<?php echo $this->datos['serie']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_folio" style=""  >
					<label style="">Folio:</label>
					<input title="Folio" type="text" name="folio" class="entradaDatos" value="<?php echo $this->datos['folio']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_Version" style=""  >
					<label style="">Version:</label>
					<input title="Version" type="text" name="Version" class="entradaDatos" value="<?php echo $this->datos['Version']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_RegistroPatronal" style=""  >
					<label style="">RegistroPatronal:</label>
					<input title="RegistroPatronal" type="text" name="RegistroPatronal" class="entradaDatos" value="<?php echo $this->datos['RegistroPatronal']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_NumEmpleado" style=""  >
					<label style="">NumEmpleado:</label>
					<input title="NumEmpleado" type="text" name="NumEmpleado" class="entradaDatos" value="<?php echo $this->datos['NumEmpleado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_CURP" style=""  >
					<label style="">CURP:</label>
					<input title="CURP" type="text" name="CURP" class="entradaDatos" value="<?php echo $this->datos['CURP']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_TipoRegimen" style=""  >
					<label style="">Tipo Regimen:</label>
					<select name="fk_TipoRegimen" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_TipoRegimen_listado as $regimen_contratacion){
								echo '<option value="'.$regimen_contratacion['id'].' " >'.$regimen_contratacion['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_TipoRegimen oculto" style=""  >
					<label style="">TipoRegimen:</label>
					<input title="TipoRegimen" type="text" name="TipoRegimen" class="entradaDatos" value="<?php echo $this->datos['TipoRegimen']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_NumSeguridadSocial" style=""  >
					<label style="">NumSeguridadSocial:</label>
					<input title="NumSeguridadSocial" type="text" name="NumSeguridadSocial" class="entradaDatos" value="<?php echo $this->datos['NumSeguridadSocial']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_FechaPago" style=""  >
					<label style="">FechaPago:</label>
					<input title="FechaPago" type="text" name="FechaPago" class="entradaDatos" value="<?php echo $this->datos['FechaPago']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_FechaInicialPago" style=""  >
					<label style="">FechaInicialPago:</label>
					<input title="FechaInicialPago" type="text" name="FechaInicialPago" class="entradaDatos" value="<?php echo $this->datos['FechaInicialPago']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_FechaFinalPago" style=""  >
					<label style="">FechaFinalPago:</label>
					<input title="FechaFinalPago" type="text" name="FechaFinalPago" class="entradaDatos" value="<?php echo $this->datos['FechaFinalPago']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_NumDiasPagados" style=""  >
					<label style="">NumDiasPagados:</label>
					<input title="NumDiasPagados" type="text" name="NumDiasPagados" class="entradaDatos" value="<?php echo $this->datos['NumDiasPagados']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_Departamento" style=""  >
					<label style="">Departamento:</label>
					<select name="fk_Departamento" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_Departamento_listado as $departamento){
								echo '<option value="'.$departamento['id'].' " >'.$departamento['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_Departamento oculto" style=""  >
					<label style="">Departamento:</label>
					<input title="Departamento" type="text" name="Departamento" class="entradaDatos" value="<?php echo $this->datos['Departamento']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_CLABE" style=""  >
					<label style="">CLABE:</label>
					<input title="CLABE" type="text" name="CLABE" class="entradaDatos" value="<?php echo $this->datos['CLABE']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_Banco oculto" style=""  >
					<label style="">Banco:</label>
					<input title="Banco" type="text" name="Banco" class="entradaDatos" value="<?php echo $this->datos['Banco']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_FechaInicioRelLaboral" style=""  >
					<label style="">FechaInicioRelLaboral:</label>
					<input title="FechaInicioRelLaboral" type="text" name="FechaInicioRelLaboral" class="entradaDatos" value="<?php echo $this->datos['FechaInicioRelLaboral']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_Antiguedad" style=""  >
					<label style="">Antiguedad:</label>
					<input title="Antiguedad" type="text" name="Antiguedad" class="entradaDatos" value="<?php echo $this->datos['Antiguedad']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_Puesto" style=""  >
					<label style="">Puesto:</label>
					<input title="Puesto" type="text" name="Puesto" class="entradaDatos" value="<?php echo $this->datos['Puesto']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_TipoContrato" style=""  >
					<label style="">TipoContrato:</label>
					<select name="TipoContrato" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->TipoContrato_listado as $regimen_contratacion){
								echo '<option value="'.$regimen_contratacion['id'].' " >'.$regimen_contratacion['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_TipoJornada" style=""  >
					<label style="">Tipo Jornada:</label>
					<select name="TipoJornada" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->TipoJornada_listado as $jornada){
								echo '<option value="'.$jornada['id'].' " >'.$jornada['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_PeriodicidadPago" style=""  >
					<label style="">Periodicidad Pago:</label>
					<select name="PeriodicidadPago" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->PeriodicidadPago_listado as $periodo_pago){
								echo '<option value="'.$periodo_pago['id'].' " >'.$periodo_pago['descripcion'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_SalarioBaseCotApor" style=""  >
					<label style="">SalarioBaseCotApor:</label>
					<input title="SalarioBaseCotApor" type="text" name="SalarioBaseCotApor" class="entradaDatos" value="<?php echo $this->datos['SalarioBaseCotApor']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_RiesgoPuesto oculto" style=""  >
					<label style="">RiesgoPuesto:</label>
					<input title="RiesgoPuesto" type="text" name="RiesgoPuesto" class="entradaDatos" value="<?php echo $this->datos['RiesgoPuesto']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_SalarioDiarioIntegrado" style=""  >
					<label style="">SalarioDiarioIntegrado:</label>
					<input title="SalarioDiarioIntegrado" type="text" name="SalarioDiarioIntegrado" class="entradaDatos" value="<?php echo $this->datos['SalarioDiarioIntegrado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_banco" style=""  >
					<label style="">Banco:</label>
					<select name="fk_banco" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_banco_listado as $banco){
								echo '<option value="'.$banco['id'].' " >'.$banco['nombre_corto'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_RiesgoPuesto" style=""  >
					<label style="">Riesgo Puesto:</label>
					<select name="fk_RiesgoPuesto" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_RiesgoPuesto_listado as $riesgo){
								echo '<option value="'.$riesgo['id'].' " >'.$riesgo['descripcion'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_percepcionesTotalGravado" style=""  >
					<label style="">P. Tot. Gravado:</label>
					<input title="Percepciones Total Gravado" type="text" name="percepcionesTotalGravado" class="entradaDatos" value="<?php echo $this->datos['percepcionesTotalGravado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_percepcionesTotalExcento" style=""  >
					<label style="">P. Tot. Excento:</label>
					<input title="Percepciones Total Excento" type="text" name="percepcionesTotalExcento" class="entradaDatos" value="<?php echo $this->datos['percepcionesTotalExcento']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_deduccionesTotalGravado" style=""  >
					<label style="">D Tot. Gravado:</label>
					<input title="Deducciones Total Gravado" type="text" name="deduccionesTotalGravado" class="entradaDatos" value="<?php echo $this->datos['deduccionesTotalGravado']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_deduccionesTotalExcento" style=""  >
					<label style="">D. Tot. Excento:</label>
					<input title="Deducciones" type="text" name="deduccionesTotalExcento" class="entradaDatos" value="<?php echo $this->datos['deduccionesTotalExcento']; ?>" style="width:500px;" />
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
				<div class="inputBox contenedor_fk_forma_pago" style=""  >
					<label style="">Forma de Pago:</label>
					<select name="fk_forma_pago" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_forma_pago_listado as $forma_de_pago){
								echo '<option value="'.$forma_de_pago['id'].' " >'.$forma_de_pago['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_fk_certificado" style=""  >
					<label style="">Certificado:</label>
					<select name="fk_certificado" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_certificado_listado as $certificado){
								echo '<option value="'.$certificado['id'].' " >'.$certificado['no_serie'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_condiciones_de_pago" style=""  >
					<label style="">Condiciones De Pago:</label>
					<input title="Condiciones De Pago" type="text" name="condiciones_de_pago" class="entradaDatos" value="<?php echo $this->datos['condiciones_de_pago']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_subTotal" style=""  >
					<label style="">Subtotal:</label>
					<input title="Subtotal" type="text" name="subTotal" class="entradaDatos" value="<?php echo $this->datos['subTotal']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_descuento" style=""  >
					<label style="">Descuento:</label>
					<input title="Descuento" type="text" name="descuento" class="entradaDatos" value="<?php echo $this->datos['descuento']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_motivo_descuento" style=""  >
					<label style="">Motivo de descuento:</label>
					<input title="Motivo de descuento" type="text" name="motivo_descuento" class="entradaDatos" value="<?php echo $this->datos['motivo_descuento']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_tipo_cambio" style=""  >
					<label style="">Tipo de Cambio:</label>
					<input title="Tipo de Cambio" type="text" name="tipo_cambio" class="entradaDatos" value="<?php echo $this->datos['tipo_cambio']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_moneda" style=""  >
					<label style="">Moneda:</label>
					<select name="fk_moneda" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_moneda_listado as $moneda){
								echo '<option value="'.$moneda['id'].' " >'.$moneda['moneda'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_total" style=""  >
					<label style="">Total:</label>
					<input title="Total" type="text" name="total" class="entradaDatos" value="<?php echo $this->datos['total']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_tipo_comprobante" style="display:none;"  >
					<label style="">Tipo De Comprobante:</label>
					<input title="Tipo De Comprobante" type="text" name="tipo_comprobante" class="entradaDatos" value="<?php echo $this->datos['tipo_comprobante']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_fk_metodo_pago" style=""  >
					<label style="">Método de Pago:</label>
					<select name="fk_metodo_pago" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->fk_metodo_pago_listado as $metodo_de_pago){
								echo '<option value="'.$metodo_de_pago['id'].' " >'.$metodo_de_pago['nombre'].'</option>';
							}
						?>
					</select>
				</div>
				<div class="inputBox contenedor_num_cta_pago" style=""  >
					<label style="">Num Cta Pago:</label>
					<input title="Ultimos 4 digitos de la cuenta" type="text" name="num_cta_pago" class="entradaDatos" value="<?php echo $this->datos['num_cta_pago']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_totImpRet" style=""  >
					<label style="">Tot Imp Ret:</label>
					<input title="Total de Impuestos Retenidos" type="text" name="totImpRet" class="entradaDatos" value="<?php echo $this->datos['totImpRet']; ?>" style="width:500px;" />
				</div>
				<div class="inputBox contenedor_totImpTras" style=""  >
					<label style="">Tot Imp Tras:</label>
					<input title="Total de Impuestos Trasladados" type="text" name="totImpTras" class="entradaDatos" value="<?php echo $this->datos['totImpTras']; ?>" style="width:500px;" />
				</div>
				<div class="tabla contenedor_tabla_conceptos" style="position: relative; margin-top: 26px;"  >
					
					<h1 class="tituloTabla" >Conceptos</h1>
					<div class="toolbar_detalles" style="">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_conceptos">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-concepto_de_nomina" title="&iquest;Eliminar Concepto_de_nomina?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Concepto_de_nomina?</p>
					</div> 
				</div>
				<div class="tabla contenedor_tabla_impuestos" style="position: relative; margin-top: 26px;"  >
					
					<h1 class="tituloTabla" >Impuestos</h1>
					<div class="toolbar_detalles" style="">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<table class="tabla_impuestos">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-impuesto_de_nomina" title="&iquest;Eliminar Impuesto_de_nomina?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar Impuesto_de_nomina?</p>
					</div> 
				</div>
				<div class="inputBox contenedor_fecha_emision" style=""  >
					<label style="">Fecha Emision:</label>
					<input title="Fecha Emision" type="text" name="fecha_emision" class="entradaDatos" value="<?php echo $this->datos['fecha_emision']; ?>" style="width:500px;" />
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