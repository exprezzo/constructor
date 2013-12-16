var ConfigTabla=function(){
	var me=this;
	// this.generarTabla=function(catalogo){
		
		/*//---------------------------
		//crear columnas
		//-----------------------------
		*/
	// }
	this.configurarGrid=function( catalogo ){
		
		var gridId='#gridConfigTabla';
		
		pageSize=10;
		
		var campos=[
			// { name: "id"  }
		];
		var dataReader = new wijarrayreader(campos);
			
		var dataSource = new wijdatasource({
			// proxy: new wijhttpproxy({
				// url: kore.url_base+this.configuracion.modulo.nombre+'/'+this.controlador.nombre+'/buscar',
				// dataType: "json",
				// type:'POST'
			// }),
			dynamic:true,
			reader:new wijarrayreader(campos),
			loading : function(data){				
				// var value = $( ' input[name="query"]').val();				
				// data.proxy.options.data.filtering.push({
					 // dataKey: "nombre",
					 // filterOperator: "Contains",
					 // filterValue: value
				 // });
				// data.proxy.options.data.filtering.push({
					// dataKey: "descripcion",
					// filterOperator: "Contains",
					// filterValue: value
				// });
            }
		});
				
		dataSource.reader.read= function (datasource) {						
			var totalRows=datasource.data.totalRows;						
			datasource.data = datasource.data.rows;
			datasource.data.totalRows = totalRows;
			dataReader.read(datasource);
		};				
		this.dataSource=dataSource;
		var gridBusqueda=$(gridId);

		var me=this;		 
		gridBusqueda.wijgrid({
			dynamic: true,
			allowEditing:true,
			allowColSizing:true,			
			allowKeyboardNavigation:true,
			allowPaging: true,
			pageSize:pageSize,
			selectionMode:'singleRow',
			data:catalogo.elementos,
			showFilter:false,
			columns: [	
				
				{ dataKey: "campo", visible:true, headerText: "Elemento" },
				{ dataKey: "componente", visible:true, headerText: "Componente" },
				{ dataKey: "comp_config", visible:true, headerText: "Comp Config" },
				{ dataKey: "id", visible:false, headerText: "id" },
				{ dataKey: "esDefault", visible:false, headerText: "esDefault" },
				{ dataKey: "extras", visible:false, headerText: "extras" },
				{ dataKey: "llave", visible:false, headerText: "llave" },
				{ dataKey: "esNulo", visible:false, headerText: "esNulo" },
				{ dataKey: "tipo", visible:false, headerText: "tipo" },
				{ dataKey: "fk_catalogo", visible:false, headerText: "fk_catalogo" }				
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
			$(gridId + ' tr').bind('dblclick', function (e) { 							
				// var pedidoId=me.selected[me.configuracion.pk];				
				// window.location=kore.url_base+me.configuracion.modulo.nombre+'/'+me.controlador.nombre+'/editar/'+pedidoId;
			});			
		} });
	};
	this.init=function( elementos ){
		
		if ( !$.isArray(elementos) ) elementos= new Array();
		this.configurarGrid( {elementos:elementos})
		$('#actualizarConfigTabla').bind('click', function(){
			
			var elementos=$('#gridConfigTabla').wijgrid('data');
			
			$("[name='config_tabla']").val( JSON.stringify(elementos) );
		});
		// $('select[name="target"]').wijcombobox();
		$('#cargarCatalogo').bind('click', function(){
			
			var fk_catalogo=$('[name="target"]').val();
			
			$.ajax({
				type: "POST",
				url: kore.url_base+kore.modulo+'/catalogos/getCatalogo',
				data: { fk_catalogo: fk_catalogo}
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
				// var resp = eval('(' + response + ')');
				msg= (resp.msg)? resp.msg : '';
				
				
				if ( resp.success == true	){
					title= 'Exito';					
					icon= kore.url_web+'imagenes/yes.png';				
					//--------------------								
				}else{
					title= 'Error';
					icon= kore.url_web+'imagenes/error.png';
				}
				
				var msg='';
				
				//Esto deberia pasar al nucleo
				if (resp.msg != undefined) msg =resp.msg;
				if (resp.title != undefined) title =resp.title;
				// if (resp.icon != undefined){} icon = resp.icon;
				
				// me.generarTabla(resp.catalogo);
				var gridId='#gridConfigTabla';
				$(gridId).wijgrid('destroy');
				me.configurarGrid( resp.catalogo );
				
				if (msg != "")
				$.gritter.add({
					position: 'bottom-left',
					title:title,
					text: msg,
					image: icon,
					class_name: 'my-sticky-class'
				});
				
			});
		});
	};	
}
