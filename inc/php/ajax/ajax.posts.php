<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Controlador AJAX
 *
 * @name    ajax.posts.php
 * @author  PHPost Team
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	// NIVELES DE ACCESO Y PLANTILLAS DE CADA ACCIÓN
	$files = array(
        'posts-genbus' => array('n' => 2, 'p' => 'genbus'),
		'posts-preview' => array('n' => 2, 'p' => 'preview'),
		'posts-borrar' =>  array('n' => 2, 'p' => ''),
		'posts-admin-borrar' =>  array('n' => 2, 'p' => ''),
		'posts-votar' =>  array('n' => 2, 'p' => ''),
		'posts-last-comentarios' =>  array('n' => 0, 'p' => 'last-comentarios'),
		'posts-last-tags' =>  array('n' => 0, 'p' => 'tags-relevantes'),
		'posts-tops-posts' =>  array('n' => 0, 'p' => 'top-posts'),
		'posts-tops-usuarios' =>  array('n' => 0, 'p' => 'top-usuarios'),
		'posts-destacados' =>  array('n' => 0, 'p' => 'posts-destacados'),
		'posts-recomendados' =>  array('n' => 0, 'p' => 'posts-recomendados'),
		'posts-shouts' =>  array('n' => 0, 'p' => 'home-shouts'),
	);

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	// REDEFINIR VARIABLES
	$tsPage = 'php_files/p.posts.'.$files[$action]['p'];
	$tsLevel = $files[$action]['n'];
	$tsAjax = empty($files[$action]['p']) ? 1 : 0;

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
	
	// DEPENDE EL NIVEL
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1) { echo '0: '.$tsLevelMsg['mensaje']; die();}
	// CLASE
	require('../class/c.posts.php');
	$tsPosts = new tsPosts();
	// CODIGO
	switch($action){
		case 'posts-genbus':
			//<--
                $do = htmlspecialchars($_GET['do']);
                $q = $tsCore->setSecure($_POST['q']);
                //
                if($do == 'search'){
                    $smarty->assign("tsPosts",$tsPosts->simiPosts($q));   
                }elseif($do == 'generador'){
                    $tags = $tsPosts->genTags($q);
                    $smarty->assign("tsTags",$tags);
                }
                //
                $smarty->assign("tsDo",$do);
			//-->
		break;
		case 'posts-preview':
			//<--
				$smarty->assign("tsPreview",$tsPosts->getPreview());
			//-->
		break;
		case 'posts-borrar':
			//<--
				echo $tsPosts->deletePost();
			//-->
		break;
		case 'posts-admin-borrar':
			//<--
				echo $tsPosts->deleteAdminPost();
			//-->
		break;
		case 'posts-votar':
			//<--
				echo $tsPosts->votarPost();
			//-->
		break;
		case 'posts-last-comentarios':
			//<--
			    $smarty->assign("tsComments",$tsPosts->getLastComentarios());
			//-->
		break;
		case 'posts-last-tags':
			//<--
				$smarty->assign("tsTags",$tsPosts->getTags());
			//<--
		break;				
		case 'posts-tops-posts':
			//<--
			require('../class/c.tops.php');
			$tsTops = new tsTops();		
			$smarty->assign("tsTopPosts",$tsTops->getHomeTopPosts());		
			//<--
		break;
		case 'posts-tops-usuarios':
			//<--
			require('../class/c.tops.php');
			$tsTops = new tsTops();		
			$smarty->assign("tsTopUsers",$tsTops->getHomeTopUsers());		
			//<--
		break;	
		case 'posts-destacados':
			//<--
			require('../class/c.tops.php');
			$tsTops = new tsTops();		
			$smarty->assign("tsPostsDestacados",$tsTops->getHomePostsDestacados());		
			//<--
		break;
		case 'posts-recomendados':
			//<--
			require('../class/c.tops.php');
			$tsTops = new tsTops();		
			$smarty->assign("tsPostsRecomendados",$tsTops->getHomePostsRecomendados());		
			//<--
		break;		
		case 'posts-shouts':
			require('../class/c.muro.php');
			$tsMuro = new tsMuro();
			$smarty->assign("tsMuroHome",$tsMuro->getMuroHome());
			$smarty->assign("tsType","home");				
		break;
        default:
            die('0: Este archivo no existe.');
        break;				
	}