<?php 
/**
 * Controlador
 *
 * @name    portal.php
 * @author  PHPost Team
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	$tsPage = "portal";	// tsPage.tpl -> PLANTILLA PARA MOSTRAR CON ESTE ARCHIVO.

	$tsLevel = 0;		// NIVEL DE ACCESO A ESTA PAGINA. => VER FAQs

	$tsAjax = empty($_GET['ajax']) ? 0 : 1; // LA RESPUESTA SERA AJAX?
	
	$tsContinue = true;	// CONTINUAR EL SCRIPT
	
/*++++++++ = ++++++++*/
	// TITULO DE LA PAGINA ACTUAL
	$titulos = $tsCore->setSecure($_GET['action']);
	if($titulos == ''){
		$tsTitle = 'Recientes - Mi '.$tsCore->settings['titulo'].'!';
	}elseif($titulos == 'destacados'){
		$tsTitle = 'Destacados - Mi '.$tsCore->settings['titulo'].'!';
	}elseif($titulos == 'populares'){
		$tsTitle = 'Populares - Mi '.$tsCore->settings['titulo'].'!';
	}elseif($titulos == 'publico'){
		$tsTitle = 'Público - Mi '.$tsCore->settings['titulo'].'!'; 
	}elseif($titulos == 'pin'){
		$tsTitle = 'Buscar - Mi '.$tsCore->settings['titulo'].'!'; 		
	}
/*++++++++ = ++++++++*/

	// VERIFICAMOS EL NIVEL DE ACCSESO ANTES CONFIGURADO
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1){	
		$tsPage = 'aviso';
		$tsAjax = 0;
		$smarty->assign("tsAviso",$tsLevelMsg);
		//
		$tsContinue = false;
	}
	//
	if($tsContinue){

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/
    // PORTAL
    include(TS_CLASS."c.portal.php");
    $tsPortal = new tsPortal();
/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/

	$smarty->assign("tsInfo",array('uid' => $tsUser->uid));	
    //
	$action = $tsCore->setSecure($_GET['action']);
	switch($action){
        case '':
			//RECIENTES Y FAVORITOS
			$smarty->assign("tsType", "news");
			$tipo = $tsCore->setSecure(intval($_GET['tipo']));
			$smarty->assign("tsFiltro",$tipo);						
			$smarty->assign("tsMuro",$tsPortal->getNews());
			//REINICIAR NOTIFICACIONES DEL MI
			$smarty->assign($tsPortal->CleanNoti());
        break;	
        case 'destacados':
			//DESTACADOS 
			$smarty->assign("tsType", "destacados");	
			$tipo = $tsCore->setSecure(intval($_GET['tipo']));
			$smarty->assign("tsFiltro",$tipo);									
			$smarty->assign("tsMuro",$tsPortal->getDestacados());
        break;
        case 'populares':
			//POPULARES
			$smarty->assign("tsType", "populares");	
			$tipo = $tsCore->setSecure(intval($_GET['tipo']));
			$smarty->assign("tsFiltro",$tipo);
			//
			$acciones = $tsCore->setSecure(intval($_GET['acciones']));
			$smarty->assign("tsAcciones",$acciones);
			//	
			$tiempos = $tsCore->setSecure(intval($_GET['tiempos']));
			$smarty->assign("tsTiempos",$tiempos);			
			//															
			$smarty->assign("tsMuro",$tsPortal->getPopulares());
        break;		
        case 'publico':
			//PUBLICO
			$smarty->assign("tsType", "publico");	
			$tipo = $tsCore->setSecure(intval($_GET['tipo']));
			$smarty->assign("tsFiltro",$tipo);				
			$smarty->assign("tsMuro",$tsPortal->getPublico());
        break;	
		case 'pin':
			$q = htmlspecialchars($_GET['q']);
			$smarty->assign("tsPalabra",$q);
			$smarty->assign("tsResults",$tsPortal->getShouts());
		break;
	}	
	//Muro	
	$smarty->assign("tsAction",$action);
	//USUARIO RECOMENDADOS
	$smarty->assign("tsRecomendados",$tsPortal->getRecomendados());
	//HASHTAGS
	$smarty->assign("tsHashtags",$tsPortal->getHashtags());
	//PINS
	$smarty->assign("tsPins",$tsPortal->getPins());
	//SEGUIDOS ONLINE
	$smarty->assign("tsSeguidos",$tsPortal->getSeguidos());	
	//CUMPLEAÑOS SEGUIDOS
	$smarty->assign("tsCumple",$tsPortal->getCumple());
	
	
	
	
	
	

	/*	ORIGINALES
    $smarty->assign("tsCategories",$tsPortal->composeCategories());
    //$tsPosts = $tsPortal->getMyPosts();
    //$smarty->assign("tsPosts",$tsPosts['data']);
    //$smarty->assign("tsPages",$tsPosts['pages']);
    //
    $smarty->assign("tsLastPostsVisited",$tsPortal->getLastPosts());
    $smarty->assign("tsFavorites",$tsPortal->getFavorites());
    // FOTOS
    $tsImages = $tsPortal->getFotos();
	$smarty->assign("tsImages",$tsImages);
    $smarty->assign("tsImTotal",count($tsImages));
    // STATS
    $smarty->assign("tsStats",$tsPortal->getStats());
    // AFILIADOS
    $smarty->assign("tsAfiliados",$tsAfiliado->getAfiliados());
	*/
/**********************************\

* (AGREGAR DATOS GENERADOS | SMARTY) *

\*********************************/
	}

if(empty($tsAjax)) {	// SI LA PETICION SE HIZO POR AJAX DETENER EL SCRIPT Y NO MOSTRAR PLANTILLA, SI NO ENTONCES MOSTRARLA.

	$smarty->assign("tsTitle",$tsTitle);	// AGREGAR EL TITULO DE LA PAGINA ACTUAL

	/*++++++++ = ++++++++*/
	include(TS_ROOT."/footer.php");
	/*++++++++ = ++++++++*/
}