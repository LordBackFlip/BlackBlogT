<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Controlador AJAX
 *
 * @name    ajax.muro.php
 * @author  PHPost Team
*/
/**********************************\

*	(VARIABLES POR DEFAULT)		*

\*********************************/

	// NIVELES DE ACCESO Y PLANTILLAS DE CADA ACCIÓN
	$files = array(
		'muro-stream' => array('n' => 2, 'p' => 'stream'),
        'muro-likes' => array('n' => 2, 'p' => ''),
		'muro-actividad' =>  array('n' => 0, 'p' => 'actividad-shout'),
		'muro-favorito' => array('n' => 2, 'p' => ''),
		'muro-compartir' => array('n' => 2, 'p' => ''),
		'muro-recientes' => array('n' => 2, 'p' => 'recientes'),
		'muro-destacados' => array('n' => 0, 'p' => 'recientes'),
		'muro-populares' => array('n' => 0, 'p' => 'recientes'),
		//'muro-publico' => array('n' => 2, 'p' => 'recientes'),
	);

/**********************************\

* (VARIABLES LOCALES ESTE ARCHIVO)	*

\*********************************/

	// REDEFINIR VARIABLES
	$tsPage = 'php_files/p.muro.'.$files[$action]['p'];
	$tsLevel = $files[$action]['n'];
	$tsAjax = empty($files[$action]['p']) ? 1 : 0;

/**********************************\

*	(INSTRUCCIONES DE CODIGO)		*

\*********************************/
	
	// DEPENDE EL NIVEL
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1) { echo '0: '.$tsLevelMsg['mensaje']; die();}
    // CLASS
    include("../class/c.muro.php");
    $tsMuro = new tsMuro();
	//
    include("../class/c.envivo.php");
    $tsEnvivo = new tsEnvivo();	
    //
	// CODIGO
	switch($action){
		case 'muro-stream':
			//<---
            $do = $_GET['do'];
            //
            if($do == 'check'){
                echo $tsMuro->ajaxCheck();
                $tsAjax = 1;
            } elseif($do == 'post'){
                $tsStream = $tsMuro->streamPost();
                if(!is_array($tsStream) && substr($tsStream,0,1) == '0') {
                    echo $tsStream;
                    $tsAjax = 1;
                }	
                else {
                    // ASIGNAMOS
                    $tsWall['data'][1] = $tsStream;
                    $smarty->assign("tsMuro",$tsWall);
                    $tsPrivacidad['mf']['v'] = true;
                    $smarty->assign("tsPrivacidad", $tsPrivacidad);  
                } 
            } elseif($do == 'more'){
                // CLASS
                include("../class/c.cuenta.php");
                $tsCuenta = new tsCuenta();
                // VARIABLES
                $user_id = $tsCore->setSecure($_POST['pid']);
                $start = $tsCore->setSecure($_POST['start']);
				//VARIABLE PARA FILTRO DEL MI EN RECIENTES 
				$tipo = $tsCore->setSecure(intval($_POST['tipo']));
				//VARIABLE PARA ACCIONES DEL MI EN POPULARES
				$acciones = $tsCore->setSecure(intval($_POST['acciones']));
				//VARIABLE PARA TIEMPOS DEL MI EN POPULARES
				$tiempos = $tsCore->setSecure(intval($_POST['tiempos']));
                //
                $priv = $tsMuro->getPrivacity($user_id, 'null', $tsCuenta->iFollow($user_id));
                $smarty->assign("tsPrivacidad",$priv);
                //CARGAR MAS COMENTARIOS SEGUN SU TIPO
				if($_GET['type'] == 'wall'){
					$tsStream = $tsMuro->getWall($user_id,$start);
				}
				if($_GET['type'] == 'news'){ 		
					//INICIO ESTO LO INCLUYO PARA PODER USARLO EN EL STREAM DE LOADMORE
					$smarty->assign("tsType", "news");
					$smarty->assign("tsFiltro",$tipo);										
					//FIN
					$tsStream = $tsMuro->getNews($start, 10, $tipo);				
				}
				//VARIABLE PARA FILTRO DEL MI EN DESTACADOS
				if($_GET['type'] == 'destacados'){
					$tsStream = $tsMuro->getDestacados($start, 10, $tipo);
				}
				//VARIABLE PARA FILTRO DEL MI EN POPULARES
				if($_GET['type'] == 'populares'){
					$tsStream = $tsMuro->getPopulares($start, 10, $tipo, $acciones, $tiempos);
				}
				//VARIABLE PARA FILTRO DEL MI EN PUBLICOS
				if($_GET['type'] == 'publico'){
					$tsStream = $tsMuro->getPublico($start, 10);
				}				
                // ASIGNAMOS
                if(!is_array($tsStream)) {
                    echo $tsStream;
                    $tsAjax = 1;   
                }
                else {
                    $smarty->assign("tsMuro",$tsStream);            
                }  
            } elseif($do == 'repost'){
                $tsPage = 'php_files/p.muro.stream.comments'; // TEMPLATE
                // VARIABLES
                $tsRepost = $tsMuro->streamRepost();
                // ASIGNAMOS
                if(!is_array($tsRepost)) {
                    echo $tsRepost;
                    $tsAjax = 1;   
                }
                else {
                    $tsComments['data'][1] = $tsRepost;
                    $smarty->assign("tsComments",$tsComments);  
                } 
            } elseif($do == 'more_comments'){
                $tsPage = 'php_files/p.muro.stream.comments'; // TEMPLATE
                // VARIABLES
                $tsComments = $tsMuro->getComments();
                // ASIGNAMOS
                if(!is_array($tsComments)) {
                    echo $tsComments;
                    $tsAjax = 1;
                }
                else {                    
                    $smarty->assign("tsComments",$tsComments);
                }
            } elseif($do == 'delete'){
                echo $tsMuro->deletePost();
                $tsAjax = 1;
            }
			//--->
		break;
        case 'muro-likes':
            //<---
            if(empty($_GET['do']))
                echo $tsCore->setJSON($tsMuro->likePost());
            else {
                echo $tsCore->setJSON($tsMuro->showLikes());
            }
            //--->
        break;		
		case 'muro-actividad':
			//<--
				$smarty->assign("tsActividad",$tsMuro->ActividadShouts());
			//<--
		break;		
		case 'muro-favorito':
			if(empty($do)){
				echo $tsCore->setJSON($tsMuro->ShoutFavorito());
			}
		break;	
		case 'muro-compartir':
			if(empty($do)){
				echo $tsCore->setJSON($tsMuro->ShoutCampartir());
			}
		break;
		//RECIENTES
		case 'muro-recientes':
			$smarty->assign("tsType", "news");
			$tipo = $tsCore->setSecure(intval($_GET['tipo']));
			$smarty->assign("tsFiltro",$tipo);			
			$tsStream = $tsMuro->getNews(0, 10, $tipo);
			$smarty->assign("tsMuro",$tsStream);		
		break;
		//DESTACADOS
		case 'muro-destacados':
			$smarty->assign("tsType", "destacados");	
			$tipo = $tsCore->setSecure(intval($_GET['tipo']));
			$smarty->assign("tsFiltro",$tipo);												
			$tsStream = $tsMuro->getDestacados(0, 10, $tipo);
			$smarty->assign("tsMuro",$tsStream);		
		break;
		//POPULARES
		case 'muro-populares':
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
			$tsStream = $tsMuro->getPopulares(0, 10, $tipo, $acciones, $tiempos);			
			$smarty->assign("tsMuro",$tsStream);		
		break;	
/*		
		case 'muro-publico':
			//PUBLICOS
			$smarty->assign("tsType", "publico");	
			$tipo = $tsCore->setSecure(intval($_GET['tipo']));
			$smarty->assign("tsFiltro",$tipo);		
			$tsStream = $tsMuro->getPublico(0, 10, $tipo);			
			$smarty->assign("tsMuro",$tsStream);		
		break;	
*/		
        default:
            die('0: Este archivo no existe.');
        break;
	}