$(function(){
	
	
	$('.rzSel').bind('click',function(){
		var $rzId = $(this).attr('rzId');				
		selecionarRfc($rzId);
	});
	
	switch(kore.controlador){
		case 'paginas':
			if (kore.accion=='inicio'){
				$('#contenedorMenu > ul > li:nth-child(2) > a:nth-child(1)').addClass("estiloFactura");
			}else if(kore.accion=='ayuda'){
				$('#contenedorMenu > ul > li:nth-child(4) > a:nth-child(1)').addClass("estiloFactura");
			}else if(kore.accion=='documentacion'){
				$('#contenedorMenu > ul > li:nth-child(4) > a:nth-child(1)').addClass("estiloFactura");
			}
		break;
		case 'facturas':					
			$('#contenedorMenu > ul > li:nth-child(1) > a:nth-child(1)').addClass("estiloFactura");
		break;
		case 'conceptos':
		case 'receptores':
		case 'rfcs':					
			$('#contenedorMenu > ul > li:nth-child(2) > a:nth-child(1)').addClass("estiloFactura");
			break;
		case 'series':					
		case 'paises':					
		case 'estados':					
		case 'ciudades':					
		case 'municipios':					
			$('#contenedorMenu > ul > li:nth-child(3) > a:nth-child(1)').addClass("estiloFactura");
		break;			
	}
});

function selecionarRfc(id){			
	var params={};
	params['id']=id;			
	$.ajax({
			type: "POST",
			url: kore.url_base+kore.modulo+'/paginas/seleccionarRfz',
			data: params
		}).done(function( response ) {		
			var resp = eval('(' + response + ')');
			var msg= (resp.msg)? resp.msg : '';
			var title;
			if ( resp.success == true	){
				icon=kore.url_web+'imagenes/yes.png';
				title= 'Success';						
				$('#valRfc').html(resp.datos.nombre_comercial);
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