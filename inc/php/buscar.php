<?php 
//CONTROL DE ACCESO
$tsPage = "buscar";
$tsLevel = 0;
$tsAjax = empty($_GET['ajax']) ? 0 : 1;
$tsContinue = true;

//INCLUIR ARCHIVOS
include "../../header.php";

//NOMBRE DE LA PAGINA ACTUAL
	$titulos = $tsCore->setSecure($_GET['action']);
	if($titulos == ''){
		$tsTitle = 'Buscador - '.$tsCore->settings['titulo'].'!';
	}else{	
		$tsTitle = $tsCore->settings['titulo'].' - '.$tsCore->settings['slogan'];
	}
// VERIFICAMOS EL NIVEL DE ACCSESO ANTES CONFIGURADO
$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
if($tsLevelMsg != 1){	
	$tsPage = 'aviso';
	$tsAjax = 0;
	$smarty->assign("tsAviso",$tsLevelMsg);
	$tsContinue = false;
}

//SI TODO SE CUMPLE CONTINUAMOS
if($tsContinue){
	// Buscar
	include("../class/c.buscar.php");
	$tsBuscar = new tsBuscar();
	//	
	$q = htmlspecialchars($_GET['q']);	
	//LIMPIAMOS PARA EL SUBMENU
	$limpia = preg_replace("/#([A-Za-z0-9-_ñÑçÇáÁäÄàÀâÂéÉëËèÈêÊíÍïÏìÌîÎóÓöÖòÒôÔúÚüÜùÙûÛ]+)/", "%23$1",$q);
	$smarty->assign("tsLimpia",$limpia);
	//VARIABLE SIN LIMPIAR
	$smarty->assign("tsPalabra",$q);
	//OBTENER CATEGORIA
	$c = (int)$_GET['category'];
	$smarty->assign("tsCat",$c);
	//OBTENER DONDE BUSCAR
	$e = htmlspecialchars($_GET['type']);
	$smarty->assign("tsTipo",$e);
	//OBTENER INTERVALO DE TIEMPO
	$t = htmlspecialchars($_GET['interval']);
	$smarty->assign("tsTiempo",$t);	
	//OBTENER CONTENIDO SEGUN EL USUARIO
	$a = htmlspecialchars($_GET['autor']);
	$smarty->assign("tsAutor",$a);
	//
	$action = htmlspecialchars($_GET['action']);
	switch($action){	
		case '':
		break;	
		case 'posts':
			$smarty->assign("tsResults",$tsBuscar->getPosts());
		break;	
		case 'mi':
			$smarty->assign("tsResults",$tsBuscar->getShouts());
			//HASHTAGS
			$smarty->assign("tsHashtags",$tsBuscar->getHashtags());			
		break;			
		case 'imagenes':
			$smarty->assign("tsResults",$tsBuscar->getImagenes());
		break;			
	}
	$smarty->assign("tsAction",$action);
}

if(empty($tsAjax)) {
	$smarty->assign("tsTitle",$tsTitle);
	include("../../footer.php");
}