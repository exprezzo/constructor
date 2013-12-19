var EdicionCortes = function(){
	this.editado=false;
	this.tituloNuevo='Nuevo Corte';
	this.saveAndClose=false;
	
	this.configurarComboFk_maquina=function(){
		var me=this;
		
		$('select[name="fk_maquina"]').wijcombobox({			
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
		 
		 $('.contenedor_fk_maquina input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_maquinaEnAjax) return true;			
			me.setDSFk_maquina();
			me.Fk_maquinaEnAjax=true;
		 });
	};
		
		
	this.setDSFk_maquina = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/cortes/buscarMaquina',
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
	
		$('select[name="fk_maquina"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_cliente=function(){
		var me=this;
		
		$('select[name="fk_cliente"]').wijcombobox({			
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
		 
		 $('.contenedor_fk_cliente input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_clienteEnAjax) return true;			
			me.setDSFk_cliente();
			me.Fk_clienteEnAjax=true;
		 });
	};
		
		
	this.setDSFk_cliente = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/cortes/buscarCliente',
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
	
		$('select[name="fk_cliente"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_pdv=function(){
		var me=this;
		
		$('select[name="fk_pdv"]').wijcombobox({			
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
		 
		 $('.contenedor_fk_pdv input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_pdvEnAjax) return true;			
			me.setDSFk_pdv();
			me.Fk_pdvEnAjax=true;
		 });
	};
		
		
	this.setDSFk_pdv = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/cortes/buscarPunto_de_venta',
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
	
		$('select[name="fk_pdv"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_tecnico=function(){
		var me=this;
		
		$('select[name="fk_tecnico"]').wijcombobox({			
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
		 
		 $('.contenedor_fk_tecnico input[role="textbox"]').bind('keypress', function(){			
			if (me.Fk_tecnicoEnAjax) return true;			
			me.setDSFk_tecnico();
			me.Fk_tecnicoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_tecnico = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/cortes/buscarTecnico',
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
	
		$('select[name="fk_tecnico"]').wijcombobox('option','data',datasource);
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
			url: kore.url_base+kore.modulo+'/cortes/buscarSerie',
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
		
	
	this.borrar=function(){		
		var r=confirm("¿Eliminar Corte?");
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
			var titulo=$('.contenedor_fk_serie div[role="combobox"] input[role="textbox"]').val();
			titulo=titulo + ' ' + $('input[name="folio"]').val();
			$(tabId +' #titulo h1').html('Corte: ' + titulo);
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
		var selectedIndex = $('[name="fk_maquina"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_maquina"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_maquina'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_maquina'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_maquina'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_cliente"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_cliente"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_cliente'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_cliente'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_cliente'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_pdv"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_pdv"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_pdv'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_pdv'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_pdv'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_tecnico"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_tecnico"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_tecnico'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_tecnico'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_tecnico'] =selectedItem.data[selectedIndex]['id'];
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
		var datos=paramObj;
		
				
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
		// $(this.tabId+' .frmEdicion input[type="text"]').wijtextbox();		
		// $(this.tabId+' .frmEdicion textarea').wijtextbox();			
		
this.configurarComboFk_maquina();
this.configurarComboFk_cliente();
this.configurarComboFk_pdv();
this.configurarComboFk_tecnico();
this.configurarComboFk_serie();
	};
	this.configurarToolbar=function(tabId){					
		var me=this;			
		$(this.tabId + ' .toolbarEdicion .btnNuevo').click( function(){
			window.location=kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/nuevo';
		});
		
		$(this.tabId + ' .toolbarEdicion .btnGuardar').click( function(){
			me.guardar();
			me.editado=true;
		});
		
		$(this.tabId + ' .toolbarEdicion .btnDelete').click( function(){
			var r=confirm("¿Eliminar Corte?");
			if (r==true){
			  me.eliminar();
			  me.editado=false;
			  me.nuevo();
			}
		});
	};	
}
