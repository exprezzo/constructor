<?php
class GeneradorFormulario{
	
	function generarCodigoGuardarCombo( $el ){
		$config=json_decode($el['comp_config'], true);
		$fk_modelo=$config['target'];				
		$modeloMod = new modelocModelo();
		$modeloObj =$modeloMod->obtener( array('id'=>$fk_modelo)  );
		
		$campo=$el['campo'];
		$codigo='
		//-----------------------------------		
		var selectedIndex = $(\'[name="'.$campo.'"]\').wijcombobox(\'option\',\'selectedIndex\');  
		var selectedItem = $(\'[name="'.$campo.'"]\').wijcombobox("option","data");		
		if (selectedIndex == -1){
			paramObj[\''.$campo.'\'] =0;
		}else{
			if (selectedItem.data == undefined ){
				paramObj[\''.$campo.'\'] =selectedItem[selectedIndex][\'value\'];
			}else{
				paramObj[\''.$campo.'\'] =selectedItem.data[selectedIndex][\''.$modeloObj['llave_primaria'].'\'];
			}
		}
		//-----------------------------------
		';
		
		return $codigo;
	}
	function generarInitCombo( $el ){
		$config=json_decode($el['comp_config'], true);
		$fk_modelo=$config['target'];				
		$modeloMod = new modelocModelo();
		$modeloObj =$modeloMod->obtener( array('id'=>$fk_modelo)  );
		
		$nombreModelo=ucfirst($modeloObj['nombre']);
		$codigo='this.configurarCombo'.$nombreModelo.'();';
		return $codigo;
	}
	function generarCodigoCombo( $el, $cat ){
		$config=json_decode($el['comp_config'], true);
		$fk_modelo=$config['target'];				
		$modeloMod = new modelocModelo();
		$modeloObj =$modeloMod->obtener( array('id'=>$fk_modelo)  );
				
		$modelo=ucfirst ( $modeloObj['nombre'] );
		$modelo_min=strtolower( $modeloObj['nombre'] );
		$claseContenedor='contenedor_'.$el['campo'];
		$campo = $el['campo'];
		
		$crlf = "\r\n"; 
		$camposCombo='
		{name:\'label\', mapping:\''.$config['campo_a_mostrar'].'\' }, ';
		$camposCombo.='
		{name:\'value\', mapping:\''.$modeloObj['llave_primaria'].'\' }';
	
		
		$configurarCombo='
	this.configurarCombo'.$modelo.'=function(){
		var me=this;
		
		$(\'select[name="'.$campo.'"]\').wijcombobox({			
			showTrigger: true,
			width:300,
			minLength:1,
			autoFilter:true,			
			select : function (e, data) {						
			},
			search: function (e, obj) { 						
			}
		 });
		 
		 $(\'.'.$claseContenedor.' input[role="textbox"]\').bind(\'focus\', function(){			
			if (me.'.$modelo_min.'EnAjax) return true;			
			me.setDS'.$modelo.'();
			me.'.$modelo_min.'EnAjax=true;
		 });
	};
		
		';
		$setDs='
	this.setDS'.$modelo.' = function(){		
		
		var filtering=new Array();
		var proxy = new wijhttpproxy({
			url: kore.url_base+\''.$cat['controlador'].'/buscar'.$modelo.'\',
			dataType: "json", 
			type:"POST",
			data: {
				style: "full",
				 filtering:filtering						
			},
			key: \'datos\'
		}); 

		var myReader = new wijarrayreader(['.$camposCombo.']); 

		var datasource = new wijdatasource({ 
			reader: myReader, 
			proxy: proxy 
		}); 
	
		$(\'select[name="'.$campo.'"]\').wijcombobox(\'option\',\'data\',datasource);
	};
		';
		return $configurarCombo.$setDs;
	}
	function generarCodigoJs($jsStr, $cat){
		
		$nombreNuevo='var Edicion'.ucfirst($cat['controlador']).' = function(){';
		$jsStr = str_replace('var EdicionControlador = function(){', $nombreNuevo, $jsStr);
		
		$jsStr = str_replace('{TITULO NUEVO}', $cat['titulo_nuevo'], $jsStr);
		$jsStr = str_replace('{PREGUNTA-ELIMINAR}', $cat['pregunta_eliminar'], $jsStr);
		
		$tituloEdicion='$(tabId +\' #titulo h1\').html('.$cat['titulo_edicion'].');';
		$jsStr = str_replace('//{TITULO-EDICION}', $tituloEdicion, $jsStr);
		
		$jsStr = str_replace('{LLAVE-PRIMARIA}', $cat['pk_tabla'], $jsStr);
		
		$funcionesCombo='';
		$funcionesInitCombo='';
		$codigoGuardarCombo='';
		$crlf = "\r\n"; 
		foreach($cat['elementos'] as $el){
			if ( strtolower( $el['componente'] ) ==  'combo box' ){
				
				$funcionesCombo.= $this->generarCodigoCombo( $el, $cat );
				$funcionesInitCombo.=$crlf.$this->generarInitCombo( $el, $cat  );
				$codigoGuardarCombo=$crlf.$this->generarCodigoGuardarCombo( $el );
			}
			
		}
		$jsStr = str_replace('//FUNCIONES-COMBO', $funcionesCombo, $jsStr);
		$jsStr = str_replace('//{INIT-COMBOS}', $funcionesInitCombo, $jsStr);
		$jsStr = str_replace('//{CODIGO-GUARDAR-COMBOS}', $codigoGuardarCombo, $jsStr);
		
		return $jsStr;
	}
	function generarJS($cat, $rutaBase){
		$directorio = $rutaBase.'presentacion/web/js/catalogos/'.$cat['controlador'].'/';
		if ( !file_exists($directorio)) {
			mkdir($directorio);
		}
		$filename = dirname(__FILE__).'/plantillas/edicion.js';
		$handle = fopen($filename, "r");
		$jsStr= fread($handle, filesize($filename));
		fclose($handle);
		//------------------------------------------
		$jsStr=$this->generarCodigoJs( $jsStr, $cat );
		//---------------------------------------
		$filename = $directorio.'edicion.js';
		$handle = fopen($filename, "w");
		$jsStr= fwrite($handle, $jsStr, strlen($jsStr));
		fclose($handle);
		//----------------------------------------------
	}
	
	
	function generar($cat, $rutaBase){
		// CREAR HTML
		$directorio = $rutaBase.'presentacion/html.php/'.$cat['controlador'].'/';
		if ( !file_exists($directorio)) {
			mkdir($directorio);
		}
		$filename = dirname(__FILE__).'/plantillas/formulario.php';
		$handle = fopen($filename, "r");
		$htmlStr= fread($handle, filesize($filename));
		fclose($handle);
		//------------------------------------------
		$htmlStr=$this->generarHtml( $htmlStr, $cat );
		//---------------------------------------NUEVO
		$filename = $directorio.'edicion.php';
		$handle = fopen($filename, "w");
		$htmlStr= fwrite($handle, $htmlStr, strlen($htmlStr));
		fclose($handle);
		//----------------------------------------------
		$res = $this->generarJS($cat, $rutaBase);
		
		return array(
			'success'=>true,
			'msg'=>'FormGem. Generado '
		);
	}
	function getStrRelacion($modeloObj, $el, $config){
		$campo_a_mostrar = $config['campo_a_mostrar'];
		$campo_dato = $config['campo_a_mostrar'].'_'.$modeloObj['nombre'];
		$campo=$el['campo'];
		$strRelacion='if ( !empty( $this->datos[\''.$campo.'\'] ) ){
			$'.$modeloObj['nombre'].'_listado=array();
			$'.$modeloObj['nombre'].'_listado[]=array(\''.$modeloObj['llave_primaria'].'\'=>$this->datos[\''.$el['campo'].'\'],\''.$campo_a_mostrar.'\'=>$this->datos[\''.$campo_dato.'\'] );
			$this->'.$modeloObj['nombre'].'_listado = $'.$modeloObj['nombre'].'_listado;
		}else{
			$mod=new '.$modeloObj['nombre'].'Modelo();
			$objs=$mod->buscar( array() );		
			$this->'.$modeloObj['nombre'].'_listado = $objs[\'datos\'];
		}';
		return $strRelacion;
	}
	
	function generarHtml($htmlStr, $cat){
		$tituloNuevo=$cat['titulo_nuevo'];
		$htmlStr = str_replace('<!--{TITULO-NUEVO}-->', $tituloNuevo, $htmlStr);

		$controlador=ucfirst ( $cat['controlador'] );
		$nuevaCadena = 'var editor=new Edicion'.$controlador.'();';
		$htmlStr = str_replace('var editor=new EdicionControlador();', $nuevaCadena, $htmlStr);
		
		
		//---------Consulta para obtener el elemento
		$campos='';		
		$crlf = "\r\n"; 
		$strRelaciones='';
		foreach($cat['elementos'] as $el ){
			$config=json_decode($el['comp_config'], true);				 
			
			if ( strtolower( $el['componente'] ) ==  'combo box' ){				
				
				// $campos.=$cat['modelo'].'.'.$el['campo'].', ';				
				$fk_modelo=$config['target'];				
				$modeloMod = new modelocModelo();
				$modeloObj =$modeloMod->obtener( array('id'=>$fk_modelo)  );
				
				$strRelaciones.=$crlf.$this->getStrRelacion($modeloObj, $el, $config);
				
				// $campos.=$modeloObj['nombre'].$numJoins.'.'.$config['campo_a_mostrar'].' AS '.$config['campo_a_mostrar'].'_'.$modeloObj['nombre'].', ';				
				// $joins.=$crlf.' LEFT JOIN '.$modeloObj['tabla'].' AS '.$modeloObj['nombre'].$numJoins;
				// $joins.=' ON '.$modeloObj['nombre'].$numJoins.'.'.$modeloObj['llave_primaria'].' = '.$cat['modelo'].'.'.$el['campo'];
				// $numJoins++;
				
				$clase='contenedor_'.$el['campo'];
				$campos.='
				<div class="inputBox '.$clase.'" style=""  >
					<label style="">'.$config['etiqueta'].':</label>
					<select name="'.$el['campo'].'" class="entradaDatos" style="width:250px;">
						<?php
							foreach($this->'.$modeloObj['nombre'].'_listado as $'.$modeloObj['nombre'].'){
								echo \'<option value="\'.$'.$modeloObj['nombre'].'[\''.$modeloObj['llave_primaria'].'\'].\' " >\'.$'.$modeloObj['nombre'].'[\''.$config['campo_a_mostrar'].'\'].\'</option>\';
							}
						?>
					</select>
				</div>';
			}else{
				
				$clase='contenedor_'.$el['campo'];
				$campos.='
				<div class="inputBox '.$clase.'" style=""  >
					<label style="">'.$config['etiqueta'].':</label>
					<input type="text" name="'.$el['campo'].'" class="entradaDatos" value="<?php echo $this->datos[\''.$el['campo'].'\']; ?>" style="width:500px;" />
				</div>';
			}					
		}
		
		$htmlStr = str_replace('<!-- ELEMENTOS -->', $campos, $htmlStr);
		$htmlStr = str_replace('// {RELACIONES}', $strRelaciones, $htmlStr);
		
		return $htmlStr;
	}	
}
?>