var EdicionDocumentos = function(){
	this.editado=false;
	this.tituloNuevo='Nuevo Documento';
	this.saveAndClose=false;
	
	this.configurarComboFk_tipo_de_documento=function(){
		var me=this;
		
		$('select[name="fk_tipo_de_documento"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,			
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_tipo_de_documento input[role="textbox"]').bind('focus', function(){			
			if (me.Fk_tipo_de_documentoEnAjax) return true;			
			me.setDSFk_tipo_de_documento();
			me.Fk_tipo_de_documentoEnAjax=true;
		 });
	};
		
		
	this.setDSFk_tipo_de_documento = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/documentos/buscarTipo_de_documento',
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
	
		$('select[name="fk_tipo_de_documento"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_serie=function(){
		var me=this;
		
		$('select[name="fk_serie"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,			
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_serie input[role="textbox"]').bind('focus', function(){			
			if (me.Fk_serieEnAjax) return true;			
			me.setDSFk_serie();
			me.Fk_serieEnAjax=true;
		 });
	};
		
		
	this.setDSFk_serie = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/documentos/buscarSerie',
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
	
		$('select[name="fk_serie"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_transportador=function(){
		var me=this;
		
		$('select[name="fk_transportador"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,			
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_transportador input[role="textbox"]').bind('focus', function(){			
			if (me.Fk_transportadorEnAjax) return true;			
			me.setDSFk_transportador();
			me.Fk_transportadorEnAjax=true;
		 });
	};
		
		
	this.setDSFk_transportador = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/documentos/buscarSocio',
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
	
		$('select[name="fk_transportador"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_remitente=function(){
		var me=this;
		
		$('select[name="fk_remitente"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,			
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_remitente input[role="textbox"]').bind('focus', function(){			
			if (me.Fk_remitenteEnAjax) return true;			
			me.setDSFk_remitente();
			me.Fk_remitenteEnAjax=true;
		 });
	};
		
		
	this.setDSFk_remitente = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/documentos/buscarSocio',
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
	
		$('select[name="fk_remitente"]').wijcombobox('option','data',datasource);
	};
		
	this.configurarComboFk_destinatario=function(){
		var me=this;
		
		$('select[name="fk_destinatario"]').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:false,			
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $('.contenedor_fk_destinatario input[role="textbox"]').bind('focus', function(){			
			if (me.Fk_destinatarioEnAjax) return true;			
			me.setDSFk_destinatario();
			me.Fk_destinatarioEnAjax=true;
		 });
	};
		
		
	this.setDSFk_destinatario = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+kore.modulo+'/documentos/buscarSocio',
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
	
		$('select[name="fk_destinatario"]').wijcombobox('option','data',datasource);
	};
		
	
	this.borrar=function(){		
		var r=confirm("Â¿Eliminar Documento?");
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
			$(tabId +' #titulo h1').html('Documento: ' + getValorCampo('id'));
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
		var selectedIndex = $('[name="fk_tipo_de_documento"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_tipo_de_documento"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_tipo_de_documento'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_tipo_de_documento'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_tipo_de_documento'] =selectedItem.data[selectedIndex]['id'];
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
		var selectedIndex = $('[name="fk_transportador"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_transportador"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_transportador'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_transportador'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_transportador'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_remitente"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_remitente"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_remitente'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_remitente'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_remitente'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		

		//-----------------------------------		
		var selectedIndex = $('[name="fk_destinatario"]').wijcombobox('option','selectedIndex');  
		var selectedItem = $('[name="fk_destinatario"]').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj['fk_destinatario'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj['fk_destinatario'] =selectedItem[selectedIndex]['value'];
			}else{
				paramObj['fk_destinatario'] =selectedItem.data[selectedIndex]['id'];
			}
		}
		//-----------------------------------
		
		//-----------------------------------
		var datos=paramObj;
		$(tabId+' .tabla_conceptos').wijgrid('endEdit');
				var conceptos=$(tabId+' .tabla_conceptos').wijgrid('data');
				datos.conceptosDeDocumento = conceptos;
				
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
			var resp = eval('(' + response + ')');
			var msg= (resp.msg)? resp.msg : '';
			var title;
			
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
				var elementos=resp.datos.conceptosDeDocumento;	

				var grid=$(me.tabId+" .tabla_conceptos");
				var data=grid.wijgrid('data');				
				data.length=0;
				for(var i=0; i<elementos.length; i++){
					data.push(elementos[i]);
				}

				grid.wijgrid('ensureControl', true);
				//-----------------------------
				
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
				var resp = eval('(' + response + ')');
				var msg= (resp.msg)? resp.msg : '';
				var title;
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
		
this.configurarComboFk_tipo_de_documento();
this.configurarComboFk_serie();
this.configurarComboFk_transportador();
this.configurarComboFk_remitente();
this.configurarComboFk_destinatario();
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
			var r=confirm("¿Eliminar?");
			if (r==true){
			  me.eliminar();
			  me.editado=false;
			  me.nuevo();
			}
		});
	};	
}
