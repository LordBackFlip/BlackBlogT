<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Controlador AJAX
 *
 * @name    ajax.upload.php
 * @author  PHPost Team
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	// NIVELES DE ACCESO Y PLANTILLAS DE CADA ACCIÓN
	$files = array(
        'upload-avatar' => array('n' => 2, 'p' => ''),
        'upload-crop' => array('n' => 2, 'p' => ''),
		'upload-images' => array('n' => 2, 'p' => ''),
		'upload-portada' => array('n' => 2, 'p' => ''),
		'upload-crop-portada' => array('n' => 2, 'p' => ''),
	);

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	// REDEFINIR VARIABLES
	$tsPage = 'php_files/p.upload.'.$files[$action]['p'];
	$tsLevel = $files[$action]['n'];
	$tsAjax = empty($files[$action]['p']) ? 1 : 0;

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
	
	// DEPENDE EL NIVEL
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1) { echo '0: '.$tsLevelMsg['mensaje']; die();}
	// CLASE
	require('../class/c.upload.php');
	$tsUpload = new tsUpload();
	// CODIGO
	switch($action){
        case 'upload-avatar':
            // <--
            $tsUpload->image_scale = true;
            $tsUpload->image_size['w'] = 640;
            $tsUpload->image_size['h'] = 480;
            //
            $tsUpload->file_url = $_POST['url'];
            //
            $result = $tsUpload->newUpload(3);
            echo $tsCore->setJSON($result);
            // -->
        break;
        case 'upload-crop':
            // <--
			echo $tsCore->setJSON($tsUpload->cropAvatar($tsUser->uid));
			// PARA EL PERFIL
			$total = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p_total FROM u_perfil WHERE user_id = \''.$tsUser->uid.'\' LIMIT 1'));
			$total = unserialize($total['p_total']);
			$total[5] = 1;
			$total = serialize($total);
			db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_perfil SET p_avatar = \'1\', p_total = \''.$total.'\' WHERE user_id = \''.$tsUser->uid.'\'');
            // -->
        break;
		case 'upload-images':		
			echo $tsCore->setJSON($tsUpload->newUpload(1));
		break;
		case 'upload-delete':
			$image = 'phpost_'.$_POST['key'].'.'.$_POST['ext'];
			$tsUpload->deleteFile($image);
		break;		
        case 'upload-portada':
			//
            $tsUpload->image_scale = true;
            $tsUpload->image_size['w'] = 640;
            $tsUpload->image_size['h'] = 480;
            $tsUpload->file_url = $_POST['url'];
            $result = $tsUpload->SubirPortada(3);
            echo $tsCore->setJSON($result);
        break;	
        case 'upload-crop-portada':
			echo $tsCore->setJSON($tsUpload->cropAvatarPortada($_POST['key']));
        break;		
		//BORRA LA IMAGAEN PARA LA PORTADA SI NO SE RECORTA
		case 'upload-delete-portada':
			$img = 'toup'.$_POST['key'].'.'.$_POST['ext'];			
			$tsUpload->deletePortada($img);
		break;
		//BORRAR LAS IMAGENES CREADAS SI EL POST NO SE PUBLICA
		case 'upload-delete-portada-sin':
			$imgChica = 'toup'.$_POST['key'].'P90X70.'.$_POST['ext'];			
			$tsUpload->deletePortada($imgChica);
			$imgGrande = 'toup'.$_POST['key'].'P240X180.'.$_POST['ext'];			
			$tsUpload->deletePortada($imgGrande);	
			$img = 'toup'.$_POST['key'].'.'.$_POST['ext'];			
			$tsUpload->deletePortada($img);			
		break;
	}