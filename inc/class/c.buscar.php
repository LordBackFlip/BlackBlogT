<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
class tsBuscar {

	//BUSCAR EN LOS POST
    function getPosts(){
        global $tsCore, $tsUser;
        $q = $tsCore->setSecure($_GET['q']);
		$c = (int)$_GET['category'];
        $e = $tsCore->setSecure($_GET['type']);
		$t = htmlspecialchars($_GET['interval']);
		$a = $tsCore->setSecure($_GET['autor']);
		//FILTRO INTERVALO DE TIEMPO
		$tiempo = time();
		$dia = (int) date("d",$tiempo);
		$hora = (int) date("G",$tiempo);
		$min = (int) date("i",$tiempo);
		$seg = (int) date("s",$tiempo);	
		//
		$resta = $hora*3600 + $min*60 +$seg;
		if($t == 'recent'){
			$inicio = $tiempo - $resta;
			$final = $tiempo;			
		}elseif($t == 'last-week'){
			$restaDos = $resta + 604800  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;				
		}elseif($t == 'last-month'){
			$restaDos = $resta + 2592000  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;	
		}elseif($t == 'last-year'){
			$restaDos = $resta + 12*2592000 + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;
		}elseif($t == 'all-time' || $t == ''){
			$inicio = 0;
			$final = $tiempo;						
		}
		// FILTRO CATEGORIAS
        if($c > 0) {
			$where_cat = 'AND p.post_category = \''.(int)$c.'\'';
		}	
		//FILTRO TIPO DE CONTENIDO
		if($e == '' || $e == 'cuerpo'){ 
			$search_on = 'p.post_body';	
		}elseif($e == 'tags') { 
			$search_on = 'p.post_tags';
		}elseif($e == 'titulo') {
			$search_on = 'p.post_title';
		}
		// BUSQUEDA 
        $trozos = explode(" ",$q); 
		$numero = count($trozos);
		if ($numero == 1) {
			if($e == '' || $e == 'cuerpo'){ 
				$w_search = "AND p.post_body LIKE '%$q%'";
			}elseif($e == 'tags') { 
				$w_search = "AND p.post_tags LIKE '%$q%'";
			}elseif($e == 'titulo') {
				$w_search = "AND p.post_title LIKE '%$q%'";
			}						
		} elseif ($numero > 1) {		
			$w_search = 'AND MATCH('.$search_on.') AGAINST(\''.$q.'\' IN BOOLEAN MODE)';
		}		
        // SELECCIONAR USUARIO
        if(!empty($a)){
                // OBTENEMOS ID
                $aid = $tsUser->getUserID($a);
                // BUSCAR LOS POST DEL USUARIO SIN CRITERIO DE BUSQUEDA
                if(empty($q) && $aid > 0) $w_search = 'AND p.post_user = \''.(int)$aid.'\'';
                // BUSCAMOS CON CRITERIO PERO SOLO LOS DE UN USUARIO
                elseif($aid >= 1) $w_autor = 'AND p.post_user = \''.(int)$aid.'\'';
                //
        }
        // PAGINAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(p.post_id) AS total FROM p_posts AS p WHERE p.post_status = \'0\' '.$where_cat.' '.$w_autor.' '.$w_search.' AND (p.post_date BETWEEN '.$inicio.' AND '.$final.') ORDER BY p.post_date');
        $total = db_exec('fetch_assoc', $query);
        $total = $total['total'];
        //
        $data['pages'] = $tsCore->getPagination($total, 12);
        //RESULTADOS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_id, p.post_user, p.post_category, p.post_title, p.post_date, p.post_comments, p.post_favoritos, p.post_puntos, u.user_name, c.c_seo, c.c_nombre, c.c_img, c.cid FROM p_posts AS p LEFT JOIN u_miembros AS u ON u.user_id = p.post_user LEFT JOIN p_categorias AS c ON c.cid = p.post_category WHERE p.post_status = \'0\' '.$where_cat.' '.$w_autor.' '.$w_search.' AND (p.post_date BETWEEN '.$inicio.' AND '.$final.') ORDER BY p.post_date DESC LIMIT '.$data['pages']['limit']);
        $data['data'] = result_array($query);
        // ACTUALES
        $total = explode(',',$data['pages']['limit']);
        $data['total'] = ($total[0]) + count($data['data']);
        //
        return $data;
	}
	
	//BUSCAR EN LOS SHOUTS
	function getShouts(){
		global $tsCore, $tsUser;
		$q = $tsCore->setSecure($_GET['q']);
		$type = intval($_GET['type']);
		$t = htmlspecialchars($_GET['interval']);
		$a = $tsCore->setSecure($_GET['autor']);
		//FILTRAR POR TIPO DE SHOUT
		if($type > 0) $where_type = 'AND p.p_type = \''.(int)$type.'\'';		
        //BUSCAR PALABRA EN EL CONTENIDO DEL SHOUT
		$trozos = explode(" ",$q); 
		$numero = count($trozos);
		if ($numero == 1) {
			$hash = "p.p_body LIKE '%$q%'";
		} elseif ($numero > 1) {		
			$hash = 'MATCH(p.p_body) AGAINST(\''.$q.'\' IN BOOLEAN MODE)';
		}		
		//FILTRAR POR INTERVALO DE TIEMPO
		$tiempo = time();
		$dia = (int) date("d",$tiempo);
		$hora = (int) date("G",$tiempo);
		$min = (int) date("i",$tiempo);
		$seg = (int) date("s",$tiempo);	
		//
		$resta = $hora*3600 + $min*60 +$seg;
		if($t == 'recent'){
			$inicio = $tiempo - $resta;
			$final = $tiempo;			
		}elseif($t == 'last-week'){
			$restaDos = $resta + 604800  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;				
		}elseif($t == 'last-month'){
			$restaDos = $resta + 2592000  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;	
		}elseif($t == 'last-year'){
			$restaDos = $resta + 12*2592000 + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;
		}elseif($t == 'all-time' || $t == ''){
			$inicio = 0;
			$final = $tiempo;						
		}		
        // SELECCIONAR USUARIO
        if(!empty($a)){
			$aid = $tsUser->getUserID($a);
			if($aid >= 1) $w_autor = 'AND p.p_user = \''.(int)$aid.'\'';
        }		
        // PAGINAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(p.pub_id) AS total FROM u_muro AS p WHERE '.$hash.' '.$where_type.' '.$w_autor.' AND (p.p_date BETWEEN '.$inicio.' AND '.$final.')');
        $total = db_exec('fetch_assoc', $query);
        $total = $total['total'];
		$data['pages'] = $tsCore->getPagination($total, 7);
        //RESULTADOS
		$ca = 'a.adj_id, a.a_title, a.a_url, a.a_img, a.a_desc';
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, '.$ca.', u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user = u.user_id LEFT JOIN u_muro_adjuntos AS a ON p.pub_id = a.pub_id WHERE '.$hash.' '.$where_type.' '.$w_autor.' AND (p.p_date BETWEEN '.$inicio.' AND '.$final.') ORDER BY p.p_date DESC LIMIT '.$data['pages']['limit']);
        $data['data'] = result_array($query);
        // ACTUALES
        $total = explode(',',$data['pages']['limit']);
        $data['total'] = ($total[0]) + count($data['data']);
        //
        return $data;				
	}


	//BUSCAR IMAGENES EN LOS SHOUTS
	function getImagenes(){
		global $tsCore, $tsUser;
		$q = $tsCore->setSecure($_GET['q']);

//		$type = intval($_GET['type']);
		$t = htmlspecialchars($_GET['interval']);
		$a = $tsCore->setSecure($_GET['autor']);
		//FILTRAR POR TIPO DE SHOUT
		$where_type = 'AND p.p_type = \'2\'';
        //BUSCAR PALABRA EN EL CONTENIDO DEL SHOUT
		$trozos = explode(" ",$q); 
		$numero = count($trozos);
		if ($numero == 1) {
			$hash = "p.p_body LIKE '%$q%'";
		} elseif ($numero > 1) {		
			$hash = 'MATCH(p.p_body) AGAINST(\''.$q.'\' IN BOOLEAN MODE)';
		}		
		//FILTRAR POR INTERVALO DE TIEMPO
		$tiempo = time();
		$dia = (int) date("d",$tiempo);
		$hora = (int) date("G",$tiempo);
		$min = (int) date("i",$tiempo);
		$seg = (int) date("s",$tiempo);	
		//
		$resta = $hora*3600 + $min*60 +$seg;
		if($t == 'recent'){
			$inicio = $tiempo - $resta;
			$final = $tiempo;			
		}elseif($t == 'last-week'){
			$restaDos = $resta + 604800  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;				
		}elseif($t == 'last-month'){
			$restaDos = $resta + 2592000  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;	
		}elseif($t == 'last-year'){
			$restaDos = $resta + 12*2592000 + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;
		}elseif($t == 'all-time' || $t == ''){
			$inicio = 0;
			$final = $tiempo;						
		}		
        // SELECCIONAR USUARIO
        if(!empty($a)){
			$aid = $tsUser->getUserID($a);
			if($aid >= 1) $w_autor = 'AND p.p_user = \''.(int)$aid.'\'';
        }		
        // PAGINAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(p.pub_id) AS total FROM u_muro AS p WHERE '.$hash.' '.$where_type.' '.$w_autor.' AND (p.p_date BETWEEN '.$inicio.' AND '.$final.')');
        $total = db_exec('fetch_assoc', $query);
        $total = $total['total'];
		$data['pages'] = $tsCore->getPagination($total, 7);
        //RESULTADOS
		$ca = 'a.adj_id, a.a_title, a.a_url, a.a_img, a.a_desc';
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, '.$ca.', u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user = u.user_id LEFT JOIN u_muro_adjuntos AS a ON p.pub_id = a.pub_id WHERE '.$hash.' '.$where_type.' '.$w_autor.' AND (p.p_date BETWEEN '.$inicio.' AND '.$final.') ORDER BY p.p_date DESC LIMIT '.$data['pages']['limit']);
        $data['data'] = result_array($query);
        // ACTUALES
        $total = explode(',',$data['pages']['limit']);
        $data['total'] = ($total[0]) + count($data['data']);
        //
        return $data;				
	}

	//HASTAGS DEL MOMENTO
	function getHashtags(){
		global $tsCore, $tsUser;
		$time = time() -(3600*1); // 1 HORA
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT id,p_date,p_tags,count(p_tags) AS total FROM u_muro_tags WHERE p_date >= '.$time.' GROUP BY p_tags ORDER BY total DESC limit 6');
		$data1 = result_array($query);
		$queryDos = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT id,p_date,p_tags,count(p_tags) AS total FROM u_muro_tags GROUP BY p_tags ORDER BY total DESC limit 6');
		$data2 = result_array($queryDos);
		if(empty($data1)){
			$data = $data2;
		}else{
			$data = $data1;
		}
		return $data;
	}	
	
}