<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Controlador AJAX
 *
 * @name    ajax.envivo.php
 * @author  PHPost to-up.net
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	// NIVELES DE ACCESO Y PLANTILLAS DE CADA ACCI�N
	$files = array(		
		'envivo-actividad' => array('n' => 2, 'p' => 'actividad'),		
	);

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	// REDEFINIR VARIABLES
	$tsPage = 'php_files/p.envivo.'.$files[$action]['p'];
	$tsLevel = $files[$action]['n'];
	$tsAjax = empty($files[$action]['p']) ? 1 : 0;

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
	
	// DEPENDE EL NIVEL
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1) { echo '0: '.$tsLevelMsg['mensaje']; die();}
    include("../class/c.envivo.php");
    $tsEnvivo = new tsEnvivo();	
	// CODIGO
	switch($action){		
		case 'envivo-actividad':
			$smarty->assign("tsData",$tsEnvivo->getEnvivo());
		break;
        default:
            die('0: Este archivo no existe');
        break;
	}