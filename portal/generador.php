<?php 
class GeneradorDeCodigo{
	
	function generarCodigo($catalogo_id){
		
		$catMod = new CatalogoModelo();		
		$cat = $catMod->obtener( array('id'=>$catalogo_id ) );
		$fk_modulo = $cat['fk_modulo'];
		
		// compone la ruta donde se guardaran los archivos
		$modMod = new moduloModelo();
		$modulo = $modMod->obtener( array('id'=>$fk_modulo ) );		
		$rutaBase='..'.$modulo['ruta_base'].$modulo['nombre_interno'].'/';
				
		//crea el modelo		
		$this->crearModelo($cat, $rutaBase);
		//crea el controlador
		
		//crea el formulario 
		
		//crea la busqueda 
		
	}
	function crearModelo($cat, $rutaBase){
		$directorio = $rutaBase.'modelos/';		
		if ( !file_exists($directorio)) {
			mkdir($directorio);
		}
		
		$filename = "../portal/plantillas_codigo/modelo.php";
		$handle = fopen($filename, "r");
		$modeloStr= fread($handle, filesize($filename));
		fclose($handle);
		//---------Consulta para obtener el elemento
		$campos='';
		$joins='';		
		$numJoins=0;
		$crlf = "\r\n"; 
		foreach($cat['elementos'] as $el ){
		
			if ( strtolower( $el['componente'] ) ==  'combo box' ){				
				$config=json_decode($el['comp_config'], true);				 
				$fk_modelo=$config['target'];				
				$modeloMod = new modelocModelo();
				$modeloObj =$modeloMod->obtener( array('id'=>$fk_modelo)  );
				
				$campos.=$modeloObj['nombre'].$numJoins.'.'.$config['campo_a_mostrar'].', ';				
				$joins.=$crlf.' LEFT JOIN '.$modeloObj['tabla'].' AS '.$modeloObj['nombre'].$numJoins;
				$joins.=' ON '.$modeloObj['nombre'].$numJoins.'.'.$modeloObj['llave_primaria'].' = '.$cat['modelo'].'.'.$el['campo'];
				$numJoins++;
			}else{
				$campos.=$cat['modelo'].'.'.$el['campo'].', ';
			}					
		}		
		
		$campos = substr($campos, 0, strlen($campos)-2);
		$filtros=' WHERE '.$cat['modelo'].'.{CAMPOLLAVE}=:{CAMPOLLAVE}';
		
		
		$sql='SELECT '.$campos.$crlf.
		' FROM '.$cat['tabla'].' AS '.$cat['modelo'].
		$joins.
		$crlf.' '.$filtros;
		$modeloStr = str_replace('{SQL-obtener}', $sql, $modeloStr);
		
		$filtroObtener=' $sth->BindValue(\':{CAMPOLLAVE}\',$llave ); ';
		$modeloStr = str_replace('//{FILTRO-OBTENER}', $filtroObtener, $modeloStr);
		
		$nombreModelo = $cat['modelo'].'Modelo';
		$modeloStr = str_replace('class PlantillaModelo', 'class '.$nombreModelo, $modeloStr);
		//-----------------------------------------------------------------
		// GUARDAR
		$codigoCampos = '';
		$codigoBindCampos='';
		foreach($cat['elementos'] as $el ){
			if ($el['llave']=='PRI' ) {
				
				$modeloStr = str_replace('{CAMPOLLAVE}', $el['campo'], $modeloStr);	
				continue;
			}
			$codigoCampos .=' 
		if ( isset( $datos[\''.$el['campo'].'\'] ) ){
			$strCampos = \' '.$el['campo'].'=:'.$el['campo'].', \';
		}
';
			$codigoBindCampos.='
		if  ( isset( $datos[\''.$el['campo'].'\'] ) ){
			$sth->bindValue(\':'.$el['campo'].'\', $datos[\''.$el['campo'].'\'] );
		}
';
			
		}
		
		$modeloStr = str_replace('//{guardar()-codigoCampos}', $codigoCampos, $modeloStr);	
		$modeloStr = str_replace('//{guardar()-codigoBindCampos}', $codigoBindCampos, $modeloStr);	
		
		
		//---------------------------------------------------------------------
		$directorio = $rutaBase.'modelos/';		
		if ( !file_exists($directorio)) {
			mkdir($directorio);
		}
		
		$filename = $directorio.$cat['modelo'].'.php';
		$handle = fopen($filename, "w");
		$modeloStr= fwrite($handle, $modeloStr, strlen($modeloStr));
		fclose($handle);
		return array(
			'success'=>false,
			'msg'=>'En Construccion '
		);
	}
	
}
?>