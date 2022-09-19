<?php 
$tsPage = "envivo";
$tsLevel = 2;
$tsAjax = empty($_GET['ajax']) ? 0 : 1; 
$tsContinue = true;
include "../../header.php";
//NOMBRE DE LA PAGINA ACTUAL
$tsTitle = $tsCore->settings['titulo'].' - '.$tsCore->settings['slogan'];
/**************************************************************************************/
$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
if($tsLevelMsg != 1){	
	$tsPage = 'login';
	$tsAjax = 0;
	$smarty->assign("tsAviso",$tsLevelMsg);
	$tsContinue = false;
}
/*************************************************************************************/
if($tsContinue){
	include("../class/c.envivo.php");
	$tsEnvivo = new tsEnvivo();	
	$action = htmlspecialchars($_GET['action']);
	$smarty->assign("tsData",$tsEnvivo->getEnvivo());	
	$smarty->assign("tsAction",$action);
}
/*************************************************************************************/
if(empty($tsAjax)) {	
	$smarty->assign("tsTitle",$tsTitle);
	include("../../footer.php");
}