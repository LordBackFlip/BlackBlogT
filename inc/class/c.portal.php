<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
class tsPortal{

	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*\
								PUBLICAR POSTS
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    /** getNews()
     * @access public
     * @param 
     * @return array
     */
     public function getNews(){
        // MURO RECIENTES
        include(TS_CLASS."c.muro.php");
        $tsMuro = new tsMuro();
        return $tsMuro->getNews(0);
     }
    /** getDestacados()
     * @access public
     * @param 
     * @return array
     */	 
     public function getDestacados(){
        // MURO DESTACADOS
        include(TS_CLASS."c.muro.php");
        $tsMuro = new tsMuro();
        return $tsMuro->getDestacados(0);
     }
    /** getPopulares()
     * @access public
     * @param 
     * @return array
     */	 
     public function getPopulares(){
        // MURO DESTACADOS
        include(TS_CLASS."c.muro.php");
        $tsMuro = new tsMuro();
        return $tsMuro->getPopulares(0);
     }
    /** getPublico()
     * @access public
     * @param 
     * @return array
     */	 
     public function getPublico(){
        // MURO DESTACADOS
        include(TS_CLASS."c.muro.php");
        $tsMuro = new tsMuro();
        return $tsMuro->getPublico(0);
     }	 
    
		 	
	//USURIOS RECOMENDADOS
	function getRecomendados(){
		global $tsUser;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT u.user_id, u.user_name, p.p_nombre FROM u_miembros AS u LEFT JOIN u_perfil AS p ON p.user_id = u.user_id WHERE u.user_id != \''.$tsUser->uid.'\' && u.user_baneado = \'0\' && u.user_activo = \'1\' ORDER BY RAND() LIMIT 4');
		$data = result_array($query);
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

	//OBTENER Y MOSTRAR TUS PINS
	function getPins(){
		global $tsCore, $tsUser;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p_user,p_data,pid FROM `u_pins` WHERE p_user = '.$tsUser->uid.' ORDER BY pid ASC LIMIT 10');
		$data = result_array($query);
		return $data;
	}	
	
	//AGREGAR NUEVO PIN
	function AddPin(){
		global $tsCore, $tsUser;
		$cuerpo = $tsCore->setSecure($_POST['cuerpo']);
		$cuerpo = preg_replace("/#([A-Za-z0-9_-ñÑçÇáÁäÄàÀâÂéÉëËèÈêÊíÍïÏìÌîÎóÓöÖòÒôÔúÚüÜùÙûÛ]+)/", "<a href=/mi/pin?q=%23$1>$0</a>", $cuerpo );
		if(strlen($cuerpo) <= 0) return '0: Tu Pin debe tener al menos una letra.';		
		$q1 = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT pid FROM u_pins WHERE p_user = \''.$tsUser->uid.'\' AND p_data = \''.$cuerpo.'\' LIMIT 1'));		
		$q2 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT pid FROM u_pins WHERE p_user = \''.$tsUser->uid.'\'');
        $likes = result_array($q2);        
		$total = count($likes);
		if(empty($q1)){
			if($total < 10){
				db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_pins (p_user, p_data, p_fecha) VALUES (\''.$tsUser->uid.'\', \''.$cuerpo.'\', \''.time().'\')');
			} else return '0: No puedes tener más de <b>10</b> pins';
		} else return '0: Ya tienes ese pin';
	}
	
	//ELIMINAR PIN
	function DeletPin(){
		global $tsCore, $tsUser;
		$id = $tsCore->setSecure($_POST['id']);
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `pid` FROM `u_pins` WHERE `pid` = \''.(int)$id .'\' LIMIT 1');
		$data = db_exec('fetch_assoc', $query);    		
		if(!empty($data['pid'])){
			db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM u_pins WHERE pid = \''.(int)$id.'\'');
		}else return '0: El pin que intentas eliminar no existe';	
	}
		
	//AGREGAR HASHTAGS A PINS
	function getHasPin(){
		global $tsCore, $tsUser;
		$id = $tsCore->setSecure($_POST['id']);
		$q = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p_tags, id FROM u_muro_tags WHERE id = \''.(int)$id.'\' LIMIT 1');
		$data = db_exec('fetch_assoc', $q);	
		$pin = '<a href=/mi/pin?q=%23'.$data['p_tags'].'>#'.$data['p_tags'].'</a>';
		$q1 = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT pid FROM u_pins WHERE p_user = \''.$tsUser->uid.'\' AND p_data = \''.$pin.'\' LIMIT 1'));		
		$q2 = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT pid FROM u_pins WHERE p_user = \''.$tsUser->uid.'\'');
        $likes = result_array($q2);        
		$total = count($likes);		
		if($total < 10){
			if(empty($q1)){
				$pin = '<a href=/mi/pin?q=%23'.$data['p_tags'].'>#'.$data['p_tags'].'</a>';	
				db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_pins (p_user, p_data, p_fecha) VALUES (\''.$tsUser->uid.'\', \''.$pin.'\', \''.time().'\')');					
			} else return '0: Ya tienes ese pin';		
		} else return '0: No puedes tener más de <b>10</b> pins';	
	}

	//OBTENER Y MOSTRAR LOS USUARIOS QUE SIGO Y ESTAN CONECTADOS
	function getSeguidos(){
		global $tsCore, $tsUser;	
		//COMPROBAR QUE LO ESTOY SIGUIENDO
        $q = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT f_id FROM u_follows WHERE f_user = \''.$tsUser->uid.'\' AND f_type = \'1\'');
        $follows = result_array($q);
        foreach($follows as $key => $val){
			$amigos[] = "'".$val['f_id']."'";
        }
		//COMPROBAR QUE ESTA CONECTADO
        $amigos[] = "'$tsUser->uid'";
        $amigos = implode(', ',$amigos);
		$is_online = (time() - ($tsCore->settings['c_last_active'] * 60));		
		//OBTENEMOS LOS USUARIOS CONECTADOS Y QUE SEGUIMOS
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT user_id, user_name FROM u_miembros WHERE user_lastactive > \''.$is_online.'\' AND user_id IN('.$amigos.') AND user_id != \''.$tsUser->uid.'\' ORDER BY user_id ASC LIMIT 21');
		$data['data'] = result_array($query);
		$data['numero'] = count($data['data']);
		//ESTADISTICAS DEL USUARIO
		$data['stats']['posts'] = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT f.follow_id FROM u_follows AS f LEFT JOIN p_posts AS p ON f.f_id = p.post_id WHERE f.f_user = \''.$tsUser->uid.'\' && f.f_type = \'2\' &&  p.post_status = \'0\''));
		$data['stats']['siguiendo'] = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT f.follow_id FROM u_follows AS f LEFT JOIN u_miembros AS m ON m.user_id = f.f_id WHERE f.f_user = \''.$tsUser->uid.'\' && f.f_type = \'1\' && m.user_activo = \'1\' && m.user_baneado = \'0\''));				
		$data['stats']['comunidades'] = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_user = \''.$tsUser->uid.'\' && f_type = \'4\''));
		$data['stats']['temas'] = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_user = \''.$tsUser->uid.'\' && f_type = \'5\''));
		//
		return $data;		
	}
	
	//CUMPLEAÑOS DE USUARIOS QUE SIGO
	function getCumple(){	
		global $tsUser, $tsCore;
		// ZONA HORARIO
		date_default_timezone_set("America/Mexico_City");
		// TIEMPO	
		$mes = date("m",time());
		$dia = date("d",time());
		$ano = date("Y",time());        
		// DATOS
		$query = db_exec(array(__FILE__, __LINE__), 'query', '
		SELECT u.user_id, u.user_name, p.user_ano, f.f_id FROM u_follows AS f LEFT JOIN u_miembros AS u ON f.f_id = u.user_id LEFT JOIN u_perfil AS p ON p.user_id = u.user_id WHERE f.f_user = \''.$tsUser->uid.'\' AND f.f_type = 1 AND p.user_dia = \''.$dia.'\' AND p.user_mes = \''.$mes.'\' AND f.f_id IN(u.user_id)');
		$data['data'] = result_array($query);
		// TOTAL
		$data['total'] = count($data['data']);
		// AÑO ACTUAL
		$data['ano'] = $ano;			
		// RETORNO	
		return $data;
	}	

	//LIMPIAR NOTIFICACIONES DEL MI
	function CleanNoti() {
		global $tsUser, $tsCore;
		db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_monitor SET not_menubar = \'0\', not_monitor = \'0\' WHERE user_id = \''.$tsUser->uid.'\' AND not_type = 60 AND not_monitor = \'1\'');
	}

	//BUSCAR EN LOS SHOUTS
	function getShouts(){
		global $tsCore, $tsUser;
		$q = $tsCore->setSecure($_GET['q']);
        //BUSCAR PALABRA EN EL CONTENIDO DEL SHOUT
		$trozos = explode(" ",$q); 
		$numero = count($trozos);
		if ($numero == 1) {
			$hash = "p.p_body LIKE '%$q%'";
		} elseif ($numero > 1) {		
			$hash = 'MATCH(p.p_body) AGAINST(\''.$q.'\' IN BOOLEAN MODE)';
		}		
        // PAGINAS
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(p.pub_id) AS total FROM u_muro AS p WHERE '.$hash.'');
        $total = db_exec('fetch_assoc', $query);
        $total = $total['total'];
		$data['pages'] = $tsCore->getPagination($total, 7);
        //RESULTADOS
		$ca = 'a.adj_id, a.a_title, a.a_url, a_img, a.a_desc';
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, '.$ca.', u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user = u.user_id LEFT JOIN u_muro_adjuntos AS a ON p.pub_id = a.pub_id WHERE '.$hash.' ORDER BY p.p_date DESC LIMIT '.$data['pages']['limit']);
        $data['data'] = result_array($query);
        // ACTUALES
        $total = explode(',',$data['pages']['limit']);
        $data['total'] = ($total[0]) + count($data['data']);
        //
        return $data;				
	}	
	
}