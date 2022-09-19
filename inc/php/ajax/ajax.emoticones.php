<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Controlador AJAX
 *
 * @name    ajax.emoticones.php
 * @author  PHPost Team
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	// NIVELES DE ACCESO Y PLANTILLAS DE CADA ACCIÓN
	$files = array(
		'emoticones-load' => array('n' => 2, 'p' => 'load'),
	);

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	// REDEFINIR VARIABLES
	$tsPage = 'php_files/p.emoticones.'.$files[$action]['p'];
	$tsLevel = $files[$action]['n'];
	$tsAjax = empty($files[$action]['p']) ? 1 : 0;

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
	
	// DEPENDE EL NIVEL
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1) { echo '0: '.$tsLevelMsg['mensaje']; die();}

    // Para las categorias
    include(TS_EXTRA . 'datos.php');

    $categorias = $tsCatsEmotis;

    // Obtener todos los emoticones
    $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM w_emoticones');
    $data = result_array($query);

    foreach ($data as $dato) {
        $categorias[$dato['cat']]['data'][] = $dato;
    }

    $smarty->assign("tsCategorias", $tsCatsEmotis);
    $smarty->assign("tsEmoticones", $categorias);

?>