var EdicionNominas = function(){
	this.editado=false;
	this.tituloNuevo='Nueva Nomina';
	this.saveAndClose=false;
	var me=this;
	this.timbrar= function(){
		
		var tabId = this.tabId;		
		var id = $(this.tabId + ' [name="id"]').val();
		var datos = {
			id:id
		};
		
		$("#contenedorDatos2").block({ 
			message: '<h1>Timbrando</h1>'               
		});
		$.ajax({
			type: "POST",
			url: kore.url_base+this.configuracion.modulo.nombre+'/'+this.controlador.nombre+'/timbrar',
			data: { datos: datos}
		}).done(function( response ) {
			$("#contenedorDatos2").unblock(); 
			try{
					var resp = eval('(' + response + ')');
			}catch(err){
				msg='El servidor no ha respondido de manera correcta. <br />'+response;
				title='Error al timbrar la nomina';
				icon= kore.url_web+'imagenes/error.png';
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
			}
			var msg= (resp.msg)? resp.msg : '';
			var title;			
			if ( resp.success == true	){
				// actualizarTimbres();
				
				$(me.tabId+' .cadenaCFDI').html(resp.datos.cadenaCFDI); 
				if (resp.datos.selloCFD != null)
					$(me.tabId+' .selloCFD').html(resp.datos.selloCFD[0]); 
				if (resp.datos.selloSAT != null)
					$(me.tabId+' .selloSAT').html(resp.datos.selloSAT[0]); 
				if (resp.datos.folio_fiscal != null){
					$(me.tabId+' .folioFiscal').html(resp.datos.folio_fiscal[0]);
					$(me.tabId+' [name="folio_fiscal"]').val(resp.datos.folio_fiscal[0]);
				}
					
				if (resp.msgType!=undefined ){
					if (resp.msgType == 'info'){
						icon=kore.url_web+'imagenes/yes.png';					
					}else if (resp.msgType == 'warning'){
						icon=kore.url_web+'imagenes/warning.png';
					}else{
						icon=kore.url_web+'imagenes/info.png';
					}				
				}else{
					icon=kore.url_web+'imagenes/info.png';
				}
				// me.configBotonesPrefactura();
				title= 'Success';
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
				
			}else{
				icon= kore.url_web+'imagenes/error.png';
				title= 'Error';					
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
			}
			
			
		});
	};
	this.generarArchivos=function(esNuevo){
		var id = $(this.tabId + ' [name="id"]').val();
		var me=this;
		// $(this.tabId+' .tabla_conceptos').wijgrid('endEdit');
		var params={esNuevo:esNuevo};
		params['id']=id;
		
		
		$("#contenedorDatos2").block({ 
			message: '<h1>Generando Archivos</h1>'               
		}); 
		$.ajax({
				type: "POST",
				url: kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/generarArchivos',

				data: params
			}).done(function( response ) {		
				$("#contenedorDatos2").unblock();
				var msg, title, icon;
				try{
					var resp = eval('(' + response + ')');
				}catch(err){
					msg='El servidor ha respondido de manera incorrecta. <br />'+response;
					title='Error al generar los archivos';
					icon= kore.url_web+'imagenes/error.png';
					$.gritter.add({
						position: 'bottom-left',
						title:title,
						text: msg,
						image: icon,
						class_name: 'my-sticky-class'
					});
				}
				 msg= (resp.msg)? resp.msg : '';
				 title;
				if ( resp.success == true	){					
					icon=kore.url_web+'imagenes/yes.png';
					title= 'Success';	
					// window.location= kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/nuevo';
					// $(me.tabId + ' [name="status"]').val(resp.nuevoStatus);
					
					$(me.tabId+' input[name="archivosGenerados"]').val(1); 
				}else{
					icon= kore.url_web+'imagenes/error.png';
					title= 'Error';
				}
				
				
				me.editado=false;
			
				// me.configBotonesPrefactura.call(me);
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
				if (esNuevo){					
					window.location = kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar/'+ id;
				}
			});
		
	}
	this.configurarComboFk_patron=function(){
		var me=this;
		
		$('select[name="fk_patron"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_patron input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_patronEnAjax) return true;			
			me.setDSFk_patron();
			me.Fk_patronEnAjax=true;
		 });
	};
		
		
	this.setDSFk_patron = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarEmpresa',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'razon_social' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_patron"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_empleado=function(){
		var me=this;
		
		$('select[name="fk_empleado"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {	
				console.log(data);
				$('[name="NumEmpleado"]').val(data.NoEmpleado);
				$('[name="CURP"]').val(data.CURP);
				
				$('[name="NumSeguridadSocial"]').val(data.NumSeguridadSocial);
				$('[name="FechaInicioRelLaboral"]').val(data.FechaInicioRelLaboral);
				$('[name="SalarioDiarioIntegrado"]').val(data.SalarioDiarioIntegrado);
				$('[name="SalarioBaseCotApor"]').val(data.SalarioBaseCotApor);
				$('[name="CURP"]').val(data.CURP);
				$('[name="Puesto"]').val(data.puesto);
				$('[name="CLABE"]').val(data.CLABE);
				
				var regimen={
					'fk_TipoRegimen':data.fk_TipoRegimen,
					'fk_TipoRegimen':data.nombre_fk_TipoRegimen,
				};
				var dataRegimen = $('select[name="fk_TipoRegimen"]').wijcombobox('option','data');
				$('select[name="fk_TipoRegimen"]').wijcombobox('option','selectedIndex',-1);
				dataRegimen.lenght=0;
				dataRegimen.push(regimen);
				$('select[name="fk_TipoRegimen"]').wijcombobox('option','selectedIndex',0);
				$('select[name="fk_TipoRegimen"]').wijcombobox('repaint');
				
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_empleado input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_empleadoEnAjax) return true;			
			me.setDSFk_empleado();
			me.Fk_empleadoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_empleado = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarTrabajador',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre' }, 
		{name:'rfc'}, 
		{name:'email'}, 
		{name:'CURP'}, 
		{name:'fk_TipoRegimen'}, 
		{name:'nombre_fk_TipoRegimen'}, 		
		{name:'nombre_regimen_contratacion'}, 
		{name:'NumSeguridadSocial'}, 
		{name:'NoEmpleado'}, 
		
		{name:'FechaInicioRelLaboral'}, 
		{name:'SalarioDiarioIntegrado'}, 
		{name:'SalarioBaseCotApor'}, 
		{name:'puesto'}, 
		{name:'CLABE'}, 
	
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_empleado"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_serie=function(){
		var me=this;
		
		$('select[name="fk_serie"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_serie input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_serieEnAjax) return true;			
			me.setDSFk_serie();
			me.Fk_serieEnAjax=true;
		 });
	};
		
		
	this.setDSFk_serie = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarSerie_nomina',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'serie' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_serie"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_TipoRegimen=function(){
		var me=this;
		
		$('select[name="fk_TipoRegimen"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_TipoRegimen input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_TipoRegimenEnAjax) return true;			
			me.setDSFk_TipoRegimen();
			me.Fk_TipoRegimenEnAjax=true;
		 });
	};
		
		
	this.setDSFk_TipoRegimen = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarRegimen_contratacion',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_TipoRegimen"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_Departamento=function(){
		var me=this;
		
		$('select[name="fk_Departamento"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_Departamento input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_DepartamentoEnAjax) return true;			
			me.setDSFk_Departamento();
			me.Fk_DepartamentoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_Departamento = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarDepartamento',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_Departamento"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboTipoContrato=function(){
		var me=this;
		
		$('select[name="TipoContrato"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_TipoContrato input[role="textbox"]').bind('keypress', function(){			
			if (me.TipoContratoEnAjax) return true;			
			me.setDSTipoContrato();
			me.TipoContratoEnAjax=true;
		 });
	};
		
		
	this.setDSTipoContrato = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarTipoContrato',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="TipoContrato"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboTipoJornada=function(){
		var me=this;
		
		$('select[name="TipoJornada"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_TipoJornada input[role="textbox"]').bind('keypress', function(){			
			if (me.TipoJornadaEnAjax) return true;			
			me.setDSTipoJornada();
			me.TipoJornadaEnAjax=true;
		 });
	};
		
		
	this.setDSTipoJornada = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarJornada',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="TipoJornada"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboPeriodicidadPago=function(){
		var me=this;
		
		$('select[name="PeriodicidadPago"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_PeriodicidadPago input[role="textbox"]').bind('keypress', function(){			
			if (me.PeriodicidadPagoEnAjax) return true;			
			me.setDSPeriodicidadPago();
			me.PeriodicidadPagoEnAjax=true;
		 });
	};
		
		
	this.setDSPeriodicidadPago = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarPeriodo_pago',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'descripcion' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="PeriodicidadPago"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_banco=function(){
		var me=this;
		
		$('select[name="fk_banco"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_banco input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_bancoEnAjax) return true;			
			me.setDSFk_banco();
			me.Fk_bancoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_banco = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarBanco',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre_corto' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_banco"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_RiesgoPuesto=function(){
		var me=this;
		
		$('select[name="fk_RiesgoPuesto"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_RiesgoPuesto input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_RiesgoPuestoEnAjax) return true;			
			me.setDSFk_RiesgoPuesto();
			me.Fk_RiesgoPuestoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_RiesgoPuesto = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarRiesgo',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'descripcion' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_RiesgoPuesto"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_forma_pago=function(){
		var me=this;
		
		$('select[name="fk_forma_pago"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_forma_pago input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_forma_pagoEnAjax) return true;			
			me.setDSFk_forma_pago();
			me.Fk_forma_pagoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_forma_pago = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarForma_de_pago',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_forma_pago"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_certificado=function(){
		var me=this;
		
		$('select[name="fk_certificado"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_certificado input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_certificadoEnAjax) return true;			
			me.setDSFk_certificado();
			me.Fk_certificadoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_certificado = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarCertificado',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'no_serie' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_certificado"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_moneda=function(){
		var me=this;
		
		$('select[name="fk_moneda"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_moneda input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_monedaEnAjax) return true;			
			me.setDSFk_moneda();
			me.Fk_monedaEnAjax=true;
		 });
	};
		
		
	this.setDSFk_moneda = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarMoneda',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'moneda' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_moneda"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_metodo_pago=function(){
		var me=this;
		
		$('select[name="fk_metodo_pago"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,	
			forceSelectionText:true,
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_metodo_pago input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_metodo_pagoEnAjax) return true;			
			me.setDSFk_metodo_pago();
			me.Fk_metodo_pagoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_metodo_pago = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/nominas/buscarMetodo_de_pago',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: 'datos'
		}); 

		var myReader = new wijarrayreader([
		{name:'label', mapping:'nombre' }, 
		{name:'value', mapping:'id' }]); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$('select[name="fk_metodo_pago"]').wijcombobox('option','data',datasource);
	};
		
	
	this.borrar=function(){		
		var r=confirm("¿Eliminar Nomina?");
		if (r==true){
		  this.eliminar();
		}
	}
	this.activate=function(){
		var tabId=this.tabId;
		
	}
	this.close=function(){
		
		if (this.editado){
			var res=confirm('¿Guardar antes de salir?');
			if (res===true){
				this.saveAndClose=true;
				this.guardar();
				return false;
			}else{
				return true
			}
		}else{
			return true;
		}
	};
	this.init=function(params){
		this.controlador=params.controlador;
		this.catalogo=params.catalogo;
		this.configuracion=params;
		
		var tabId='#'+params.tab.id;
		var objId=params.objId;
		
		this.tabId= tabId;		
		
		$(tabId+' .cerrar_tab').bind('click', function(){
			TabManager.cerrarTab( params.tab.id );
		 });
		
		var tab=$('div'+this.tabId);
		//estas dos linas deben estar en la hoja de estilos
		tab.css('padding','0');
		tab.css('border','0 1px 1px 1px');
		
		
		this.agregarClase('frm'+this.controlador.nombre);		
		this.agregarClase('tab_'+this.controlador.nombre);
		
		this.configurarFormulario(this.tabId);
		this.configurarToolbar(this.tabId);		
		// this.notificarAlCerrar();			
		this.actualizarTitulo();				
		
		var me=this;
		$(this.tabId + ' .frmEdicion input').change(function(){
			me.editado=true;		
		});
		
		$(tabId+' .toolbarEdicion .boton:not(.btnPrint, .btnEmail)').mouseenter(function(){
			$(this).addClass("ui-state-hover");
		});
		
		$(tabId+' .toolbarEdicion .boton *').mouseenter(function(){						
			 $(this).parent('.boton').addClass("ui-state-hover");						
		});
		
		$(tabId+' .toolbarEdicion .boton').mouseleave(function(e){			 
				$(this).removeClass("ui-state-hover");			
		});
		
		tab.data('tabObj',this); //Este para que?		
	};
	//esta funcion pasara al plugin
	//agrega una clase al panel del contenido y a la pesta�a relacionada.
	
	this.agregarClase=function(clase){
		var tabId=this.tabId;		
		var tab=$('div'+this.tabId);						
		tab.addClass(clase);		
		tab=$('a[href="'+tabId+'"]');
		tab.addClass(clase);
	}
	this.notificarAlCerrar=function(){
		var tabId = this.tabId;
		var me=this;
		 $('#tabs > ul a[href="'+tabId+'"] + span').click(function(e){
			e.preventDefault();
			 var tmp=$(me.tabId+' .txtIdTmp');				
			if (tmp.length==1){
				var id=$(tmp[0]).val();				
				$.ajax({
					type: "POST",
					url: '/'+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/cerrar',
					data: { id:id }
				}).done(function( response ) {
					
				});
			}	
		 });
	}
	this.actualizarTitulo=function(){
		var me=this;
		function getValorCampo(campo){
			var valor = $(me.tabId + ' [name="'+campo+'"]').val();
			return valor;
		}
		
		var tabId = this.tabId;		
		var id = $(this.tabId + ' [name="id"]').val();
		if (id>0){						
			$(tabId +' #titulo h1').html('Nomina: ' + getValorCampo('serie') + '  ' + getValorCampo('folio') + ''); 
		}else{
			$(tabId +' #titulo h1').html(this.tituloNuevo);
			// $('a[href="'+tabId+'"]').html('Nuevo');
		}
	};
	this.nuevo=function(){
		var tabId=this.tabId;
		var tab = $('#tabs '+tabId);		
		$(tabId +' #titulo h1').html(this.tituloNuevo);
		
		tab.find('[name="id"]').val(0);
		me.editado=false;
	};	
	this.guardar=function(){
		var tabId=this.tabId;
		var tab = $('#tabs '+tabId);
		var me=this;
	
		//-----------------------------------
		// http://stackoverflow.com/questions/2403179/how-to-get-form-data-as-a-object-in-jquery
		var paramObj = {};
		$.each($(tabId + ' .frmEdicion').serializeArray(), function(_, kv) {
		  if (paramObj.hasOwnProperty(kv.name)) {
			paramObj[kv.name] = $.makeArray(paramObj[kv.name]);
			paramObj[kv.name].push(kv.value);
		  }
		  else {
			paramObj[kv.name] = kv.value;
		  }
		});
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_patron"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_patron"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_patron'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_patron'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_patron'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_empleado"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_empleado"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_empleado'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_empleado'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_empleado'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_serie"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_serie"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_serie'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_serie'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_serie'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_TipoRegimen"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_TipoRegimen"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_TipoRegimen'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_TipoRegimen'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_TipoRegimen'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_Departamento"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_Departamento"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_Departamento'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_Departamento'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_Departamento'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="TipoContrato"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="TipoContrato"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['TipoContrato'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['TipoContrato'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['TipoContrato'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="TipoJornada"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="TipoJornada"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['TipoJornada'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['TipoJornada'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['TipoJornada'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="PeriodicidadPago"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="PeriodicidadPago"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['PeriodicidadPago'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['PeriodicidadPago'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['PeriodicidadPago'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_banco"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_banco"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_banco'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_banco'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_banco'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_RiesgoPuesto"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_RiesgoPuesto"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_RiesgoPuesto'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_RiesgoPuesto'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_RiesgoPuesto'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_forma_pago"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_forma_pago"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_forma_pago'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_forma_pago'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_forma_pago'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_certificado"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_certificado"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_certificado'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_certificado'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_certificado'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_moneda"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_moneda"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_moneda'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_moneda'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_moneda'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_metodo_pago"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_metodo_pago"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_metodo_pago'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_metodo_pago'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_metodo_pago'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		
		//-----------------------------------
		var datos=paramObj;
		$(tabId+' .tabla_percepciones').wijgrid('endEdit');
				var percepciones=$(tabId+' .tabla_percepciones').wijgrid('data');
				datos.percepcionesDeNomina = percepciones;$(tabId+' .tabla_deducciones').wijgrid('endEdit');
				var deducciones=$(tabId+' .tabla_deducciones').wijgrid('data');
				datos.deduccionesDeNomina = deducciones;$(tabId+' .tabla_incapacidades').wijgrid('endEdit');
				var incapacidades=$(tabId+' .tabla_incapacidades').wijgrid('data');
				datos.incapacidadesDeNomina = incapacidades;$(tabId+' .tabla_horas_extra').wijgrid('endEdit');
				var horas_extra=$(tabId+' .tabla_horas_extra').wijgrid('data');
				datos.horas_extraDeNomina = horas_extra;$(tabId+' .tabla_conceptos').wijgrid('endEdit');
				var conceptos=$(tabId+' .tabla_conceptos').wijgrid('data');
				datos.conceptosDeNomina = conceptos;$(tabId+' .tabla_impuestos').wijgrid('endEdit');
				var impuestos=$(tabId+' .tabla_impuestos').wijgrid('data');
				datos.impuestosDeNomina = impuestos;
				
		//Envia los datos al servidor, el servidor responde success true o false.
		$("#contenedorDatos2").block({ 
			message: '<h1>Guardando</h1>'               
		}); 
		$.ajax({
			type: "POST",
			url: kore.url_base+this.configuracion.modulo.nombre+'/'+this.controlador.nombre+'/guardar',
			data: { datos: datos}
		}).done(function( response ) {
			$("#contenedorDatos2").unblock(); 
			var msg;
			var title;	
			try{
					var resp = eval('(' + response + ')');
			}catch(err){
				msg='El servidor ha respondido de manera incorrecta. <br />'+response;
				title='Error Al Guardar';
				icon= kore.url_web+'imagenes/error.png';
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
				return false;
			}			
			msg= (resp.msg)? resp.msg : '';
			
			
			if ( resp.success == true	){
				if (resp.msgType!=undefined && resp.msgType == 'info'){
					icon=kore.url_web+'imagenes/yes.png';
				}else{
					icon=kore.url_web+'imagenes/info.png';
				}
				
				if (resp.esNuevo){					
					window.location = kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar/'+ resp.datos.id;
				}
				title= 'Success';				
				// tab.find('[name="'+me.configuracion.pk+'"]').val(resp.datos[me.configuracion.pk]);
				tab.find('[name="'+me.configuracion.pk+'"]').val(resp.datos[me.configuracion.pk]);
				
				me.actualizarTitulo();
				me.editado=false;
				var objId = '/'+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar?id='+resp.datos.id;
				objId = objId.toLowerCase();
				$(me.tabId ).attr('objId',objId);				
				
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
				
				
				//--------------------
				var elementos=resp.datos.impuestosDeNomina;	

				var grid=$(me.tabId+" .tabla_impuestos");
				var data=grid.wijgrid('data');				
				data.length=0;
				for(var i=0; i<elementos.length; i++){
					data.push(elementos[i]);
				}

				grid.wijgrid('ensureControl', true);
				//-----------------------------
				me.generarArchivos(resp.esNuevo);
				
				if (me.saveAndClose===true){
					//busca el indice del tab
					var idTab=$(me.tabId).attr('id');
					var tabs=$('#tabs > div');
					for(var i=0; i<tabs.length; i++){
						if ( $(tabs[i]).attr('id') == idTab ){
							$('#tabs').wijtabs('remove', i);
						}
					}
				}
			}else{
				icon= kore.url_web+'imagenes/error.png';
				title= 'Error';					
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
			}
			
			//cuando es true, envia tambien los datos guardados.
			//actualiza los valores del formulario.
			
		});
	};	
	this.eliminar=function(){
		var id = $(this.tabId + ' [name="id"]').val();
		var me=this;
		
		var params={};
		params['id']=id;
		
		
		$.ajax({
				type: "POST",
				url: kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/eliminar',

				data: params
			}).done(function( response ) {		
				var msg;
				var title;	
				try{
						var resp = eval('(' + response + ')');
				}catch(err){
					msg='El servidor ha respondido de manera incorrecta. <br />'+response;
					title='Error Al Intentar Eliminar';
					icon= kore.url_web+'imagenes/error.png';
					$.gritter.add({
						position: 'bottom-left',
						title:title,
						text: msg,
						image: icon,
						class_name: 'my-sticky-class'
					});
					return false;
				}			
				msg= (resp.msg)? resp.msg : '';
				if ( resp.success == true	){					
					icon=kore.url_web+'imagenes/yes.png';
					title= 'Success';									
				}else{
					icon= kore.url_web+'imagenes/error.png';
					title= 'Error';
				}
				
				//cuando es true, envia tambien los datos guardados.
				//actualiza los valores del formulario.
				// var idTab=$(me.tabId).attr('id');
				// var tabs=$('#tabs > div');
				me.editado=false;
				// for(var i=0; i<tabs.length; i++){
					// if ( $(tabs[i]).attr('id') == idTab ){
						// $('#tabs').wijtabs('remove', i);
					// }
				// }
				$(me.tabId).find('[name="id"]').val(0);
					
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
			});
	},	
	this.configurarFormulario=function(tabId){		
		var me=this;
		$(this.tabId+' [name="FechaPago"]').wijinputdate({showTrigger: true, dateFormat:'dd/MM/yyyy'});	
		$(this.tabId+' [name="FechaInicialPago"]').wijinputdate({showTrigger: true, dateFormat:'dd/MM/yyyy'});	
		$(this.tabId+' [name="FechaFinalPago"]').wijinputdate({showTrigger: true, dateFormat:'dd/MM/yyyy'});
		$(this.tabId+' [name="FechaInicioRelLaboral"]').wijinputdate({showTrigger: true, dateFormat:'dd/MM/yyyy'});	
		$(this.tabId+' [name="fecha_emision"]').wijinputdate({showTrigger: true, dateFormat:'dd/MM/yyyy'});
		
		// $(this.tabId+' .frmEdicion textarea').wijtextbox();			
		
		this.configurarComboFk_patron();
		this.configurarComboFk_empleado();
		this.configurarComboFk_serie();
		this.configurarComboFk_TipoRegimen();
		this.configurarComboFk_Departamento();
		this.configurarComboTipoContrato();
		this.configurarComboTipoJornada();
		this.configurarComboPeriodicidadPago();
		this.configurarComboFk_banco();
		this.configurarComboFk_RiesgoPuesto();
		this.configurarComboFk_forma_pago();
		this.configurarComboFk_certificado();
		this.configurarComboFk_moneda();
		this.configurarComboFk_metodo_pago();
		var options={autoOpen:false, width:800};
		$("#datos_empleado").wijdialog(options);
	};
	this.configurarToolbar=function(tabId){					
		var me=this;	
		
		$('#lnkDetallesTrabajador').click( function(){
			$("#datos_empleado").wijdialog('open');
		});
		
		$(this.tabId + ' .toolbarEdicion .btnTimbrar').click( function(){
			me.timbrar();
			me.editado=true;
		});
		$(this.tabId + ' .toolbarEdicion .btnNuevo').click( function(){
			window.location=kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/nuevo';
		});
		
		$(this.tabId + ' .toolbarEdicion .btnGuardar').click( function(){
			me.guardar();
			me.editado=true;
		});
		
		$(this.tabId + ' .toolbarEdicion .btnPdf').click( function(){
			var id=$(me.tabId + ' [name="id"]').val();
			if (id > 0){								
				window.location=kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/bajarPdf/'+id;
			}
		});
		
		$(this.tabId + ' .toolbarEdicion .btnDelete').click( function(){
			var r=confirm("¿Eliminar Nomina?");
			if (r==true){
			  me.eliminar();
			  me.editado=false;
			  me.nuevo();
			}
		});
	};	
}
