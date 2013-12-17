<?php
class GeneradorFormulario{
	
	function generarCodigoGuardarCombo( $el ){
		$config=json_decode($el['comp_config'], true);
		$fk_catalogo=$config['target'];	
				$catMod=new catalogoModelo();
				$resCat=$catMod->obtener( array('id'=>$fk_catalogo) );
				$modeloObj['nombre'] = $resCat['modelo'];
				$modeloObj['tabla'] = $resCat['tabla'];
				$modeloObj['llave_primaria'] = $resCat['pk_tabla'];
		
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
		$fk_catalogo=$config['target'];	
		$catMod=new catalogoModelo();
		$resCat=$catMod->obtener( array('id'=>$fk_catalogo) );
		$modeloObj['nombre'] = $resCat['modelo'];
		$modeloObj['tabla'] = $resCat['tabla'];
		$modeloObj['llave_primaria'] = $resCat['pk_tabla'];
		
		$nombreModelo=ucfirst($modeloObj['nombre']);
		$codigo='this.configurarCombo'.$nombreModelo.'();';
		return $codigo;
	}
	function generarCodigoCombo( $el, $cat ){
		$config=json_decode($el['comp_config'], true);
		$fk_catalogo=$config['target'];	
		$catMod=new catalogoModelo();
		$resCat=$catMod->obtener( array('id'=>$fk_catalogo) );
		$modeloObj['nombre'] = $resCat['modelo'];
		$modeloObj['tabla'] = $resCat['tabla'];
		$modeloObj['llave_primaria'] = $resCat['pk_tabla'];
				
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
			url: kore.url_base+kore.modulo+\'/'.$cat['controlador'].'/buscar'.$modelo.'\',
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
		$codigoDatosTabla='';
		$cargarTablas='';
		foreach($cat['elementos'] as $el){
			if ( strtolower( $el['componente'] ) ==  'combo box' ){
				
				$funcionesCombo.= $this->generarCodigoCombo( $el, $cat );
				$funcionesInitCombo.=$crlf.$this->generarInitCombo( $el, $cat  );
				$codigoGuardarCombo=$crlf.$this->generarCodigoGuardarCombo( $el );
			}else if ( strtolower( $el['componente'] ) ==  'tabla' ){
				$clase='tabla_'.$el['campo'];
				$instancia=$el['campo'].'De'.ucfirst($cat['nombre']);
				$codigoDatosTabla.='$(tabId+\' .'.$clase.'\').wijgrid(\'endEdit\');
				var '.$el['campo'].'=$(tabId+\' .'.$clase.'\').wijgrid(\'data\');
				datos.'.$instancia.' = '.$el['campo'].';';
				
				$cargarTablas='
				//--------------------
				var elementos=resp.datos.'.$instancia.';	

				var grid=$(me.tabId+" .tabla_'.$el['campo'].'");
				var data=grid.wijgrid(\'data\');				
				data.length=0;
				for(var i=0; i<elementos.length; i++){
					data.push(elementos[i]);
				}

				grid.wijgrid(\'ensureControl\', true);
				//-----------------------------
				';
				
			}
			
		}
		$jsStr = str_replace('//FUNCIONES-COMBO', $funcionesCombo, $jsStr);
		$jsStr = str_replace('//{INIT-COMBOS}', $funcionesInitCombo, $jsStr);
		$jsStr = str_replace('//{CODIGO-GUARDAR-COMBOS}', $codigoGuardarCombo, $jsStr);
		$jsStr = str_replace('//{GUARDAR-TABLAS}', $codigoDatosTabla, $jsStr);
		$jsStr = str_replace('//{CARGAR-TABLAS}', $cargarTablas, $jsStr);
		
		return $jsStr;
	}
	function generarJS($cat, $rutaBase){
		$directorio = $rutaBase.'presentacion/web/js/catalogos/'.$cat['controlador'].'/';
		if ( !file_exists($directorio)) {
			mkdir($directorio,'0777', true);
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
			mkdir($directorio,'0777', true);
		}
		$filename = dirname(__FILE__).'/plantillas/formulario.php';
		$handle = fopen($filename, "r");
		$htmlStr= fread($handle, filesize($filename));
		fclose($handle);
		//------------------------------------------
		$htmlStr=$this->generarHtml( $htmlStr, $cat, $rutaBase );
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
	
	function generarHtml($htmlStr, $cat, $rutaBase){
		$tituloNuevo=$cat['titulo_nuevo'];
		$htmlStr = str_replace('<!--{TITULO-NUEVO}-->', $tituloNuevo, $htmlStr);

		$controlador=ucfirst ( $cat['controlador'] );
		$nuevaCadena = 'var editor=new Edicion'.$controlador.'();';
		$htmlStr = str_replace('var editor=new EdicionControlador();', $nuevaCadena, $htmlStr);
		
		
		//---------Consulta para obtener el elemento
		$campos='';		
		$crlf = "\r\n"; 
		$strRelaciones='';
		$configComponentes='';
		$scriptsComponentes='';
		foreach($cat['elementos'] as $el ){
			$config=json_decode($el['comp_config'], true);				 
			
			if ( strtolower( $el['componente'] ) ==  'combo box' ){				
				
				$fk_catalogo=$config['target'];	
				$catMod=new catalogoModelo();
				$resCat=$catMod->obtener( array('id'=>$fk_catalogo) );
				$modeloObj['nombre'] = $resCat['modelo'];
				$modeloObj['tabla'] = $resCat['tabla'];
				$modeloObj['llave_primaria'] = $resCat['pk_tabla'];
				
				
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
			}else if ( strtolower( $el['componente'] ) ==  'tabla' ){				
				$config=json_decode($el['comp_config'], true);
				//-----
				$nombreArchivo=$el['campo'].'_de_'.$cat['nombre'];
				$nombreArchivo=strtolower($nombreArchivo);			
				$nombreClaseJs=ucfirst( strtolower( $el['campo'] ) ).'De'.ucfirst( strtolower( $cat['nombre'] ) );				
				//--------------------------------------------
				$fk_catalogo=$config['target'];				
				$catMod = new catalogoModelo();
				$catObj =$catMod->obtener( array('id'=>$fk_catalogo)  );
				//--------------------------------------------
				$directorio = $rutaBase.'presentacion/web/js/catalogos/'.$cat['controlador'].'/';
				if ( !file_exists($directorio)) {
					mkdir($directorio,'0777', true);
				}
				$filename = dirname(__FILE__).'/plantillas/elementos_de_catalogo.js';
				$handle = fopen($filename, "r");
				$jsStr= fread($handle, filesize($filename));
				fclose($handle);
				//------------------------------------------
				$jsStr = str_replace('ElementosDeCatalogo', $nombreClaseJs, $jsStr);
				$jsStr = str_replace('-dialog-confirm-eliminarConcepto', '-dialog-confirm-eliminar-'.$catObj['modelo'], $jsStr);
				$camposTabla='';
				$columnas='';
				$fields='';
				// print_r($config);
				$configTabla=json_decode( $config['config_tabla'], true );
				foreach($configTabla as $elTabla ){
					
					$elTablaConfig=json_decode( $elTabla['comp_config'], true ); 
					$fields.='
				{ name: "'.$elTabla['campo'].'"},' ;
					$visible=empty($elTablaConfig['oculto'])? 'true':'false';
					$columnas.='
				{ dataKey: "'.$elTabla['campo'].'", visible:'.$visible.', headerText: "'.$elTablaConfig['etiqueta'].'" },';
				}
				$columnas=substr($columnas,0, strlen($columnas)-1);
				$fields=substr($fields,0, strlen($fields)-1);
				$jsStr = str_replace('//{COLUMNAS}', $columnas, $jsStr);
				$jsStr = str_replace('//{FIELDS}', $fields, $jsStr);
				//---------------------------------------
				$filename = $directorio.$nombreArchivo.'.js';
				$handle = fopen($filename, "w");
				$jsStr= fwrite($handle, $jsStr, strlen($jsStr));
				fclose($handle);
				//----------------------------------------------
				
				
				$scriptsComponentes.=$crlf.'<script src="<?php echo $_PETICION->url_web; ?>js/catalogos/<?php echo $_PETICION->controlador; ?>/'.$nombreArchivo.'.js"></script>';
				
				$clase='contenedor_tabla_'.$el['campo'];
				$claseTabla='tabla_'.$el['campo'];
				
				$campos.='
				<div class="tabla '.$clase.'" style=""  >
					<div class="toolbar_detalles" style="margin-right: 44px;">
						<input type="button" value="" class="btnAgregar" id="botonAgregar"/>
						<input type="button" value="" class="btnEliminar" id="botonEliminar" />
					</div>
					<h1 style="">'.$config['titulo'].'</h1>
					<table class="'.$claseTabla.'">
						<thead></thead>
						<tbody></tbody>
					</table>
					<div id="<?php echo $id; ?>-dialog-confirm-eliminar-'.$catObj['modelo'].'" title="&iquest;Eliminar '.ucfirst($catObj['modelo']).'?">
						<p><span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0;"></span>&iquest;Eliminar '.ucfirst($catObj['modelo']).'?</p>
					</div> 
				</div>';
				
				
				
				$nombreInstancia = lcfirst ( $nombreClaseJs ); 
				
				$configComponentes.='
		var tabId=\'#\'+config.tab.id;
		config={
			padre:editor,
			tabId:\'#<?php echo $_REQUEST[\'tabId\']; ?>\',
			elementos: <?php echo json_encode($this->datos[\''.$nombreInstancia.'\']); ?>,
			target:\'.'.$claseTabla.'\',
			contenedor:\'.'.$clase.'\',
		};

		var '.$nombreInstancia.' = new '.$nombreClaseJs.'();		
		'.$nombreInstancia.'.init(config);
				';
				
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
		$htmlStr = str_replace('// {INIT-TABLAS}', $configComponentes, $htmlStr);
		$htmlStr = str_replace('<!-- {SCRIPTS_COMPONENTES} -->', $scriptsComponentes, $htmlStr);
		
		return $htmlStr;
	}	
}
?>