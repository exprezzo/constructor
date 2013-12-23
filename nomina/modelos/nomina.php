<?php
require_once '../php_libs/tcpdf/tcpdf.php';
require_once $_PETICION->basePath.'/presentacion/html.php/nominas/nomina_pdf.php';
class nominaModelo extends Modelo{	
	var $tabla='nomina_nomina';
	var $pk='id';
	var $campos= array('id', 'fk_patron', 'razon_social_empresa', 'fk_empleado', 'nombre_trabajador', 'fk_serie', 'serie_serie_nomina', 'serie', 'folio', 'Version', 'RegistroPatronal', 'NumEmpleado', 'CURP', 'fk_TipoRegimen', 'nombre_regimen_contratacion', 'TipoRegimen', 'NumSeguridadSocial', 'FechaPago', 'FechaInicialPago', 'FechaFinalPago', 'NumDiasPagados', 'fk_Departamento', 'nombre_departamento', 'Departamento', 'CLABE', 'Banco', 'FechaInicioRelLaboral', 'Antiguedad', 'Puesto', 'TipoContrato', 'nombre_regimen_contratacion', 'TipoJornada', 'nombre_jornada', 'PeriodicidadPago', 'descripcion_periodo_pago', 'SalarioBaseCotApor', 'RiesgoPuesto', 'SalarioDiarioIntegrado', 'fk_banco', 'nombre_corto_banco', 'fk_RiesgoPuesto', 'descripcion_riesgo', 'percepcionesTotalGravado', 'percepcionesTotalExcento', 'deduccionesTotalGravado', 'deduccionesTotalExcento');
	
	function generaPdf( $datos ){
		$nominaPdf = new NominaPdf('P','mm','letter');
		$nominaPdf->datos=$datos;
		$nominaPdf->AddPage();
		$nominaPdf->imprimir(  );
		$path='../nomina/archivos/';
		$nombreArchivo=$nominaPdf->titulo.'_'.$datos['id'];
			
		//http://stackoverflow.com/questions/2021624/string-sanitizer-for-filename
		// $nombreArchivo = preg_replace("([^\w\s\d\-_~,;:\[\]\(\]]|[\.]{2,})", '', $nombreArchivo);
		// $nombreArchivo=preg_replace("[^\w\s\d\.\-_~,;:\[\]\(\]]", '', $nombreArchivo);
		$nombreArchivo = preg_replace('/[^a-zA-Z0-9-_\.]/','_', $nombreArchivo);
		$fullPath=$path.$nombreArchivo.'.pdf';
		$nominaStr=$nominaPdf->Output($fullPath, 'F');
		// echo $fullPath; exit;
		// echo $nominaStr; exit;
	}
	
	function buscar($params){
		
		$pdo = $this->getConexion();
		$filtros='';
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				 
				if ( $filtro['dataKey']=='id' ) {
					$filtros .= ' nomina.id like :id OR ';
				} 
				if ( $filtro['dataKey']=='fk_patron' ) {
					$filtros .= ' nomina.fk_patron like :fk_patron OR ';
				} 
				if ( $filtro['dataKey']=='razon_social_empresa' ) {
					$filtros .= ' empresa0.razon_social like :razon_social_empresa OR ';
				} 
				if ( $filtro['dataKey']=='fk_empleado' ) {
					$filtros .= ' nomina.fk_empleado like :fk_empleado OR ';
				} 
				if ( $filtro['dataKey']=='nombre_trabajador' ) {
					$filtros .= ' trabajador1.nombre like :nombre_trabajador OR ';
				} 
				if ( $filtro['dataKey']=='fk_serie' ) {
					$filtros .= ' nomina.fk_serie like :fk_serie OR ';
				} 
				if ( $filtro['dataKey']=='serie_serie_nomina' ) {
					$filtros .= ' serie_nomina2.serie like :serie_serie_nomina OR ';
				} 
				if ( $filtro['dataKey']=='serie' ) {
					$filtros .= ' nomina.serie like :serie OR ';
				} 
				if ( $filtro['dataKey']=='folio' ) {
					$filtros .= ' nomina.folio like :folio OR ';
				} 
				if ( $filtro['dataKey']=='Version' ) {
					$filtros .= ' nomina.Version like :Version OR ';
				} 
				if ( $filtro['dataKey']=='RegistroPatronal' ) {
					$filtros .= ' nomina.RegistroPatronal like :RegistroPatronal OR ';
				} 
				if ( $filtro['dataKey']=='NumEmpleado' ) {
					$filtros .= ' nomina.NumEmpleado like :NumEmpleado OR ';
				} 
				if ( $filtro['dataKey']=='CURP' ) {
					$filtros .= ' nomina.CURP like :CURP OR ';
				} 
				if ( $filtro['dataKey']=='fk_TipoRegimen' ) {
					$filtros .= ' nomina.fk_TipoRegimen like :fk_TipoRegimen OR ';
				} 
				if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
					$filtros .= ' regimen_contratacion3.nombre like :nombre_regimen_contratacion OR ';
				} 
				if ( $filtro['dataKey']=='TipoRegimen' ) {
					$filtros .= ' nomina.TipoRegimen like :TipoRegimen OR ';
				} 
				if ( $filtro['dataKey']=='NumSeguridadSocial' ) {
					$filtros .= ' nomina.NumSeguridadSocial like :NumSeguridadSocial OR ';
				} 
				if ( $filtro['dataKey']=='FechaPago' ) {
					$filtros .= ' nomina.FechaPago like :FechaPago OR ';
				} 
				if ( $filtro['dataKey']=='FechaInicialPago' ) {
					$filtros .= ' nomina.FechaInicialPago like :FechaInicialPago OR ';
				} 
				if ( $filtro['dataKey']=='FechaFinalPago' ) {
					$filtros .= ' nomina.FechaFinalPago like :FechaFinalPago OR ';
				} 
				if ( $filtro['dataKey']=='NumDiasPagados' ) {
					$filtros .= ' nomina.NumDiasPagados like :NumDiasPagados OR ';
				} 
				if ( $filtro['dataKey']=='fk_Departamento' ) {
					$filtros .= ' nomina.fk_Departamento like :fk_Departamento OR ';
				} 
				if ( $filtro['dataKey']=='nombre_departamento' ) {
					$filtros .= ' departamento4.nombre like :nombre_departamento OR ';
				} 
				if ( $filtro['dataKey']=='Departamento' ) {
					$filtros .= ' nomina.Departamento like :Departamento OR ';
				} 
				if ( $filtro['dataKey']=='CLABE' ) {
					$filtros .= ' nomina.CLABE like :CLABE OR ';
				} 
				if ( $filtro['dataKey']=='Banco' ) {
					$filtros .= ' nomina.Banco like :Banco OR ';
				} 
				if ( $filtro['dataKey']=='FechaInicioRelLaboral' ) {
					$filtros .= ' nomina.FechaInicioRelLaboral like :FechaInicioRelLaboral OR ';
				} 
				if ( $filtro['dataKey']=='Antiguedad' ) {
					$filtros .= ' nomina.Antiguedad like :Antiguedad OR ';
				} 
				if ( $filtro['dataKey']=='Puesto' ) {
					$filtros .= ' nomina.Puesto like :Puesto OR ';
				} 
				if ( $filtro['dataKey']=='TipoContrato' ) {
					$filtros .= ' nomina.TipoContrato like :TipoContrato OR ';
				} 
				if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
					$filtros .= ' regimen_contratacion5.nombre like :nombre_regimen_contratacion OR ';
				} 
				if ( $filtro['dataKey']=='TipoJornada' ) {
					$filtros .= ' nomina.TipoJornada like :TipoJornada OR ';
				} 
				if ( $filtro['dataKey']=='nombre_jornada' ) {
					$filtros .= ' jornada6.nombre like :nombre_jornada OR ';
				} 
				if ( $filtro['dataKey']=='PeriodicidadPago' ) {
					$filtros .= ' nomina.PeriodicidadPago like :PeriodicidadPago OR ';
				} 
				if ( $filtro['dataKey']=='descripcion_periodo_pago' ) {
					$filtros .= ' periodo_pago7.descripcion like :descripcion_periodo_pago OR ';
				} 
				if ( $filtro['dataKey']=='SalarioBaseCotApor' ) {
					$filtros .= ' nomina.SalarioBaseCotApor like :SalarioBaseCotApor OR ';
				} 
				if ( $filtro['dataKey']=='RiesgoPuesto' ) {
					$filtros .= ' nomina.RiesgoPuesto like :RiesgoPuesto OR ';
				} 
				if ( $filtro['dataKey']=='SalarioDiarioIntegrado' ) {
					$filtros .= ' nomina.SalarioDiarioIntegrado like :SalarioDiarioIntegrado OR ';
				} 
				if ( $filtro['dataKey']=='fk_banco' ) {
					$filtros .= ' nomina.fk_banco like :fk_banco OR ';
				} 
				if ( $filtro['dataKey']=='nombre_corto_banco' ) {
					$filtros .= ' banco8.nombre_corto like :nombre_corto_banco OR ';
				} 
				if ( $filtro['dataKey']=='fk_RiesgoPuesto' ) {
					$filtros .= ' nomina.fk_RiesgoPuesto like :fk_RiesgoPuesto OR ';
				} 
				if ( $filtro['dataKey']=='descripcion_riesgo' ) {
					$filtros .= ' riesgo9.descripcion like :descripcion_riesgo OR ';
				} 
				if ( $filtro['dataKey']=='percepcionesTotalGravado' ) {
					$filtros .= ' nomina.percepcionesTotalGravado like :percepcionesTotalGravado OR ';
				} 
				if ( $filtro['dataKey']=='percepcionesTotalExcento' ) {
					$filtros .= ' nomina.percepcionesTotalExcento like :percepcionesTotalExcento OR ';
				} 
				if ( $filtro['dataKey']=='deduccionesTotalGravado' ) {
					$filtros .= ' nomina.deduccionesTotalGravado like :deduccionesTotalGravado OR ';
				} 
				if ( $filtro['dataKey']=='deduccionesTotalExcento' ) {
					$filtros .= ' nomina.deduccionesTotalExcento like :deduccionesTotalExcento OR ';
				}			
			}
			$filtros=substr( $filtros,0,  strlen($filtros)-3 );
			if ( !empty($filtros) ){
				$filtros=' WHERE '.$filtros;
			}
		}
		
		
		$joins='
 LEFT JOIN facturacion_razones_sociales AS empresa0 ON empresa0.id = nomina.fk_patron
 LEFT JOIN nomina_trabajador AS trabajador1 ON trabajador1.id = nomina.fk_empleado
 LEFT JOIN nomina_series AS serie_nomina2 ON serie_nomina2.id = nomina.fk_serie
 LEFT JOIN nomina_regimen_contratacion AS regimen_contratacion3 ON regimen_contratacion3.id = nomina.fk_TipoRegimen
 LEFT JOIN nomina_departamento AS departamento4 ON departamento4.id = nomina.fk_Departamento
 LEFT JOIN nomina_regimen_contratacion AS regimen_contratacion5 ON regimen_contratacion5.id = nomina.TipoContrato
 LEFT JOIN nomina_jornada AS jornada6 ON jornada6.id = nomina.TipoJornada
 LEFT JOIN nomina_periodicidad_pago AS periodo_pago7 ON periodo_pago7.id = nomina.PeriodicidadPago
 LEFT JOIN nomina_bancos AS banco8 ON banco8.id = nomina.fk_banco
 LEFT JOIN nomina_riesgo_puesto AS riesgo9 ON riesgo9.id = nomina.fk_RiesgoPuesto';
						
		$sql = 'SELECT COUNT(*) as total FROM '.$this->tabla.' nomina '.$joins.$filtros;				
		$sth = $pdo->prepare($sql);		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_patron' ) {
				$sth->bindValue(':fk_patron','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='razon_social_empresa' ) {
				$sth->bindValue(':razon_social_empresa', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_empleado' ) {
				$sth->bindValue(':fk_empleado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_trabajador' ) {
				$sth->bindValue(':nombre_trabajador', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_serie' ) {
				$sth->bindValue(':fk_serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='serie_serie_nomina' ) {
				$sth->bindValue(':serie_serie_nomina', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='serie' ) {
				$sth->bindValue(':serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio' ) {
				$sth->bindValue(':folio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Version' ) {
				$sth->bindValue(':Version','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='RegistroPatronal' ) {
				$sth->bindValue(':RegistroPatronal','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumEmpleado' ) {
				$sth->bindValue(':NumEmpleado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='CURP' ) {
				$sth->bindValue(':CURP','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_TipoRegimen' ) {
				$sth->bindValue(':fk_TipoRegimen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
				$sth->bindValue(':nombre_regimen_contratacion', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='TipoRegimen' ) {
				$sth->bindValue(':TipoRegimen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumSeguridadSocial' ) {
				$sth->bindValue(':NumSeguridadSocial','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaPago' ) {
				$sth->bindValue(':FechaPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaInicialPago' ) {
				$sth->bindValue(':FechaInicialPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaFinalPago' ) {
				$sth->bindValue(':FechaFinalPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumDiasPagados' ) {
				$sth->bindValue(':NumDiasPagados','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_Departamento' ) {
				$sth->bindValue(':fk_Departamento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_departamento' ) {
				$sth->bindValue(':nombre_departamento', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Departamento' ) {
				$sth->bindValue(':Departamento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='CLABE' ) {
				$sth->bindValue(':CLABE','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Banco' ) {
				$sth->bindValue(':Banco','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaInicioRelLaboral' ) {
				$sth->bindValue(':FechaInicioRelLaboral','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Antiguedad' ) {
				$sth->bindValue(':Antiguedad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Puesto' ) {
				$sth->bindValue(':Puesto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='TipoContrato' ) {
				$sth->bindValue(':TipoContrato','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
				$sth->bindValue(':nombre_regimen_contratacion', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='TipoJornada' ) {
				$sth->bindValue(':TipoJornada','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_jornada' ) {
				$sth->bindValue(':nombre_jornada', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='PeriodicidadPago' ) {
				$sth->bindValue(':PeriodicidadPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion_periodo_pago' ) {
				$sth->bindValue(':descripcion_periodo_pago', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='SalarioBaseCotApor' ) {
				$sth->bindValue(':SalarioBaseCotApor','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='RiesgoPuesto' ) {
				$sth->bindValue(':RiesgoPuesto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='SalarioDiarioIntegrado' ) {
				$sth->bindValue(':SalarioDiarioIntegrado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_banco' ) {
				$sth->bindValue(':fk_banco','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_corto_banco' ) {
				$sth->bindValue(':nombre_corto_banco', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_RiesgoPuesto' ) {
				$sth->bindValue(':fk_RiesgoPuesto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion_riesgo' ) {
				$sth->bindValue(':descripcion_riesgo', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='percepcionesTotalGravado' ) {
				$sth->bindValue(':percepcionesTotalGravado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='percepcionesTotalExcento' ) {
				$sth->bindValue(':percepcionesTotalExcento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='deduccionesTotalGravado' ) {
				$sth->bindValue(':deduccionesTotalGravado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='deduccionesTotalExcento' ) {
				$sth->bindValue(':deduccionesTotalExcento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}		
			}
		}
		$exito = $sth->execute();		
		if ( !$exito ){
			$error = $this->getError( $sth );
			throw new Exception($error['msg']); //TODO: agregar numero de error, crear una exception MiEscepcion
		}
		
		$tot = $sth->fetchAll(PDO::FETCH_ASSOC);
		$total = $tot[0]['total'];
		
		$paginar=false;
		if ( isset($params['limit']) && isset($params['start']) ){
			$paginar=true;
		}
		
		if ($paginar){
			$limit=$params['limit'];
			$start=$params['start'];
			$sql = 'SELECT nomina.id, nomina.fk_patron, empresa0.razon_social AS razon_social_fk_patron, nomina.fk_empleado, trabajador1.nombre AS nombre_fk_empleado, nomina.fk_serie, serie_nomina2.serie AS serie_fk_serie, nomina.serie, nomina.folio, nomina.Version, nomina.RegistroPatronal, nomina.NumEmpleado, nomina.CURP, nomina.fk_TipoRegimen, regimen_contratacion3.nombre AS nombre_fk_TipoRegimen, nomina.TipoRegimen, nomina.NumSeguridadSocial, nomina.FechaPago, nomina.FechaInicialPago, nomina.FechaFinalPago, nomina.NumDiasPagados, nomina.fk_Departamento, departamento4.nombre AS nombre_fk_Departamento, nomina.Departamento, nomina.CLABE, nomina.Banco, nomina.FechaInicioRelLaboral, nomina.Antiguedad, nomina.Puesto, nomina.TipoContrato, regimen_contratacion5.nombre AS nombre_TipoContrato, nomina.TipoJornada, jornada6.nombre AS nombre_TipoJornada, nomina.PeriodicidadPago, periodo_pago7.descripcion AS descripcion_PeriodicidadPago, nomina.SalarioBaseCotApor, nomina.RiesgoPuesto, nomina.SalarioDiarioIntegrado, nomina.fk_banco, banco8.nombre_corto AS nombre_corto_fk_banco, nomina.fk_RiesgoPuesto, riesgo9.descripcion AS descripcion_fk_RiesgoPuesto, nomina.percepcionesTotalGravado, nomina.percepcionesTotalExcento, nomina.deduccionesTotalGravado, nomina.deduccionesTotalExcento FROM '.$this->tabla.' nomina '.$joins.$filtros.' limit :start,:limit';
		}else{
			$sql = 'SELECT nomina.id, nomina.fk_patron, empresa0.razon_social AS razon_social_fk_patron, nomina.fk_empleado, trabajador1.nombre AS nombre_fk_empleado, nomina.fk_serie, serie_nomina2.serie AS serie_fk_serie, nomina.serie, nomina.folio, nomina.Version, nomina.RegistroPatronal, nomina.NumEmpleado, nomina.CURP, nomina.fk_TipoRegimen, regimen_contratacion3.nombre AS nombre_fk_TipoRegimen, nomina.TipoRegimen, nomina.NumSeguridadSocial, nomina.FechaPago, nomina.FechaInicialPago, nomina.FechaFinalPago, nomina.NumDiasPagados, nomina.fk_Departamento, departamento4.nombre AS nombre_fk_Departamento, nomina.Departamento, nomina.CLABE, nomina.Banco, nomina.FechaInicioRelLaboral, nomina.Antiguedad, nomina.Puesto, nomina.TipoContrato, regimen_contratacion5.nombre AS nombre_TipoContrato, nomina.TipoJornada, jornada6.nombre AS nombre_TipoJornada, nomina.PeriodicidadPago, periodo_pago7.descripcion AS descripcion_PeriodicidadPago, nomina.SalarioBaseCotApor, nomina.RiesgoPuesto, nomina.SalarioDiarioIntegrado, nomina.fk_banco, banco8.nombre_corto AS nombre_corto_fk_banco, nomina.fk_RiesgoPuesto, riesgo9.descripcion AS descripcion_fk_RiesgoPuesto, nomina.percepcionesTotalGravado, nomina.percepcionesTotalExcento, nomina.deduccionesTotalGravado, nomina.deduccionesTotalExcento FROM '.$this->tabla.' nomina '.$joins.$filtros;
		}
				
		$sth = $pdo->prepare($sql);
		if ($paginar){
			$sth->bindValue(':limit',$limit,PDO::PARAM_INT);
			$sth->bindValue(':start',$start,PDO::PARAM_INT);
		}
		
		if ( !empty($params['filtros']) ){
			foreach($params['filtros'] as $filtro){
				
			if ( $filtro['dataKey']=='id' ) {
				$sth->bindValue(':id','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_patron' ) {
				$sth->bindValue(':fk_patron','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='razon_social_empresa' ) {
				$sth->bindValue(':razon_social_empresa', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_empleado' ) {
				$sth->bindValue(':fk_empleado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_trabajador' ) {
				$sth->bindValue(':nombre_trabajador', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_serie' ) {
				$sth->bindValue(':fk_serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='serie_serie_nomina' ) {
				$sth->bindValue(':serie_serie_nomina', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='serie' ) {
				$sth->bindValue(':serie','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='folio' ) {
				$sth->bindValue(':folio','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Version' ) {
				$sth->bindValue(':Version','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='RegistroPatronal' ) {
				$sth->bindValue(':RegistroPatronal','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumEmpleado' ) {
				$sth->bindValue(':NumEmpleado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='CURP' ) {
				$sth->bindValue(':CURP','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_TipoRegimen' ) {
				$sth->bindValue(':fk_TipoRegimen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
				$sth->bindValue(':nombre_regimen_contratacion', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='TipoRegimen' ) {
				$sth->bindValue(':TipoRegimen','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumSeguridadSocial' ) {
				$sth->bindValue(':NumSeguridadSocial','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaPago' ) {
				$sth->bindValue(':FechaPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaInicialPago' ) {
				$sth->bindValue(':FechaInicialPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaFinalPago' ) {
				$sth->bindValue(':FechaFinalPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='NumDiasPagados' ) {
				$sth->bindValue(':NumDiasPagados','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_Departamento' ) {
				$sth->bindValue(':fk_Departamento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_departamento' ) {
				$sth->bindValue(':nombre_departamento', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Departamento' ) {
				$sth->bindValue(':Departamento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='CLABE' ) {
				$sth->bindValue(':CLABE','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Banco' ) {
				$sth->bindValue(':Banco','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='FechaInicioRelLaboral' ) {
				$sth->bindValue(':FechaInicioRelLaboral','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Antiguedad' ) {
				$sth->bindValue(':Antiguedad','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='Puesto' ) {
				$sth->bindValue(':Puesto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='TipoContrato' ) {
				$sth->bindValue(':TipoContrato','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_regimen_contratacion' ) {
				$sth->bindValue(':nombre_regimen_contratacion', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='TipoJornada' ) {
				$sth->bindValue(':TipoJornada','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_jornada' ) {
				$sth->bindValue(':nombre_jornada', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='PeriodicidadPago' ) {
				$sth->bindValue(':PeriodicidadPago','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion_periodo_pago' ) {
				$sth->bindValue(':descripcion_periodo_pago', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='SalarioBaseCotApor' ) {
				$sth->bindValue(':SalarioBaseCotApor','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='RiesgoPuesto' ) {
				$sth->bindValue(':RiesgoPuesto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='SalarioDiarioIntegrado' ) {
				$sth->bindValue(':SalarioDiarioIntegrado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_banco' ) {
				$sth->bindValue(':fk_banco','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='nombre_corto_banco' ) {
				$sth->bindValue(':nombre_corto_banco', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='fk_RiesgoPuesto' ) {
				$sth->bindValue(':fk_RiesgoPuesto','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='descripcion_riesgo' ) {
				$sth->bindValue(':descripcion_riesgo', '%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='percepcionesTotalGravado' ) {
				$sth->bindValue(':percepcionesTotalGravado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='percepcionesTotalExcento' ) {
				$sth->bindValue(':percepcionesTotalExcento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='deduccionesTotalGravado' ) {
				$sth->bindValue(':deduccionesTotalGravado','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}
			if ( $filtro['dataKey']=='deduccionesTotalExcento' ) {
				$sth->bindValue(':deduccionesTotalExcento','%'.$filtro['filterValue'].'%', PDO::PARAM_STR );
			}	
			}
		}
		$exito = $sth->execute();

		
		if ( !$exito ){		
			$error = $this->getError( $sth );
			throw new Exception($error['msg']); //TODO: agregar numero de error, crear una exception MiEscepcion			
		}
		
		$modelos = $sth->fetchAll(PDO::FETCH_ASSOC);				
		
		return array(
			'success'=>true,
			'total'=>$total,
			'datos'=>$modelos
		);
	}
	
	function nuevo( $params ){
		$obj=array();
		
			$obj['id']='';
			$obj['fk_patron']='';
			$obj['razon_social_empresa']='';
			$obj['fk_empleado']='';
			$obj['nombre_trabajador']='';
			$obj['fk_serie']='';
			$obj['serie_serie_nomina']='';
			$obj['serie']='';
			$obj['folio']='';
			$obj['Version']='';
			$obj['RegistroPatronal']='';
			$obj['NumEmpleado']='';
			$obj['CURP']='';
			$obj['fk_TipoRegimen']='';
			$obj['nombre_regimen_contratacion']='';
			$obj['TipoRegimen']='';
			$obj['NumSeguridadSocial']='';
			$obj['FechaPago']='';
			$obj['FechaInicialPago']='';
			$obj['FechaFinalPago']='';
			$obj['NumDiasPagados']='';
			$obj['fk_Departamento']='';
			$obj['nombre_departamento']='';
			$obj['Departamento']='';
			$obj['CLABE']='';
			$obj['Banco']='';
			$obj['FechaInicioRelLaboral']='';
			$obj['Antiguedad']='';
			$obj['Puesto']='';
			$obj['TipoContrato']='';
			$obj['nombre_regimen_contratacion']='';
			$obj['TipoJornada']='';
			$obj['nombre_jornada']='';
			$obj['PeriodicidadPago']='';
			$obj['descripcion_periodo_pago']='';
			$obj['SalarioBaseCotApor']='';
			$obj['RiesgoPuesto']='';
			$obj['SalarioDiarioIntegrado']='';
			$obj['fk_banco']='';
			$obj['nombre_corto_banco']='';
			$obj['fk_RiesgoPuesto']='';
			$obj['descripcion_riesgo']='';
			$obj['percepcionesTotalGravado']='';
			$obj['percepcionesTotalExcento']='';
			$obj['deduccionesTotalGravado']='';
			$obj['deduccionesTotalExcento']='';
			$obj['percepcionesDeNomina']=array();
			
			$obj['deduccionesDeNomina']=array();
			
			$obj['incapacidadesDeNomina']=array();
			
			$obj['horas_extraDeNomina']=array();
			
		return $obj;
	}
	function obtener( $llave ){		
		$sql = 'SELECT nomina.id, nomina.fk_patron, empresa0.razon_social AS razon_social_fk_patron, nomina.fk_empleado, trabajador1.nombre AS nombre_fk_empleado, nomina.fk_serie, serie_nomina2.serie AS serie_fk_serie, nomina.serie, nomina.folio, nomina.Version, nomina.RegistroPatronal, nomina.NumEmpleado, nomina.CURP, nomina.fk_TipoRegimen, regimen_contratacion3.nombre AS nombre_fk_TipoRegimen, nomina.TipoRegimen, nomina.NumSeguridadSocial, nomina.FechaPago, nomina.FechaInicialPago, nomina.FechaFinalPago, nomina.NumDiasPagados, nomina.fk_Departamento, departamento4.nombre AS nombre_fk_Departamento, nomina.Departamento, nomina.CLABE, nomina.Banco, nomina.FechaInicioRelLaboral, nomina.Antiguedad, nomina.Puesto, nomina.TipoContrato, regimen_contratacion5.nombre AS nombre_TipoContrato, nomina.TipoJornada, jornada6.nombre AS nombre_TipoJornada, nomina.PeriodicidadPago, periodo_pago7.descripcion AS descripcion_PeriodicidadPago, nomina.SalarioBaseCotApor, nomina.RiesgoPuesto, nomina.SalarioDiarioIntegrado, nomina.fk_banco, banco8.nombre_corto AS nombre_corto_fk_banco, nomina.fk_RiesgoPuesto, riesgo9.descripcion AS descripcion_fk_RiesgoPuesto, nomina.percepcionesTotalGravado, nomina.percepcionesTotalExcento, nomina.deduccionesTotalGravado, nomina.deduccionesTotalExcento
 FROM nomina_nomina AS nomina
 LEFT JOIN facturacion_razones_sociales AS empresa0 ON empresa0.id = nomina.fk_patron
 LEFT JOIN nomina_trabajador AS trabajador1 ON trabajador1.id = nomina.fk_empleado
 LEFT JOIN nomina_series AS serie_nomina2 ON serie_nomina2.id = nomina.fk_serie
 LEFT JOIN nomina_regimen_contratacion AS regimen_contratacion3 ON regimen_contratacion3.id = nomina.fk_TipoRegimen
 LEFT JOIN nomina_departamento AS departamento4 ON departamento4.id = nomina.fk_Departamento
 LEFT JOIN nomina_regimen_contratacion AS regimen_contratacion5 ON regimen_contratacion5.id = nomina.TipoContrato
 LEFT JOIN nomina_jornada AS jornada6 ON jornada6.id = nomina.TipoJornada
 LEFT JOIN nomina_periodicidad_pago AS periodo_pago7 ON periodo_pago7.id = nomina.PeriodicidadPago
 LEFT JOIN nomina_bancos AS banco8 ON banco8.id = nomina.fk_banco
 LEFT JOIN nomina_riesgo_puesto AS riesgo9 ON riesgo9.id = nomina.fk_RiesgoPuesto
  WHERE nomina.id=:id';
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		 $sth->BindValue(':id',$llave ); 
		$exito = $sth->execute();
		if ( !$exito ){
			$error =  $this->getError( $sth );
			throw new Exception($error['msg']);
		}
		
		$modelos = $sth->fetchAll(PDO::FETCH_ASSOC);
		
		if ( empty($modelos) ){						
			throw new Exception("Elemento no encontrado");
		}
		
		if ( sizeof($modelos) > 1 ){			
			throw new Exception("El identificador est� duplicado"); //TODO: agregar numero de error, crear una exception MiEscepcion
		}
		
				//----------------------------
				$conceptosMod=new percepcion_nominaModelo();
				$params=array(
					'filtros'=>array(
						array(
							'filterValue'=>$modelos[0]['id'],
							'filterOperator'=>'equals',
							'dataKey'=>'fk_nomina'
						)
					)
				);
				$percepcionesDeNomina=$conceptosMod->buscar($params);				
				$modelos[0]['percepcionesDeNomina'] =$percepcionesDeNomina['datos'];
				//---------------------------
				
				//----------------------------
				$conceptosMod=new deduccion_nominaModelo();
				$params=array(
					'filtros'=>array(
						array(
							'filterValue'=>$modelos[0]['id'],
							'filterOperator'=>'equals',
							'dataKey'=>'fk_nomina'
						)
					)
				);
				$deduccionesDeNomina=$conceptosMod->buscar($params);				
				$modelos[0]['deduccionesDeNomina'] =$deduccionesDeNomina['datos'];
				//---------------------------
				
				//----------------------------
				$conceptosMod=new incapacidadModelo();
				$params=array(
					'filtros'=>array(
						array(
							'filterValue'=>$modelos[0]['id'],
							'filterOperator'=>'equals',
							'dataKey'=>'fk_nomina'
						)
					)
				);
				$incapacidadesDeNomina=$conceptosMod->buscar($params);				
				$modelos[0]['incapacidadesDeNomina'] =$incapacidadesDeNomina['datos'];
				//---------------------------
				
				//----------------------------
				$conceptosMod=new hora_extra_nominaModelo();
				$params=array(
					'filtros'=>array(
						array(
							'filterValue'=>$modelos[0]['id'],
							'filterOperator'=>'equals',
							'dataKey'=>'fk_nomina'
						)
					)
				);
				$horas_extraDeNomina=$conceptosMod->buscar($params);				
				$modelos[0]['horas_extraDeNomina'] =$horas_extraDeNomina['datos'];
				//---------------------------
				
		return $modelos[0];			
	}
	
	
	
	function guardar( $datos ){
	
		$esNuevo=( empty( $datos['id'] ) )? true : false;			
		$strCampos='';
		
		//--------------------------------------------
		// CAMPOS A GUARDAR
		 
		if ( isset( $datos['fk_patron'] ) ){
			$strCampos .= ' fk_patron=:fk_patron, ';
		} 
		if ( isset( $datos['fk_empleado'] ) ){
			$strCampos .= ' fk_empleado=:fk_empleado, ';
		} 
		if ( isset( $datos['fk_serie'] ) ){
			$strCampos .= ' fk_serie=:fk_serie, ';
		} 
		if ( isset( $datos['serie'] ) ){
			$strCampos .= ' serie=:serie, ';
		} 
		if ( isset( $datos['folio'] ) ){
			$strCampos .= ' folio=:folio, ';
		} 
		if ( isset( $datos['Version'] ) ){
			$strCampos .= ' Version=:Version, ';
		} 
		if ( isset( $datos['RegistroPatronal'] ) ){
			$strCampos .= ' RegistroPatronal=:RegistroPatronal, ';
		} 
		if ( isset( $datos['NumEmpleado'] ) ){
			$strCampos .= ' NumEmpleado=:NumEmpleado, ';
		} 
		if ( isset( $datos['CURP'] ) ){
			$strCampos .= ' CURP=:CURP, ';
		} 
		if ( isset( $datos['fk_TipoRegimen'] ) ){
			$strCampos .= ' fk_TipoRegimen=:fk_TipoRegimen, ';
		} 
		if ( isset( $datos['TipoRegimen'] ) ){
			$strCampos .= ' TipoRegimen=:TipoRegimen, ';
		} 
		if ( isset( $datos['NumSeguridadSocial'] ) ){
			$strCampos .= ' NumSeguridadSocial=:NumSeguridadSocial, ';
		} 
		if ( isset( $datos['FechaPago'] ) ){
			$strCampos .= ' FechaPago=:FechaPago, ';
		} 
		if ( isset( $datos['FechaInicialPago'] ) ){
			$strCampos .= ' FechaInicialPago=:FechaInicialPago, ';
		} 
		if ( isset( $datos['FechaFinalPago'] ) ){
			$strCampos .= ' FechaFinalPago=:FechaFinalPago, ';
		} 
		if ( isset( $datos['NumDiasPagados'] ) ){
			$strCampos .= ' NumDiasPagados=:NumDiasPagados, ';
		} 
		if ( isset( $datos['fk_Departamento'] ) ){
			$strCampos .= ' fk_Departamento=:fk_Departamento, ';
		} 
		if ( isset( $datos['Departamento'] ) ){
			$strCampos .= ' Departamento=:Departamento, ';
		} 
		if ( isset( $datos['CLABE'] ) ){
			$strCampos .= ' CLABE=:CLABE, ';
		} 
		if ( isset( $datos['Banco'] ) ){
			$strCampos .= ' Banco=:Banco, ';
		} 
		if ( isset( $datos['FechaInicioRelLaboral'] ) ){
			$strCampos .= ' FechaInicioRelLaboral=:FechaInicioRelLaboral, ';
		} 
		if ( isset( $datos['Antiguedad'] ) ){
			$strCampos .= ' Antiguedad=:Antiguedad, ';
		} 
		if ( isset( $datos['Puesto'] ) ){
			$strCampos .= ' Puesto=:Puesto, ';
		} 
		if ( isset( $datos['TipoContrato'] ) ){
			$strCampos .= ' TipoContrato=:TipoContrato, ';
		} 
		if ( isset( $datos['TipoJornada'] ) ){
			$strCampos .= ' TipoJornada=:TipoJornada, ';
		} 
		if ( isset( $datos['PeriodicidadPago'] ) ){
			$strCampos .= ' PeriodicidadPago=:PeriodicidadPago, ';
		} 
		if ( isset( $datos['SalarioBaseCotApor'] ) ){
			$strCampos .= ' SalarioBaseCotApor=:SalarioBaseCotApor, ';
		} 
		if ( isset( $datos['RiesgoPuesto'] ) ){
			$strCampos .= ' RiesgoPuesto=:RiesgoPuesto, ';
		} 
		if ( isset( $datos['SalarioDiarioIntegrado'] ) ){
			$strCampos .= ' SalarioDiarioIntegrado=:SalarioDiarioIntegrado, ';
		} 
		if ( isset( $datos['fk_banco'] ) ){
			$strCampos .= ' fk_banco=:fk_banco, ';
		} 
		if ( isset( $datos['fk_RiesgoPuesto'] ) ){
			$strCampos .= ' fk_RiesgoPuesto=:fk_RiesgoPuesto, ';
		} 
		if ( isset( $datos['percepcionesTotalGravado'] ) ){
			$strCampos .= ' percepcionesTotalGravado=:percepcionesTotalGravado, ';
		} 
		if ( isset( $datos['percepcionesTotalExcento'] ) ){
			$strCampos .= ' percepcionesTotalExcento=:percepcionesTotalExcento, ';
		} 
		if ( isset( $datos['deduccionesTotalGravado'] ) ){
			$strCampos .= ' deduccionesTotalGravado=:deduccionesTotalGravado, ';
		} 
		if ( isset( $datos['deduccionesTotalExcento'] ) ){
			$strCampos .= ' deduccionesTotalExcento=:deduccionesTotalExcento, ';
		}		
		//--------------------------------------------
		
		$strCampos=substr( $strCampos,0,  strlen($strCampos)-2 );
		
		
		if ( $esNuevo ){
			$sql = 'INSERT INTO '.$this->tabla.' SET '.$strCampos;
			$msg='Nomina Creada';
		}else{
			$sql = 'UPDATE '.$this->tabla.' SET '.$strCampos.' WHERE id=:id';
			$msg='Nomina Actualizada';
		}
		
		$pdo = $this->getConexion();
		$sth = $pdo->prepare($sql);
		//--------------------------------------------		
		// BIND VALUES
		
		if  ( isset( $datos['fk_patron'] ) ){
			$sth->bindValue(':fk_patron', $datos['fk_patron'] );
		}
		if  ( isset( $datos['fk_empleado'] ) ){
			$sth->bindValue(':fk_empleado', $datos['fk_empleado'] );
		}
		if  ( isset( $datos['fk_serie'] ) ){
			$sth->bindValue(':fk_serie', $datos['fk_serie'] );
		}
		if  ( isset( $datos['serie'] ) ){
			$sth->bindValue(':serie', $datos['serie'] );
		}
		if  ( isset( $datos['folio'] ) ){
			$sth->bindValue(':folio', $datos['folio'] );
		}
		if  ( isset( $datos['Version'] ) ){
			$sth->bindValue(':Version', $datos['Version'] );
		}
		if  ( isset( $datos['RegistroPatronal'] ) ){
			$sth->bindValue(':RegistroPatronal', $datos['RegistroPatronal'] );
		}
		if  ( isset( $datos['NumEmpleado'] ) ){
			$sth->bindValue(':NumEmpleado', $datos['NumEmpleado'] );
		}
		if  ( isset( $datos['CURP'] ) ){
			$sth->bindValue(':CURP', $datos['CURP'] );
		}
		if  ( isset( $datos['fk_TipoRegimen'] ) ){
			$sth->bindValue(':fk_TipoRegimen', $datos['fk_TipoRegimen'] );
		}
		if  ( isset( $datos['TipoRegimen'] ) ){
			$sth->bindValue(':TipoRegimen', $datos['TipoRegimen'] );
		}
		if  ( isset( $datos['NumSeguridadSocial'] ) ){
			$sth->bindValue(':NumSeguridadSocial', $datos['NumSeguridadSocial'] );
		}
		if  ( isset( $datos['FechaPago'] ) ){
			$sth->bindValue(':FechaPago', $datos['FechaPago'] );
		}
		if  ( isset( $datos['FechaInicialPago'] ) ){
			$sth->bindValue(':FechaInicialPago', $datos['FechaInicialPago'] );
		}
		if  ( isset( $datos['FechaFinalPago'] ) ){
			$sth->bindValue(':FechaFinalPago', $datos['FechaFinalPago'] );
		}
		if  ( isset( $datos['NumDiasPagados'] ) ){
			$sth->bindValue(':NumDiasPagados', $datos['NumDiasPagados'] );
		}
		if  ( isset( $datos['fk_Departamento'] ) ){
			$sth->bindValue(':fk_Departamento', $datos['fk_Departamento'] );
		}
		if  ( isset( $datos['Departamento'] ) ){
			$sth->bindValue(':Departamento', $datos['Departamento'] );
		}
		if  ( isset( $datos['CLABE'] ) ){
			$sth->bindValue(':CLABE', $datos['CLABE'] );
		}
		if  ( isset( $datos['Banco'] ) ){
			$sth->bindValue(':Banco', $datos['Banco'] );
		}
		if  ( isset( $datos['FechaInicioRelLaboral'] ) ){
			$sth->bindValue(':FechaInicioRelLaboral', $datos['FechaInicioRelLaboral'] );
		}
		if  ( isset( $datos['Antiguedad'] ) ){
			$sth->bindValue(':Antiguedad', $datos['Antiguedad'] );
		}
		if  ( isset( $datos['Puesto'] ) ){
			$sth->bindValue(':Puesto', $datos['Puesto'] );
		}
		if  ( isset( $datos['TipoContrato'] ) ){
			$sth->bindValue(':TipoContrato', $datos['TipoContrato'] );
		}
		if  ( isset( $datos['TipoJornada'] ) ){
			$sth->bindValue(':TipoJornada', $datos['TipoJornada'] );
		}
		if  ( isset( $datos['PeriodicidadPago'] ) ){
			$sth->bindValue(':PeriodicidadPago', $datos['PeriodicidadPago'] );
		}
		if  ( isset( $datos['SalarioBaseCotApor'] ) ){
			$sth->bindValue(':SalarioBaseCotApor', $datos['SalarioBaseCotApor'] );
		}
		if  ( isset( $datos['RiesgoPuesto'] ) ){
			$sth->bindValue(':RiesgoPuesto', $datos['RiesgoPuesto'] );
		}
		if  ( isset( $datos['SalarioDiarioIntegrado'] ) ){
			$sth->bindValue(':SalarioDiarioIntegrado', $datos['SalarioDiarioIntegrado'] );
		}
		if  ( isset( $datos['fk_banco'] ) ){
			$sth->bindValue(':fk_banco', $datos['fk_banco'] );
		}
		if  ( isset( $datos['fk_RiesgoPuesto'] ) ){
			$sth->bindValue(':fk_RiesgoPuesto', $datos['fk_RiesgoPuesto'] );
		}
		if  ( isset( $datos['percepcionesTotalGravado'] ) ){
			$sth->bindValue(':percepcionesTotalGravado', $datos['percepcionesTotalGravado'] );
		}
		if  ( isset( $datos['percepcionesTotalExcento'] ) ){
			$sth->bindValue(':percepcionesTotalExcento', $datos['percepcionesTotalExcento'] );
		}
		if  ( isset( $datos['deduccionesTotalGravado'] ) ){
			$sth->bindValue(':deduccionesTotalGravado', $datos['deduccionesTotalGravado'] );
		}
		if  ( isset( $datos['deduccionesTotalExcento'] ) ){
			$sth->bindValue(':deduccionesTotalExcento', $datos['deduccionesTotalExcento'] );
		}		
		if ( !$esNuevo)	{
			$sth->bindValue(':id', $datos['id'] );
		}	
		//--------------------------------------------
		$exito = $sth->execute();
		if ( !$exito ){
			$error =  $this->getError( $sth );
			throw new Exception($error['msg']);
		}
		
		if ( $esNuevo ){
			$idObj=$pdo->lastInsertId();
		}else{
			$idObj=$datos['id'];
		}	
		
		
		
		
		$percepcion_nominaMod = new percepcion_nominaModelo();
		foreach( $datos['percepcionesDeNomina'] as $el ){
			if ( !empty($el['eliminado']) ){
				if ( !empty($el['id']) ){
					$res = $percepcion_nominaMod->eliminar( array('id'=>$el['id']) );
					if ($res )$res =array('success'=>true);
				}else{
					$res=array('success'=>true);
				}					
			 }else{
				unset( $el['eliminado'] );
				$el['fk_nomina']=$idObj;
				// if ( empty($concepto['nombre'])  )  continue;
				$res = $percepcion_nominaMod->guardar($el);
			 }
			
			
			//-----
			//
			//$res=$percepcion_nominaMod->guardar($el);
			//if ( !$res['success'] ){											
			//	return $res;
			//}
			
		}
		$deduccion_nominaMod = new deduccion_nominaModelo();
		foreach( $datos['deduccionesDeNomina'] as $el ){
			if ( !empty($el['eliminado']) ){
				if ( !empty($el['id']) ){
					$res = $deduccion_nominaMod->eliminar( array('id'=>$el['id']) );
					if ($res )$res =array('success'=>true);
				}else{
					$res=array('success'=>true);
				}					
			 }else{
				unset( $el['eliminado'] );
				$el['fk_nomina']=$idObj;
				// if ( empty($concepto['nombre'])  )  continue;
				$res = $deduccion_nominaMod->guardar($el);
			 }
			
			
			//-----
			//
			//$res=$deduccion_nominaMod->guardar($el);
			//if ( !$res['success'] ){											
			//	return $res;
			//}
			
		}
		$incapacidadMod = new incapacidadModelo();
		foreach( $datos['incapacidadesDeNomina'] as $el ){
			if ( !empty($el['eliminado']) ){
				if ( !empty($el['id']) ){
					$res = $incapacidadMod->eliminar( array('id'=>$el['id']) );
					if ($res )$res =array('success'=>true);
				}else{
					$res=array('success'=>true);
				}					
			 }else{
				unset( $el['eliminado'] );
				$el['fk_nomina']=$idObj;
				// if ( empty($concepto['nombre'])  )  continue;
				$res = $incapacidadMod->guardar($el);
			 }
			
			
			//-----
			//
			//$res=$incapacidadMod->guardar($el);
			//if ( !$res['success'] ){											
			//	return $res;
			//}
			
		}
		$hora_extra_nominaMod = new hora_extra_nominaModelo();
		foreach( $datos['horas_extraDeNomina'] as $el ){
			if ( !empty($el['eliminado']) ){
				if ( !empty($el['id']) ){
					$res = $hora_extra_nominaMod->eliminar( array('id'=>$el['id']) );
					if ($res )$res =array('success'=>true);
				}else{
					$res=array('success'=>true);
				}					
			 }else{
				unset( $el['eliminado'] );
				$el['fk_nomina']=$idObj;
				// if ( empty($concepto['nombre'])  )  continue;
				$res = $hora_extra_nominaMod->guardar($el);
			 }
			
			
			//-----
			//
			//$res=$hora_extra_nominaMod->guardar($el);
			//if ( !$res['success'] ){											
			//	return $res;
			//}
			
		}
		$obj=$this->obtener( $idObj );
		$this->generaPdf( $obj );
		return array(
			'success'=>true,
			'datos'=>$obj,
			'msg'=>$msg
		);
		
	}
}
?>