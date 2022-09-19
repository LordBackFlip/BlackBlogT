<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Modelo para el control de los tops
 *
 * @name    c.tops.php
 * @author  PHPost Team
 */
class tsTops {

	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*\
								TOPS Y ESTADISTICAS
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*
		getHomeTopPosts()
		: TOP DE POST semana, histórico
	*/
	function getHomeTopPosts(){
		global $tsCore;
		$tipo = $tsCore->setSecure(intval($_GET['tipo']));
		if($tipo){
			$data = $this->getHomeTopPostsQuery($this->setTime($tipo));
		}else{
			$data = $this->getHomeTopPostsQuery($this->setTime(5));//TOP HISTORICO
		}
		return $data;
	}
	/*
		getHomeTopUsers()
		: TOP DE USUARIOS semana, histórico
	*/
	function getHomeTopUsers(){
		global $tsCore;
		$tipo = $tsCore->setSecure(intval($_GET['tipo']));
		if($tipo){
			$data = $this->getHomeTopUsersQuery($this->setTime($tipo));
		}else{
			$data = $this->getHomeTopUsersQuery($this->setTime(5));//TOP HISTORICO
		}
		return $data;
	}
    /*
        getTopUsers()
    */
    function getTopUsers($fecha = NULL, $cat = NULL){
        //
        $data = $this->setTime($fecha);
        $category = empty($cat) ? '' : 'AND post_category = '.$cat;
		// PUNTOS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT SUM(p.post_puntos) AS total, u.user_id, u.user_name FROM p_posts AS p LEFT JOIN u_miembros AS u ON p.post_user = u.user_id WHERE p.post_status = 0  AND p.post_date BETWEEN '.$data['start'].' AND '.$data['end'].' '.$category.' GROUP BY p.post_user ORDER BY total DESC LIMIT 10');
        $array['puntos'] = result_array($query);
        
        // SEGUIDORES
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(f.follow_id) AS total, u.user_id, u.user_name FROM u_follows AS f LEFT JOIN u_miembros AS u ON f.f_id = u.user_id WHERE f.f_type = 1 AND f.f_date BETWEEN '.$data['start'].' AND '.$data['end'].' GROUP BY f.f_id ORDER BY total DESC LIMIT 10');
        $array['seguidores'] = result_array($query);
        
		// MEDALLAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(m.medal_for) AS total, u.user_id, u.user_name, wm.medal_id FROM w_medallas_assign AS m LEFT JOIN u_miembros AS u ON m.medal_for = u.user_id LEFT JOIN w_medallas AS wm ON wm.medal_id = m.medal_id WHERE wm.m_type = \'1\' AND m.medal_date BETWEEN '.$data['start'].' AND '.$data['end'].' GROUP BY m.medal_for ORDER BY total DESC LIMIT 10');
        $array['medallas'] = result_array($query);
        
        //
        return $array;
    }
	/*
        getTopComus()
    */
    function getTopComus($fecha = NULL){
        $data = $this->setTime($fecha);
/*		
		// MIEMBROS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(m.m_id) AS total, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_miembros AS m LEFT JOIN c_comunidades AS c ON m.m_comunidad = c.c_id WHERE m.m_permisos > \'0\' AND c.c_estado = \'0\' AND m.m_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' GROUP BY m.m_comunidad ORDER BY total DESC LIMIT 10');
        $array['miembros'] = result_array($query);        
        // TEMAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t.t_id) AS total, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_comunidades AS c LEFT JOIN c_temas AS t ON t.t_comunidad = c.c_id WHERE t.t_estado = \'0\' AND c.c_estado = \'0\' AND c.c_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' GROUP BY t.t_comunidad ORDER BY total DESC LIMIT 10');
        $array['temas'] = result_array($query);   
		// SEGUIDORES
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(f.follow_id) AS total, c.c_id, c.c_nombre, c.c_nombre_corto FROM u_follows AS f LEFT JOIN c_comunidades AS c ON f.f_id = c.c_id WHERE f.f_type = 4 AND f.f_date BETWEEN '.$data['start'].' AND '.$data['end'].' GROUP BY f.f_id ORDER BY total DESC LIMIT 10');        
		$array['seguidores'] = result_array($query);
*/		
        // MIEMBROS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cat.c_seo, c.c_miembros, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_comunidades AS c LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE c.c_estado = \'0\' AND c.c_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' ORDER BY c.c_miembros DESC LIMIT 10');
        $array['miembros'] = result_array($query);		
        // TEMAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cat.c_seo, c.c_temas, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_comunidades AS c LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE c.c_estado = \'0\' AND c.c_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' ORDER BY c.c_temas DESC LIMIT 10');
        $array['temas'] = result_array($query);		
        // SEGUIDORES
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT cat.c_seo, c.c_seguidores, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_comunidades AS c LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE c.c_estado = \'0\' AND c.c_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' ORDER BY c.c_seguidores DESC LIMIT 10');
        $array['seguidores'] = result_array($query);				
        //
        return $array;
    }
	/*
        getTopTemas()
    */
    function getTopTemas($fecha = NULL){
        //
        $data = $this->setTime($fecha);
		// VOTOS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t.t_votos_pos AS total, cat.c_seo, t.t_id, t.t_titulo, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_temas AS t LEFT JOIN c_comunidades AS c ON t.t_comunidad = c.c_id LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE t.t_estado = \'0\' AND c.c_estado = \'0\' AND t.t_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' ORDER BY total DESC LIMIT 10');
        $array['votos'] = result_array($query);
		// VISITAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t.t_visitas AS total, cat.c_seo, t.t_id, t.t_titulo, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_temas AS t LEFT JOIN c_comunidades AS c ON t.t_comunidad = c.c_id LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE t.t_estado = \'0\' AND c.c_estado = \'0\' AND t.t_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' ORDER BY total DESC LIMIT 10');
        $array['visitas'] = result_array($query);		
		// RESPUESTAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t.t_respuestas AS total, cat.c_seo, t.t_id, t.t_titulo, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_temas AS t LEFT JOIN c_comunidades AS c ON t.t_comunidad = c.c_id LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE t.t_estado = \'0\' AND c.c_estado = \'0\' AND t.t_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' ORDER BY total DESC LIMIT 10');
        $array['respuestas'] = result_array($query);				
		// SEGUIDORES
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT t.t_seguidores AS total, cat.c_seo, t.t_id, t.t_titulo, c.c_id, c.c_nombre, c.c_nombre_corto FROM c_temas AS t LEFT JOIN c_comunidades AS c ON t.t_comunidad = c.c_id LEFT JOIN c_categorias AS cat ON cat.cid = c.c_categoria WHERE t.t_estado = \'0\' AND c.c_estado = \'0\' AND t.t_fecha BETWEEN '.$data['start'].' AND '.$data['end'].' ORDER BY total DESC LIMIT 10');
        $array['seguidores'] = result_array($query);						
		//
        return $array;
    }	
	/*
		getTopPosts()
	*/
	function getTopPosts($fecha = NULL, $cat = NULL){
		// PUNTOS
		$data['puntos'] = $this->getTopPostsVars($fecha, $cat, 'puntos');
		// SEGUIDORES
		$data['seguidores'] = $this->getTopPostsVars($fecha, $cat, 'seguidores');
		// COMENTARIOS
		$data['comments'] = $this->getTopPostsVars($fecha, $cat, 'comments');
		// FAVORITOS
		$data['favoritos'] = $this->getTopPostsVars($fecha, $cat, 'favoritos');
		//
		//
		return $data;
	}
	/*
		setTopPostsVars($text, $type)
	*/
	function getTopPostsVars($fecha = NULL, $cat = NULL, $type = NULL){
		//
		$data = $this->setTime($fecha);
		if(!empty($cat)) $data['scat'] = 'AND c.cid = '.$cat;
		//
		$data['type'] = 'p.post_'.$type;

		//
		return $this->getTopPostsQuery($data);
	}
	/*
		getTopPostsQuery($data)
	*/
	function getTopPostsQuery($data = NULL){
		
		//
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_id, p.post_category, '.$data['type'].', p.post_puntos, p.post_title, c.c_seo, c.c_img FROM p_posts AS p LEFT JOIN p_categorias AS c ON c.cid = p.post_category  WHERE p.post_status = \'0\' AND p.post_date BETWEEN '.$data['start'].' AND '.$data['end'].' '.$data['scat'].' ORDER BY '.$data['type'].' DESC LIMIT 10');
        $datos = result_array($query);
		
		//
		return $datos;
	}
	/*
		getHomeTopPostsQuery($data)
	*/
	function getHomeTopPostsQuery($date = NULL){
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_portada, p.post_id, p.post_user, p.post_category, p.post_title, p.post_puntos, c.c_seo FROM p_posts AS p LEFT JOIN p_categorias AS c ON c.cid = p.post_category  WHERE p.post_status = \'0\' AND p.post_date BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\' ORDER BY p.post_puntos DESC LIMIT 15');
		$data = result_array($query);
		//
		return $data;
	}
	
    /*
        getHomeTopUsersQuery($date)
    */
    function getHomeTopUsersQuery($date = NULL){
		// PUNTOS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT SUM(p.post_puntos) AS total, u.user_id, u.user_name FROM p_posts AS p LEFT JOIN u_miembros AS u ON p.post_user = u.user_id WHERE p.post_status = 0  AND p.post_date BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\' GROUP BY p.post_user ORDER BY total DESC LIMIT 15');
        $data = result_array($query);
        //
        return $data;
    }
	/*
		getStats() : NADA QUE VER CON LA CLASE PERO BUENO PARA AHORRAR ESPACIO...
		: ESTADISTICAS DE LA WEB
	*/
	function getStats(){
		global $tsCore;
		// OBTENEMOS LAS ESTADISTICAS
        $return = db_exec('fetch_assoc', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT stats_max_online, stats_max_time, stats_time, stats_time_cache, stats_miembros, stats_posts, stats_fotos, stats_comments, stats_foto_comments FROM w_stats WHERE stats_no = \'1\''));
        
//        if($return['stats_time_cache'] < time()-($tsCore->settings['c_stats_cache']*60)){
        $q1 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(user_id) AS u FROM u_miembros WHERE user_activo = \'1\' && user_baneado = \'0\''));
		$q2 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(post_id) AS p FROM p_posts WHERE post_status = \'0\''));
        $q3 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(foto_id) AS f FROM f_fotos WHERE f_status = \'0\''));
        $q4 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(cid) AS c FROM p_comentarios WHERE c_status = \'0\''));
        $q5 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(cid) AS fc FROM f_comentarios'));		
        $q6 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(c_id) AS com FROM c_comunidades WHERE c_estado = \'0\''));
		$q7 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(t_id) AS te FROM c_temas WHERE t_estado = \'0\''));        		
		$q8 = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT SUM(post_hits) AS total FROM p_posts'));
		//		
        $return['stats_miembros'] = $q1[0];
        $return['stats_posts'] = $q2[0];
        $return['stats_fotos'] = $q3[0];
        $return['stats_comments'] = $q4[0];
        $return['stats_foto_comments'] = $q5[0];    
		$return['stats_comunidades'] = $q6[0];
		$return['stats_temas'] = $q7[0];		        
		$return['stats_visitas'] = $q8[0];
		//
		$ndat = ', stats_time_cache = \''.time().'\', stats_miembros = \''.$return['stats_miembros'].'\', stats_posts = \''.$return['stats_posts'].'\', stats_fotos = \''.$return['stats_fotos'].'\', stats_comments = \''.$return['stats_comments'].'\', stats_foto_comments = \''.$return['stats_foto_comments'].'\'';
//        }
        // PARA SABER SI ESTA ONLINE
		$is_online = (time() - ($tsCore->settings['c_last_active'] * 60));
		// USUARIOS ONLINE - COMPROBAMOS SI CONTAMOS A TODOS LOS USUARIOS O SOLO A REGISTRADOS
		if(empty($tsCore->settings['c_count_guests'])){
		$cueri = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(user_id) AS u FROM `u_miembros` WHERE `user_lastactive` > \''.$is_online.'\''));
		}else{
        $cueri = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(DISTINCT `session_ip`) AS s FROM `u_sessions` WHERE `session_time` > \''.$is_online.'\''));
		}
        
		$return['stats_online'] = $cueri[0];
        
        if($return['stats_online'] > $return['stats_max_online']) {
            $timen = ', stats_max_online = \''.$return['stats_online'].'\', stats_max_time = \''.time().'\'';
        }
            
        db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE w_stats SET stats_time = \''.time().'\' '.$ndat.' '.$timen);
		//
		return $return;
	}
	/******************************************************************************/
	/*
		setTime($fecha)
	*/
	function setTime($fecha = NULL){
		// AHORA
		$tiempo = time();
		$dia = (int) date("d",$tiempo);
		$hora = (int) date("G",$tiempo);
		$min = (int) date("i",$tiempo);
		$seg = (int) date("s",$tiempo);
		//
		$resta = $this->setSegs($hora, 'hor') + $this->setSegs($min, 'min') + $seg;
		// TRANSFORMAR
		switch($fecha){
			// HOY
			case 1: 
				//
				$data['start'] = $tiempo - $resta;
				$data['end'] = $tiempo;
				//
			break;
			// AYER
			case 2: 
				//
				$restaDos = $resta + $this->setSegs(1,'dia') + $this->setSegs(1,'hor');
				$data['start'] = $tiempo - $restaDos;
				$data['end'] = $tiempo - $resta;
				//
			break;
			// SEMANA
			case 3: 
				//
				$restaDos = $resta + $this->setSegs(1,'sem')  + $this->setSegs(1,'hor');
				$data['start'] = $tiempo - $restaDos;
				$data['end'] = $tiempo - $resta;
				//
			break;
			// MES
			case 4: 
				//
				$restaDos = $resta + $this->setSegs(1,'mes')  + $this->setSegs(1,'hor');
				$data['start'] = $tiempo - $restaDos;
				$data['end'] = $tiempo - $resta;
				//
			break;
			// TODO EL TIEMPO
			case 5: 
				//
				$data['start'] = 0;
				$data['end'] = $tiempo;
				//
			break;			
			// 15 MINUTOS
			case 6:
				//
				$resta = $this->setSegs(1, '15min') + $this->setSegs(1, 'min') + $seg;
				$data['start'] = $tiempo - $resta;
				$data['end'] = $tiempo;
				//
			break;
			// 30 MINUTOS
			case 7:
				//
				$resta = $this->setSegs(1, '30min') + $this->setSegs(1, 'min') + $seg;
				$data['start'] = $tiempo - $resta;
				$data['end'] = $tiempo;
				//
			break;
			// 1 HORA
			case 8:
				//
				$resta = $this->setSegs(1, '1hora') + $this->setSegs(1, 'min') + $seg;
				$data['start'] = $tiempo - $resta;
				$data['end'] = $tiempo;
				//
			break;
			// 3 HORAS
			case 9:
				//
				$resta = $this->setSegs(1, '3horas') + $this->setSegs(1, 'min') + $seg;
				$data['start'] = $tiempo - $resta;
				$data['end'] = $tiempo;
				//
			break;
			// 6 HORAS
			case 10:
				//
				$resta = $this->setSegs(1, '6horas') + $this->setSegs(1, 'min') + $seg;
				$data['start'] = $tiempo - $resta;
				$data['end'] = $tiempo;
				//
			break;			
		}
		//
		return $data;
	}
	/*
		setSegs($tiempo, $tipo)
	*/
	function setSegs($tiempo = NULL, $tipo = NULL){
		//
		switch($tipo){
			case 'min' :
				$segundos = $tiempo * 60;
			break;
			case 'hor' :
				$segundos = $tiempo * 3600;
			break;
			case 'dia' :
				$segundos = $tiempo * 86400;
			break;
			case 'sem' :
				$segundos = $tiempo * 604800;
			break;
			case 'mes' :
				$segundos = $tiempo * 2592000;
			break;			
			case '1hora' :
				$segundos = $tiempo * 3600;
			break;
			case '3horas' :
				$segundos = $tiempo * 10800;
			break;
			case '6horas' :
				$segundos = $tiempo * 21600;
			break;
			case '15min' :
				$segundos = $tiempo * 900;
			break;
			case '30min' :
				$segundos = $tiempo * 1800;
			break;			
		}
		//
		return $segundos;
	}
	
	
	
	
	
	
	//POST DESTACADOS
	function getHomePostsDestacados(){
		global $tsCore;
		$tipo = $tsCore->setSecure(intval($_GET['tipo']));
		if($tipo){
			$data = $this->getPostsdDestacadosQuery($this->setTime($tipo));
		}else{
			$data = $this->getPostsdDestacadosQuery($this->setTime(10));//DESTACADOS 6 HORAS
		}
		return $data;
	}
	
	//POST DESTACADOS
	function getPostsdDestacadosQuery($date = NULL){
		global $tsCore;
		//$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_user, p.post_portada, p.post_body, p.post_id, p.post_category, p.post_title, c.c_seo, c.c_nombre FROM p_posts AS p LEFT JOIN p_categorias AS c ON c.cid = p.post_category LEFT JOIN p_comentarios AS com ON com.c_post_id = p.post_id LEFT JOIN p_favoritos AS f ON f.fav_post_id = p.post_id WHERE p.post_status = \'0\' AND (p.post_date BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\' OR com.c_date BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\' OR f.fav_date BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\') GROUP BY p.post_id ORDER BY (p.post_date && com.c_date && f.fav_date) DESC LIMIT 10');
		//A ESTE LE QUITE LA FUNCION DE ORDENAR POR COMENTARIOS HECHOS
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_user, p.post_portada, p.post_body, p.post_id, p.post_category, p.post_title, c.c_seo, c.c_nombre FROM p_posts AS p LEFT JOIN p_categorias AS c ON c.cid = p.post_category LEFT JOIN p_favoritos AS f ON f.fav_post_id = p.post_id WHERE p.post_status = \'0\' AND (p.post_date BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\' OR f.fav_date BETWEEN \''.$date['start'].'\' AND \''.$date['end'].'\') GROUP BY p.post_id ORDER BY (p.post_date && f.fav_date) DESC LIMIT 10');
		$data = result_array($query);
		return $data;
	}

	
	
	
	
	
	
	
	
	//POST RECOMENDADOS
	function getHomePostsRecomendados(){
//	function getHomePostsDestacados(){
		global $tsCore;
		$tipo = $tsCore->setSecure(intval($_GET['tipo']));
		if($tipo){
			$data = $this->getPostsdRecomendadosQuery($tipo);
		}else{
			$data = $this->getPostsdRecomendadosQuery(0);
		}
		return $data;
	}
	
	//POST RECOMENDADOS
	function getPostsdRecomendadosQuery($date = NULL){
		global $tsUser, $tsCore;
		if($date == 1){
			//FILTRO CREADOS POR USUARIOS QUE SIGUES
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT f_id FROM u_follows WHERE f_user = \''.$tsUser->uid.'\' AND f_type = \'1\'');
			$follows = result_array($query);
			foreach($follows as $key => $val){
                $amigos[] = "'".$val['f_id']."'";
			}
			$amigos[] = "'$tsUser->uid'";
			$amigos = implode(', ',$amigos);
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_user, p.post_portada, p.post_title, c.c_seo FROM p_posts AS p LEFT JOIN u_miembros AS u ON p.post_user = u.user_id LEFT JOIN p_categorias AS c ON c.cid = p.post_category WHERE p.post_user IN('.$amigos.') AND p.post_user != \''.$tsUser->uid.'\' AND p.post_sticky = \'0\' GROUP BY p.post_id ORDER BY p.post_id DESC LIMIT 5');
		}
		if($date == 2){
			//FILTRO SEGUN TUS POSTS LEIDOS
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_user, p.post_portada, p.post_id, p.post_category, p.post_title, c.c_seo FROM p_posts AS p LEFT JOIN p_categorias AS c ON c.cid = p.post_category WHERE p.post_status = \'0\' && p.post_sticky = \'0\' GROUP BY p.post_id ORDER BY RAND() DESC LIMIT 5');
		}
		if($date == 3){
			//FILTRO POR TU NAVEGACION RECIENTE
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_user, p.post_portada, p.post_id, p.post_category, p.post_title, c.c_seo FROM p_posts AS p LEFT JOIN p_categorias AS c ON c.cid = p.post_category WHERE p.post_status = \'0\' && p.post_sticky = \'0\' GROUP BY p.post_id ORDER BY RAND() DESC LIMIT 5');
		}		
		if($date == 0){
			//FILTRO LO MAS RECIENTE
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_user, p.post_portada, p.post_id, p.post_category, p.post_title, c.c_seo FROM p_posts AS p LEFT JOIN p_categorias AS c ON c.cid = p.post_category WHERE p.post_status = \'0\' && p.post_sticky = \'0\' GROUP BY p.post_id ORDER BY p.post_id DESC LIMIT 5');
		}		
		$data = result_array($query);
		return $data;
	}
	
}