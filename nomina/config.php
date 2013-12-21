<?php
$DB_CONFIG=array(
	'DB_SERVER'	=>'localhost',
	'DB_NAME'	=>'constructor',
	'DB_USER'	=>'root',
	'DB_PASS'	=>'',
	'PASS_AES'	=>'9as43s'
);

if ( !isset($APP_CONFIG) ) $APP_CONFIG = array();
if ( !isset($_DEFAUL_LAYOUT) ) $_DEFAUL_LAYOUT ='sistema';
$APP_PATH='/constructor';
$APP_CONFIG['nombre'] = 'Nominas';

?>