﻿var BusquedaCortes=function(){
	
	this.buscar=function(){
		var gridBusqueda=$(this.tabId+" .grid_busqueda");				
		gridBusqueda.wijgrid('ensureControl', true);
	}
	this.eliminar=function(){
	
	var me=this;
	
	var id = this.selected[this.configuracion.pk];
	var me=this;	
	var params={};
	params[this.configuracion.pk]=id;
	
	$.ajax({
			type: "POST",
			url: kore.url_base+this.configuracion.modulo.nombre+'/'+this.controlador.nombre+'/eliminar',

			data: params
		}).done(function( response ) {		
			var resp = eval('(' + response + ')');
			var msg= (resp.msg)? resp.msg : '';
			var title;
			if ( resp.success == true	){
				icon=kore.url_web+'imagenes/yes.png';
				title= 'Success';				
				var gridBusqueda=$(me.tabId+" .grid_busqueda");				
				gridBusqueda.wijgrid('ensureControl', true);
			}else{
				icon= kore.url_web+'imagenes/error.png';
				title= 'Error';
			}
			
			//cuando es true, envia tambien los datos guardados.
			//actualiza los valores del formulario.
			$.gritter.add({
				position: 'bottom-left',
				title:title,
				text: msg,
				image: icon,
				class_name: 'my-sticky-class'
			});
		});
}
	this.nuevo=function(){		
		TabManager.add(kore.url_base+this.configuracion.modulo.nombre+'/'+this.controlador.nombre+'/nuevo');
	};
	this.activate=function(){
		// vuelve a renderear estos elementos que presentaban problemas. (correccion de bug)		
		$(this.tabId+" .lista_toolbar").removeClass('ui-tabs-hide');
		$(this.tabId+" .lista_toolbar  ~ .wijmo-wijribbon-panel").removeClass('ui-tabs-hide');		
		
	}
	this.borrar=function(){
		if (this.selected==undefined) return false;
		var r=confirm("¿Eliminar Elemento?");
		if (r==true){
		  this.eliminar();
		}
	}
	this.agregarClase=function(clase){
		var tabId=this.tabId;		
		var tab=$('div'+this.tabId);						
		tab.addClass(clase);		
		tab=$('a[href="'+tabId+'"]');
		tab.addClass(clase);
	}
	this.init=function(config){		
		//-------------------------------------------Al nucleo		*/		
		this.controlador=config.controlador;
		this.catalogo=config.catalogo;
		this.configuracion=config;
		//-------------------------------------------
		var tab=config.tab;		
		tabId = '#' + tab.id;
		this.tabId = tabId;
		var jTab=$('div'+tabId);				
		jTab.data('tabObj',this);		
				
		var jTab=$('a[href="'+tabId+'"]');		//// this.agregarClase('busqueda_'+this.controlador.nombre);
	    jTab.html(this.catalogo.nombre);		 
		 jTab.addClass('busqueda_'+this.controlador.nombre); 
		 this.agregarClase('tab_'+this.controlador.nombre);
		//-------------------------------------------
		$('div'+tabId).css('padding','0px 0 0 0');
		$('div'+tabId).css('margin-top','0px');
		$('div'+tabId).css('border','0 1px 1px 1px');			
		//-------------------------------------------				
		this.configurarToolbar(tabId);		
		 this.configurarGrid(tabId);
	};
	this.configurarToolbar=function(tabId){
		var me=this;
		$(this.tabId + ' .toolbarEdicion .btnNuevo').click( function(){
			window.location=kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/nuevo';
		});
		
		$(this.tabId + ' .toolbarEdicion .btnEditar').click( function(){
			if (me.selected!=undefined){													
				var id=me.selected[me.configuracion.pk];							
				window.location=kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar/'+id;				
			}			
		});
		
		$(this.tabId + ' .toolbarEdicion .btnEliminar').click( function(){
			if (me.selected==undefined) return false;
			var r=confirm("¿Eliminar Corte?");
			if (r==true){
			  me.eliminar();
			}
		});
		
		$(this.tabId + ' .toolbarEdicion input[type="submit"]').click( function(e){
			e.preventDefault();
			var gridBusqueda=$(me.tabId+" .grid_busqueda");				
			gridBusqueda.wijgrid('ensureControl', true);
		});
		
		$(this.tabId+ " > .lista_toolbar").wijribbon({
			click: function (e, cmd) {
				switch(cmd.commandName){
					case 'nuevo':						
						me.nuevo();
					break;
					case 'editar':
						if (me.selected!=undefined){													
							var id=me.selected[me.configuracion.pk];							
							TabManager.add(kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar','Editar '+me.catalogo.nombre,id);
						}
					break;
					case 'eliminar':
						if (me.selected==undefined) return false;
						var r=confirm("¿Eliminar Corte?");
						if (r==true){
						  me.eliminar();
						}
					break;
					case 'refresh':
						
						var gridBusqueda=$(me.tabId+" .grid_busqueda");
						gridBusqueda.wijgrid('ensureControl', true);
					break;
										
					default:						 
						$.gritter.add({
							position: 'bottom-left',
							title:cmd.commandName,
							text: "Acciones del toolbar en construcci&oacute;n",
							image: kore.url_web+'imagenes/info.png',
							class_name: 'my-sticky-class'
						});
						
					break;
					case 'imprimir':
						alert("Imprimir en construcción");
					break;
				}
				
			}
		});
		
	};
	this.configurarGrid=function(tabId){
		pageSize=10;
		
		var campos=[
			// { name: "id"  }
		];
		var dataReader = new wijarrayreader(campos);
			
		var dataSource = new wijdatasource({
			proxy: new wijhttpproxy({
				url: kore.url_base+this.configuracion.modulo.nombre+'/'+this.controlador.nombre+'/buscar',
				dataType: "json",
				type:'POST'
			}),
			dynamic:true,
			reader:new wijarrayreader(campos),
			loading : function(data){				
				var value = $( ' input[name="query"]').val();				
				
				data.proxy.options.data.filtering.push({
					dataKey: "nombre_maquina",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "nombre_cliente",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "nombre_punto_de_venta",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "nombre_tecnico",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "cont_entrada",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "cont_salida",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "saldo_contadores",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "dato_de_la_placa",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "monto",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "fecha",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "serie_serie",
					filterOperator: "Contains",
					filterValue: value
				});
		
				data.proxy.options.data.filtering.push({
					dataKey: "folio",
					filterOperator: "Contains",
					filterValue: value
				});
		
				
				
            }
		});
				
		dataSource.reader.read= function (datasource) {						
			var totalRows=datasource.data.totalRows;						
			datasource.data = datasource.data.rows;
			datasource.data.totalRows = totalRows;
			dataReader.read(datasource);
		};				
		this.dataSource=dataSource;
		var gridBusqueda=$(this.tabId+" .grid_busqueda");

		var me=this;		 
		gridBusqueda.wijgrid({
			dynamic: true,
			allowColSizing:true,			
			allowKeyboardNavigation:true,
			allowPaging: true,
			pageSize:pageSize,
			selectionMode:'singleRow',
			data:dataSource,
			showFilter:false,
			columns: [ 
				{ dataKey: "id", visible:false, headerText: "Id" },
{ dataKey: "nombre_fk_maquina", visible:true, headerText: "Maquina" },
{ dataKey: "fk_maquina", visible:false, headerText: "Maquina" },
{ dataKey: "nombre_fk_cliente", visible:true, headerText: "Cliente" },
{ dataKey: "fk_cliente", visible:false, headerText: "Cliente" },
{ dataKey: "nombre_fk_pdv", visible:true, headerText: "PDV" },
{ dataKey: "fk_pdv", visible:false, headerText: "PDV" },
{ dataKey: "nombre_fk_tecnico", visible:true, headerText: "Tecnico" },
{ dataKey: "fk_tecnico", visible:false, headerText: "Tecnico" },
{ dataKey: "cont_entrada", visible:true, headerText: "Cont Entrada" },
{ dataKey: "cont_salida", visible:true, headerText: "Cont Salida" },
{ dataKey: "saldo_contadores", visible:true, headerText: "Saldo" },
{ dataKey: "dato_de_la_placa", visible:true, headerText: "Dato De La Placa" },
{ dataKey: "monto", visible:true, headerText: "Monto" },
{ dataKey: "fecha", visible:true, headerText: "Fecha" },
{ dataKey: "serie_fk_serie", visible:true, headerText: "Serie" },
{ dataKey: "fk_serie", visible:false, headerText: "Serie" },
{ dataKey: "folio", visible:true, headerText: "Folio" },
			]
		});
		
		var me=this;
		
		gridBusqueda.wijgrid({ selectionChanged: function (e, args) { 					
			var item=args.addedCells.item(0);
			var row=item.row();
			var data=row.data;			
			me.selected=data;			
		} });
		
		gridBusqueda.wijgrid({ loaded: function (e) { 
			$(me.tabId + ' .grid_busqueda tr').bind('dblclick', function (e) { 							
				var pedidoId=me.selected[me.configuracion.pk];
				//          TabManager.add(kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar','Editar '+me.catalogo.nombre,pedidoId);				
				window.location=kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar/'+pedidoId;
			});			
		} });
	};
};