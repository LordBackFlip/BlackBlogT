<?php 
/**
 * Controlador
 *
 * @name    posts.php
 * @author  PHPost Team
*/

/*
 * -------------------------------------------------------------------
 *  Definiendo variables por defecto
 * -------------------------------------------------------------------
 */

	$tsPage = "posts";	// tsPage.tpl -> PLANTILLA PARA MOSTRAR CON ESTE ARCHIVO.

	$tsLevel = 0;		// NIVEL DE ACCESO A ESTA PAGINA

	$tsAjax = empty($_GET['ajax']) ? 0 : 1; // LA RESPUESTA SERA AJAX?
	
	$tsContinue = true;	// CONTINUAR EL SCRIPT

	$tsTitle = $tsCore->settings['titulo']; 	// TITULO DE LA PAGINA ACTUAL

/*
 * -------------------------------------------------------------------
 *  Validando nivel de acceso
 * -------------------------------------------------------------------
 */

	// Nivel y permisos de acceso
	$tsLevelMsg = $tsCore->setLevel($tsLevel, true);
	if($tsLevelMsg != 1)
    {
		$tsPage = 'aviso';
		$tsAjax = 0;
		$smarty->assign("tsAviso",$tsLevelMsg);
		//
		$tsContinue = false;
	}
	//
	if($tsContinue)
    {

/*
 * -------------------------------------------------------------------
 *  Estableciendo variables y archivos 
 * -------------------------------------------------------------------
 */
    // Afiliados
    include(TS_CLASS."c.afiliado.php");
    $tsAfiliado = new tsAfiliado();
        
    // Referido?
    if(!empty($_GET['ref'])) $tsAfiliado->urlIn();
    
	// Posts Class
	include(TS_CLASS."c.posts.php");
	$tsPosts = new tsPosts();
    
    // Category
	$category = $tsCore->setSecure($_GET['cat']);
	
	//Pais
	$pais = $tsCore->setSecure($_GET['pais']);
    
    // Post anterior/siguiente
    if($_GET['action'] == 'next' || $_GET['action'] == 'prev'|| $_GET['action'] == 'fortuitae')
    {
        $tsPosts->setNP();
    }

/*
 * -------------------------------------------------------------------
 *  Tareas principales
 * -------------------------------------------------------------------
 */
    if(!empty($_GET['post_id'])){
        
        // DATOS DEL POST
    	$tsPost = $tsPosts->getPost();
    	//
    	if($tsPost['post_id'] > 0) {
    		// TITULO NUEVO
    		$tsTitle = $tsPost['post_title'].' - '.$tsTitle;
    		// ASIGNAMOS A LA PLANTILLA
    		$smarty->assign("tsPost",$tsPost);
    		// DATOS DEL AUTOR
    		$smarty->assign("tsAutor",$tsPosts->getAutor($tsPost['post_user']));						
			// DATOS DEL RANGO DEL PUTEADOR						
			$smarty->assign("tsPunteador",$tsPosts->getPunteador());
    		// RELACIONADOS POR TAGS
    		$tsRelated = $tsPosts->getRelated($tsPost['post_tags']);
    		$smarty->assign("tsRelated",$tsRelated);			
    		// RELACIONADOS POR CONTENIDO
    		$tsRelated = $tsPosts->getRelatedContenido($tsPost['post_tags']);
    		$smarty->assign("tsRelatedContenido",$tsRelated);						
    		// COMENTARIOS
    		/*$tsComments = $tsPosts->getComentarios($tsPost['post_id']);
    		$tsComments = array('num' => $tsComments['num'], 'data' => $tsComments['data']);
    		$smarty->assign("tsComments",$tsComments);*/
    		// PAGINAS
    		$total = $tsPost['post_comments'];
    		$tsPages = $tsCore->getPages($total, $tsCore->settings['c_max_com']);
    		$tsPages['post_id'] = $tsPost['post_id'];
    		$tsPages['autor'] = $tsPost['post_user'];
    		//
    		$smarty->assign("tsPages",$tsPages);
    
    	} else {
    		//
            if($tsPost[0] == 'privado'){
                $tsTitle = $tsPost[1].' - '.$tsTitle;
                $tsPage = "registro";
            } else {
        		$tsTitle = $tsTitle.' - '.$tsCore->settings['slogan'];
        		//
        		$tsPage = "post.aviso";
        		$tsAjax = 0;
        		$smarty->assign("tsAviso",$tsPost);
        		//
        		$title = str_replace("-",",",$tsCore->setSecure($_GET['title']));
        		$title = explode(",",$title);
        		// RELACIONADOS
        		$tsRelated = $tsPosts->getRelated($title);
        		$smarty->assign("tsRelated",$tsRelated);
            }
    	}
    } else {
        // PAGINA
        $tsPage = "home";
        $tsTitle = $tsTitle.' - '.$tsCore->settings['slogan']; 	// TITULO DE LA PAGINA ACTUAL        
    	// CLASE TOPS
    	include(TS_CLASS."c.tops.php");
    	$tsTops = new tsTops();
		
    	//TIPO DE POST A MOSTRAR	
		switch($category){			
			case 'ascenso':							
				$smarty->assign("tsAction", "ascenso");				
			break;
			case 'recientes':
				$smarty->assign("tsAction", "recientes");
			break;			
		}		
		
    	// ULTIMOS POSTS
    	$tsLastPosts = $tsPosts->getLastPosts($category, $subcateg);
    	$smarty->assign("tsPosts",$tsLastPosts['data']);
        $smarty->assign("tsPages",$tsLastPosts['pages']);
    	// ULTIMOS POSTS FIJOS
        if($tsLastPosts['pages']['current'] == 1){
    	   $tsLastStickys = $tsPosts->getLastPosts($category, $subcateg, true);
    	   $smarty->assign("tsPostsStickys",$tsLastStickys['data']);
        }
    	// PAIS
		$smarty->assign("tsPais",$pais);
		// CAT
    	$smarty->assign("tsCat",$category);
    	$smarty->assign("tsStats",$tsTops->getStats());
		// TAGS RELEVANTES
		$smarty->assign("tsTags",$tsPosts->getTags());		
    	// ULTIMOS COMENTARIOS
    	$smarty->assign("tsComments",$tsPosts->getLastComentarios());
    	// POSTS DESTACADOS
    	$smarty->assign("tsPostsDestacados",$tsTops->getHomePostsDestacados());
    	// POSTS RECOMENDADOS
    	$smarty->assign("tsPostsRecomendados",$tsTops->getHomePostsRecomendados());		
    	// TOP POSTS
    	$smarty->assign("tsTopPosts",$tsTops->getHomeTopPosts());
    	// TOP USERS
    	$smarty->assign("tsTopUsers",$tsTops->getHomeTopUsers());
		// TITULO
        if(!empty($category)) {
            $catData = $tsPosts->getCatData();
            $tsTitle = $tsCore->settings['titulo'].' - '.$catData['c_nombre'];
            $smarty->assign("tsCatData",$catData);
        }
		if($category == 'novatos') {
			$tsTitle = $tsCore->settings['titulo'].' - Novatos';
        }
		if($category == 'ascenso') {
			$tsTitle = $tsCore->settings['titulo'].' - Ascenso';
        }
		if($category == 'recientes') {
			$tsTitle = $tsCore->settings['titulo'].' - Recientes';
        }				
		// FOTOS
    	include(TS_CLASS."c.fotos.php");
    	$tsFotos = new tsFotos();
        $tsImages = $tsFotos->getLastFotos();
    	$smarty->assign("tsImages",$tsImages);
        $smarty->assign("tsImTotal",count($tsImages));        
        // AFILIADOS
    	$smarty->assign("tsAfiliados",$tsAfiliado->getAfiliados());
        // DO <= PARA EL MENU
        $smarty->assign("tsDo",$_GET['do']);
		//MURO HOME
		include(TS_CLASS."c.muro.php");
        $tsMuro = new tsMuro();
		$smarty->assign("tsMuroHome",$tsMuro->getMuroHome());
		$smarty->assign("tsType","home");
		//ULTIMOS REGISTRADOS
		$smarty->assign("tsRegistrados",$tsPosts->getRegistrados());	
    	// LO MAS BUSCADO
    	$smarty->assign("tsMasBuscado",$tsPosts->getMasBuscado());			
    }

}
/*
 * -------------------------------------------------------------------
 *  Incluir plantilla
 * -------------------------------------------------------------------
 */

if(empty($tsAjax)) 
{
    // Asignamos título
	$smarty->assign("tsTitle",$tsTitle);
    // Incluir footer
	include(TS_ROOT . "/footer.php");
}