<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
/**
 * Modelo para el control del muro
 *
 * @name    c.muro.php
 * @author  PHPost Team
 */
class tsMuro {
	/*
        getPrivacity()
    */
    public function getPrivacity($user_id = NULL, $username = NULL, $follow = NULL, $yfollow = NULL){
        global $tsUser;
        $priv['m']['v'] = true;
        $priv['mf']['v'] = true;
		$priv['rmp']['v'] = true;
        $is_me = ($tsUser->uid == $user_id) ? true : false;
		if($follow == 0 && $yfollow == 0) $lesigoomesigue = false; else $lesigoomesigue = true;
		if($follow == 1 && $yfollow == 1) $lesigoymesigue = true; else $lesigoymesigue = false;
        //
		$query= db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p_configs FROM u_perfil WHERE user_id = \''.(int)$user_id.'\' LIMIT 1');
        $data = db_exec('fetch_assoc', $query);
        
        $data['p_configs'] = unserialize($data['p_configs']);
        // VER MURO
        switch($data['p_configs']['m']){
            case 0:
                if(!$is_me && !$tsUser->is_admod) $priv['m']['v'] = false;
                $priv['m']['m'] = 'Lo sentimos pero '.$username.' no permite ver su muro a nadie.';
            break;
			case 1:
                if(!$lesigoymesigue && !$is_me && !$tsUser->is_admod) $priv['m']['v'] = false;
                $priv['m']['m'] = 'Debes seguir a '.$username.' y &eacute;ste debe seguirte para poder ver su muro.';
            break;
			case 2:
                if(!$lesigoomesigue && !$is_me && !$tsUser->is_admod) $priv['m']['v'] = false;
                $priv['m']['m'] = 'Debes seguir a '.$username.' o &eacute;ste debe seguirte para poder ver su muro.';
            break;
            case 3:
                if($follow == 0 && !$is_me && !$tsUser->is_admod) $priv['m']['v'] = false;
                $priv['m']['m'] = 'Debes seguir a '.$username.' para poder ver su muro.';
            break;
			case 4:
                if($yfollow == 0 && !$is_me && !$tsUser->is_admod) $priv['m']['v'] = false;
                $priv['m']['m'] = $username.' debe seguirte para que puedas ver su muro';
            break;
            case 5:
                if(!$tsUser->is_member) $priv['m']['v'] = false;
                $priv['m']['m'] = 'Solo usuarios <a hrer="/registro/">registrados</a> pueden ver el muro de '.$username;
            break;
        }
        // FIRMAR MURO
        switch($data['p_configs']['mf']){
            case 0:
                if(!$is_me && !$tsUser->is_admod) $priv['mf']['v'] = false;
                $priv['mf']['m'] = 'Lo sentimos pero '.$username.' no permite firmar su muro a nadie.';
            break;
			case 1:
                if(!$lesigoymesigue && !$is_me && !$tsUser->is_admod) $priv['mf']['v'] = false;
                $priv['mf']['m'] = 'Debes seguir a '.$username.' y &eacute;ste debe seguirte para poder firmar y comentar su muro.';
            break;
			case 2:
                if(!$lesigoomesigue && !$is_me && !$tsUser->is_admod) $priv['mf']['v'] = false;
                $priv['mf']['m'] = 'Debes seguir a '.$username.' o &eacute;ste debe seguirte para poder firmar y comentar su muro.';
            break;
            case 3:
                if($follow == 0 && !$is_me && !$tsUser->is_admod) $priv['mf']['v'] = false;
                $priv['mf']['m'] = 'Debes seguir a '.$username.' para poder firmar y comentar su muro.';
            break;
			case 4:
                if($yfollow == 0 && !$is_me && !$tsUser->is_admod) $priv['mf']['v'] = false;
                $priv['mf']['m'] = $username.' debe seguirte para que puedas firmar y comentar su muro';
            break;
            case 5:
                if(!$tsUser->is_member) $priv['mf']['v'] = false;
                $priv['mf']['m'] = 'Solo usuarios <a href="/registro/">registrados</a> pueden firmar el muro de '.$username;
            break;
        }
        //
        return $priv;
    }
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    /*
        ajaxCheck()
    */
    public function ajaxCheck($return = false, $urlin = null){
        global $tsCore;
        //		
        $type = $tsCore->setSecure($_GET['type'], true);
        $url = empty($urlin) ? $_POST['url'] : $urlin;
        // VALIDAR
        if(empty($url)) return '0: El campo <b>url</b> es obligatorio.';
        //
        switch($type){
            // VALIDAR UNA FOTO
            case 'foto':
                if(strlen($url) > 300) return '0: La url de la imagen es demasiado larga.';
                $data = getimagesize($url);
                // TAMAÑO MINIMO
                $min_w = 130;
                $min_h = 130;
                // MAX PARA EVITAR CARGA LENTA
                $max_w = 1024;
                $max_h = 1024;
                //
                if(empty($data[0])) return '0: La url ingresada no existe o no es una imagen v&aacute;lida.';
                elseif($data[0] < $min_w || $data[1] < $min_h) return '0: Tu foto debe tener un tama&ntilde;o superior a 130x130 pixeles.';
                elseif($data[0] > $max_w || $data[1] > $max_h) return '0: Tu foto debe tener un tama&ntilde;o menor a 1024x1024 pixeles.';
                else {
                    if($return == false) return '1: <center><img src="'.$tsCore->setSecure($url, true).'"/></center>';
                    else return $tsCore->setSecure($url, true);
                }
            break;
            // VALIDAR URL
            case 'enlace':
                // VALIDAR
                if(strlen($url) > 400) return '0: La url es demasiado larga.';
                $data = $tsCore->getUrlContent($url);
                // VALIDAR #1
                if(!$data) return '0: El enlace ingresado no es v&aacute;lido, no esta disponible o no existe.';
                // OBTENER META TITULO
                $title = explode('<title>',$data);
                $title = explode('</title>',$title[1]);
                $title = empty($title[0]) ? $url : $title[0];
                // VALIDAR #2
                if(!$title) return '0: La url ingresada no es una p&aacute;gina web v&aacute;lida.';
                // RETORNAMOS HTML/VALOR
                if($return == false) return '1: <center><a href="'.$url.'" target="_blank">'.$tsCore->setSecure($title, true).'</a><br/><span class="desc">'.$tsCore->setSecure($url, true).'</span></center>';
                else return array('title' => $tsCore->setSecure($title, true), 'url' => $tsCore->setSecure($url, true));
            break;
            // VALIDAR UN VIDE DE YOUTUBE
            case 'video':
                // VALIDAR #1
                $video_id = explode('watch?v=',$url);
                if(!is_array($video_id)) return '0: La direcci&oacute;n del video no es v&aacute;lida.';
                // VALIDAR #2
                $video_id = substr($video_id[1],0,11);
                if(strlen($video_id) != 11) return '0: La direcci&oacute;n del video no es v&aacute;lida.';
                // META TAGS
                $data = @get_meta_tags('http://www.youtube.com/watch?v='.$video_id);
                if(empty($data['title'])) return '0: La URL contiene un ID de video incorrecto o el video ha sido eliminado.';
                else {
                    $description = str_replace('<br>','',html_entity_decode($data['description']));
                    // RETORNAMOS HTML/VALORES
                    if($return == false)
                    return '1: <div class="vContent"><img src="http://img.youtube.com/vi/'.$video_id.'/0.jpg" class="thumb"/><div class="vDesc"><strong><a href="http://www.youtube.com/watch?v='.$video_id.'" target="_blank">'.$data['title'].'</a></strong><div style="margin-top:5px">'.$description.'</div></div><div class="clearBoth"></div></div>';
                    else return array('ID' => $video_id, 'title' => $tsCore->setSecure($data['title'], true), 'desc' => $tsCore->setSecure(substr($description,0,160)), true);
                }
                //
                
            break;
            default:
                return '0: El campo <b>type</b> es obligatorio.';
            break;
        }
    }
    /* 
        streamPost()
    */
    public function streamPost(){
        global $tsCore, $tsUser, $tsMonitor, $tsActividad;
        //PRIVACIDAD DEL SHOUT
        $privacidad = $tsCore->setSecure($_POST['privacidad']);
		//
		$pid = intval($_POST['pid']);
		$data = $tsCore->setSecure($_POST['data'], true);
        $adj = $tsCore->setSecure($_POST['adj'], true);
        $type = $tsCore->setSecure($_GET['type'], true);
		//DAR ESTILO A LOS HASHTAGS
		$data = preg_replace("/#([A-Za-z0-9_-ñÑçÇáÁäÄàÀâÂéÉëËèÈêÊíÍïÏìÌîÎóÓöÖòÒôÔúÚüÜùÙûÛ]+)/", "<a href=/buscar/mi/?q=%23$1>$0</a>", $data);		
        // VALIDAMOS SI EXISTE EL PERFIL/USUARIO
        $exists = $tsUser->getUserName($pid);
        if(empty($exists)) return '0: El usuario al que intentas comentar no existe.';
        // VERIFICAR QUE PERMITA COMPARTIR EN SU MURO
		include 'c.cuenta.php';
		$tsCuenta = new tsCuenta();
		$priv = $this->getPrivacity($pid, $exists, $tsCuenta->iFollow($pid), $tsCuenta->yFollow($pid));
		// SE PERMITE FIRMAR EL MURO?
		if($priv['mf']['v'] == false) return '0: '.$priv['mf']['m'];
        // VARIABLES COMUNES
        $date = time(); 
		$_SERVER['REMOTE_ADDR'] = $_SERVER['X_FORWARDED_FOR'] ? $_SERVER['X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
        // TIPO DE PUBLICACION
        switch($type){
            // PUBLICAR STATUS/PUBLICACION
            case 'status':
                //$text = preg_replace('# +#',"",$data);
                $text = str_replace(array("\n","\t",' '),"",$data);
                // VACIO?
                if(strlen($text) <= 0) return '0: Tu publicaci&oacute;n debe tener al menos una letra.';
                // ANTI FLOOD
                $tsCore->antiFlood();
                //				//
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro (p_user, p_user_pub, p_body, p_date, p_type, p_ip, p_privacidad) VALUES (\''.(int)$pid.'\', \''.$tsUser->uid.'\', \''.$data.'\', \''.$date.'\', \'1\', \''.$_SERVER['REMOTE_ADDR'].'\', \''.(int)$privacidad.'\') ')){
                    $pub_id = db_exec('insert_id');
                    //
                    $type = ($pid == $tsUser->uid) ? 'status' : 'mpub';
                    // RETORNAMOS DATOS PARA EL TEMPLATE
                    $return = array('p_privacidad' => $privacidad, 'pub_id' => $pub_id, 'p_user' => $pid, 'p_user_pub' => $tsUser->uid, 'p_body' => $tsCore->parseBadWords($tsCore->parseBBCode($tsCore->setMenciones($data)), true), 'p_date' => $date, 'p_comments' => 0, 'p_shared' => 0, 'p_favoritos' => 0, 'p_likes' => 0, 'p_type' => 1, 'likes' => array('link' => 'Me gusta'));
                }
            break;
             // PUBLICAR FOTO
            case 'foto':
                // VALIDAMOS
                $foto = $this->ajaxCheck(true, $adj);
                if(substr($foto,0,1) == '0') return $foto;
                // ANTI FLOOD
                $tsCore->antiFlood();
                // INSERTAMOS
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro (p_user, p_user_pub, p_body, p_date, p_type, p_ip) VALUES (\''.(int)$pid.'\', \''.$tsUser->uid.'\', \''.$tsCore->setSecure($data, true).'\', \''.$date.'\', \'2\', \''.$tsCore->setSecure($_SERVER['REMOTE_ADDR']).'\')')){
                    $pub_id = db_exec('insert_id');
                    // INSERTAR ADJUNTO
					if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_adjuntos (pub_id, a_url, a_img) VALUES (\''.(int)$pub_id.'\', \''.$tsCore->setSecure($foto, true).'\', \''.$tsCore->setSecure($foto, true).'\') ')){
                        $type = 'mfoto';
                        // RETORNAMOS DATOS PARA EL TEMPLATE
                        $return = array('pub_id' => $pub_id, 'p_user' => $pid, 'p_user_pub' => $tsUser->uid, 'p_body' => $tsCore->setMenciones($data), 'p_date' => $date, 'p_comments' => 0, 'p_shared' => 0, 'p_favoritos' => 0, 'p_likes' => 0, 'p_type' => 2, 'likes' => array('link' => 'Me gusta'), 'a_url' => $foto, 'a_img' => $foto);   
                    }
                }
            break;
            // PUBLICAR ENLACE
            case 'enlace':
                // VALIDAR
                $enlace = $this->ajaxCheck(true, $adj);
                // ANTI FLOOD
                $tsCore->antiFlood();
                // INSERTAR
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro (p_user, p_user_pub, p_body, p_date, p_type, p_ip) VALUES (\''.(int)$pid.'\', \''.$tsUser->uid.'\', \''.$data.'\', \''.$date.'\', \'3\', \''.$_SERVER['REMOTE_ADDR'].'\' ) ')){
                    $pub_id = db_exec('insert_id');
                    // INSERTAR ADJUNTO
                    if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_adjuntos (pub_id, a_title, a_url) VALUES (\''.(int)$pub_id.'\', \''.$tsCore->setSecure($tsCore->parseBadWords($enlace['title']), true).'\', \''.$tsCore->setSecure($tsCore->parseBadWords($enlace['url']), true).'\') ')){
                        $type = 'mlink';
                        // RETORNAMOS DATOS PARA EL TEMPLATE
                        $return = array('pub_id' => $pub_id, 'p_user' => $pid, 'p_user_pub' => $tsUser->uid, 'p_body' => $tsCore->setMenciones($data), 'p_date' => $date, 'p_comments' => 0, 'p_shared' => 0, 'p_favoritos' => 0, 'p_likes' => 0, 'p_type' => 3, 'likes' => array('link' => 'Me gusta'), 'a_title' => $enlace['title'], 'a_url' => $enlace['url']);   
                    }
                }
            break;
            // PUBLICAR VIDEO
            case 'video':
                // VALIDAR
                $video = $this->ajaxCheck(true, $adj);
                // ANTI FLOOD
                $tsCore->antiFlood();
                // INSERTAR
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro (p_user, p_user_pub, p_body, p_date, p_type, p_ip) VALUES (\''.(int)$pid.'\', \''.$tsUser->uid.'\', \''.$tsCore->setSecure($data, true).'\', \''.$date.'\', \'4\', \''.$tsCore->setSecure($_SERVER['REMOTE_ADDR']).'\') ')){
                    $pub_id = db_exec('insert_id');
                    // INSERTAR ADJUNTO
					if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_adjuntos (pub_id, a_title, a_url, a_img, a_desc) VALUES (\''.(int)$pub_id.'\', \''.$tsCore->setSecure($tsCore->parseBadWords($video['title']), true).'\', \''.$video['ID'].'\', \'\', \''.$tsCore->setSecure($tsCore->parseBadWords($video['desc']), true).'\') ')){
                        $type = 'mvideo';
                        // RETORNAMOS DATOS PARA EL TEMPLATE
                        $return = array('pub_id' => $pub_id, 'p_user' => $pid, 'p_user_pub' => $tsUser->uid, 'p_body' => $tsCore->setMenciones($data), 'p_date' => $date, 'p_comments' => 0, 'p_shared' => 0, 'p_favoritos' => 0, 'p_likes' => 0, 'p_type' => 4, 'likes' => array('link' => 'Me gusta'), 'a_title' => $video['title'], 'a_url' => $video['ID'], 'a_desc' => $video['desc']);   
                    }
                }
            break;
            default:
                $return = '0: El campo <b>type</b> es obligatorio.';
            break;
        }
		//INSERTAR HASHTAG SI EXISTE
		if(preg_match_all("/#([A-Za-z0-9_-ñÑçÇáÁäÄàÀâÂéÉëËèÈêÊíÍïÏìÌîÎóÓöÖòÒôÔúÚüÜùÙûÛ]+)/",$data,$tags)){
			$tags2 = str_replace("006595",' ' ,$tags);
			$hash = $tags2[1]; //Sin ##
			foreach($hash as $tag){
				$save_tags = "$tag";
				if($save_tags=='006595'){ 
					$save_tags='1';
				}
				if($save_tags != '1'){
					db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_tags (p_id, p_tags, p_date) VALUES (\''.(int)$pub_id.'\', \''.$tsCore->setSecure($save_tags, true).'\', \''.time().'\')');	
				}
			}
		}		
        //
        $return['user_name'] = $tsUser->nick;
        // MONITOR        
		$this->menTi2($pub_id, $pid, $data);		
		$tsMonitor->setNotificacion(12, $pid, $tsUser->uid, $pub_id);
		$tsMonitor->setFollowNotificacion(60, 1, $tsUser->uid, $pub_id);
        // ACTIVIDAD
        $is_my = ($pid == $tsUser->uid) ? 0 : 2;
        $tsActividad->setActividad(10, $pub_id, $is_my);
        // RETORNAR VALOR
        return $return;
        
    }
	
	function menTi2($pub_id = NULL, $pid = NULL, $data = NULL){
		global $tsCore, $tsUser, $tsMonitor;
		preg_match_all("/\B@([a-zA-Z0-9_-]{4,16}+)\b/",$data, $users);
        $menciones = $users[1];
        if(!empty($users[1])) {
			foreach($menciones as $user){
                # COMPROBAR
				$uid = $tsUser->getUserID($tsCore->setSecure($user));
				if(!empty($uid)){
					$tsMonitor->setNotificacion(62, $uid, $tsUser->uid, $pub_id);
				}
            }
        }     
        return true;
    }	
	
    /*
        streamRepost()
    */
    function streamRepost(){
        global $tsCore, $tsUser, $tsMonitor, $tsActividad;
        //
		$data = $tsCore->parseBBCode($tsCore->parseBadWords($tsCore->setSecure($_POST['data']), true));		
        $pid = intval($_POST['pid']);
        //DAR ESTILO A LOS HASHTAGS
		$data = preg_replace("/#([A-Za-z0-9_-ñÑçÇáÁäÄàÀâÂéÉëËèÈêÊíÍïÏìÌîÎóÓöÖòÒôÔúÚüÜùÙûÛ]+)/", "<a href=/buscar/mi/?q=%23$1>$0</a>", $data);
		//
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `p_user`, `p_user_pub` FROM `u_muro` WHERE `pub_id` = \''.(int)$pid.'\' LIMIT 1');
		$pub = db_exec('fetch_assoc', $query);
        //
        if($pub['p_user'] > 0){
            // VACIO?
            $text = str_replace(array("\n","\t",' '),"",$data);
            if(strlen($text) <= 0) return '0: Tu comentario debe tener al menos una letra.';
            // ANTI FLOOD
            $tsCore->antiFlood();
            // CONTINUAMOS
            $date = time();
			$_SERVER['REMOTE_ADDR'] = $_SERVER['X_FORWARDED_FOR'] ? $_SERVER['X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
            if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `u_muro_comentarios` (`pub_id`, `c_user`, `c_date`, `c_body`, `c_ip`) VALUES (\''.(int)$pid.'\', \''.$tsUser->uid.'\', \''.$date.'\', \''.$tsCore->setSecure($data, true).'\', \''.$_SERVER['REMOTE_ADDR'].'\')')){
                $cid = db_exec('insert_id');
				//INSERTAR HASHTAG SI EXISTE
				if(preg_match_all("/#([A-Za-z0-9_-ñÑçÇáÁäÄàÀâÂéÉëËèÈêÊíÍïÏìÌîÎóÓöÖòÒôÔúÚüÜùÙûÛ]+)/",$data,$tags)){
					$tags2 = str_replace("006595",' ' ,$tags);
					$hash = $tags2[1]; //Sin ##
					foreach($hash as $tag){
						$save_tags = "$tag";
						if($save_tags=='006595'){ 
							$save_tags='1';
						}
						if($save_tags != '1'){
							db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_tags (p_id, p_tags, p_date) VALUES (\''.(int)$pid.'\', \''.$tsCore->setSecure($save_tags, true).'\', \''.time().'\')');	
						}
					}
				}		
                // MONITOR
                $tsMonitor->setMuroRepost($pid, $pub['p_user'], $pub['p_user_pub']);
                // ACTIVIDAD
                $is_my = ($pub['p_user'] == $tsUser->uid) ? 1 : 3;
                $tsActividad->setActividad(10, $cid, $is_my);
                // UPDATES
                db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_muro` SET `p_comments` = p_comments + 1 WHERE `pub_id` = \''.(int)$pid.'\'');
                // PARA LA PANTILLA
				return array('cid' => $cid, 'c_body' => $tsCore->parseBadWords($tsCore->parseBBCode($data, true)), 'c_date' => $date, 'c_user' => $tsUser->uid, 'c_likes' => 0, 'like' => 'Me gusta','user_name' => $tsUser->nick);
			} else return '0: '.show_error('Error al ejecutar la consulta de la l&iacute;nea '.__LINE__.' de '.__FILE__.'.', 'db');
        } else return '0: La publicaci&oacute;n no existe.';
    }
	
    /*
        getNews()
    */
    function getNews($start = 0, $limit = 10, $tipo = NULL){
        global $tsUser, $tsCore;
//		$tipo = $tsCore->setSecure(intval($_GET['tipo']));
        // SOLO MOSTRAREMOS LAS ULTIMAS 100 PUBLICACIONES
        if($start > 90) return array('total' => '-1');
        // SEGUIDORES
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT f_id FROM u_follows WHERE f_user = \''.$tsUser->uid.'\' AND f_type = \'1\'');
        $follows = result_array($query);
        // ORDENAMOS 
        foreach($follows as $key => $val){
            // PERMISO PARA VER SUS PUBLICACIONES??
            $priv = $this->getPrivacity($val['f_id'], null, true);
            if($priv['m']['v'] == true)
                $amigos[] = "'".$val['f_id']."'";
        }
        $amigos[] = "'$tsUser->uid'";
        $amigos = implode(', ',$amigos);
        // OBTENEMOS LAS ULTIMAS PUBLICACIONES
		if($tipo == 0){	
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id WHERE p.p_user IN('.$amigos.') AND p.p_user = p.p_user_pub ORDER BY p.p_date DESC LIMIT '.$start.','.$limit);
		}elseif($tipo == 1){	
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id LEFT JOIN u_muro_favoritos AS f ON f.shout_id = p.pub_id WHERE f.fuser_id = \''.$tsUser->uid.'\' ORDER BY f.favo_fecha DESC LIMIT '.$start.','.$limit);
		}elseif($tipo == 2){			
			//SHOUTS DONDE TE MENCIONAN
			$busqueda = "AND p.p_body LIKE '@%$tsUser->nick%'";
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id WHERE p.p_user_pub != '.$tsUser->uid.' '.$busqueda.' ORDER BY p.p_date DESC LIMIT '.$start.','.$limit);
		}elseif($tipo == 3){
			//REINICIAR CONTADOR DE LAS NOTIFICACIONES DE ULTIMOS POSTS DE USUARIOS QUE SIGO
			db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_monitor SET not_menubar = \'0\', not_monitor = \'0\' WHERE user_id = \''.$tsUser->uid.'\' AND not_type = 5 AND not_monitor = \'1\'');
			//ULTIMOS POSTS PUBLICADOS POR LOS USUARIOS QUE SIGUES
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_id, p.post_title, p.post_date, p.post_comments, p.post_user, p.post_body, u.user_name, c.c_nombre, c.c_seo, c.c_img FROM p_posts AS p LEFT JOIN u_miembros AS u ON p.post_user = u.user_id LEFT JOIN p_categorias AS c ON c.cid = p.post_category WHERE p.post_user IN('.$amigos.') AND p.post_user != \''.$tsUser->uid.'\' ORDER BY p.post_date DESC LIMIT '.$start.','.$limit);
			$row = result_array($query);
			//FUNCION PARA DEJAR SOLO EL CONTENIDO DEL POST
			foreach($row as $id => $data){	
				$row[$id]['c_html'] = strip_tags(substr($tsCore->LimpiarBBcode($row[$id]['post_body']), 0, 500)).'';				
			}
			$data = $row;
		}
		//
		while($row = db_exec('fetch_array', $query)){			
			//LO TENGO COMO MI FAVORITO TO-UP
            if($row['p_favoritos'] > 0){
                $row['favorito'] = $this->getPubExtras($row['pub_id'], 'favorito', $row['p_favoritos']);
            }					
			//LO HE COMPARTIDO TO-UP
            if($row['p_shared'] > 0){
                $row['compartir'] = $this->getPubExtras($row['pub_id'], 'compartir', $row['p_shared']);
            }						
            // CARGAR LIKES
            if($row['p_likes'] > 0){
                $row['likes'] = $this->getPubExtras($row['pub_id'], 'likes', $row['p_likes']);
            } else $row['likes'] = array('link' => 'Me gusta');
            // CARGAR COMENTARIOS
            if($row['p_comments'] > 0){
                $row['comments'] = $this->getPubExtras($row['pub_id'], 'comments', 2);
            }
            // MENCIONES
			$row['p_body'] = $tsCore->parseBadWords($tsCore->setMenciones($row['p_body']), true);		
            // CARGAR ADJUNTOS
            if($row['p_type'] != 1){
                $queryDos = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM u_muro_adjuntos WHERE pub_id = \''.$row['pub_id'].'\' LIMIT 1');
                $adj = db_exec('fetch_assoc', $queryDos);
                //
                $data[] = array_merge($row,$adj); 
            } else $data[] = $row;
            //
        }       
        // RETORNAMOS
        return array('total' => count($data), 'data' => $data);
    }
    /*
        getWall($count)
    */
    function getWall($user_id = NULL, $start = 0){
        global $tsCore;
        // PUBLICACION
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id WHERE p.p_user = \''.(int)$user_id.'\' ORDER BY p.pub_id DESC LIMIT '.$start.',10');
        while($row = db_exec('fetch_array', $query)){
			//LO TENGO COMO MI FAVORITO TO-UP
            if($row['p_favoritos'] > 0){
                $row['favorito'] = $this->getPubExtras($row['pub_id'], 'favorito', $row['p_favoritos']);
            }			
			//LO HE COMPARTIDO TO-UP
            if($row['p_shared'] > 0){
                $row['compartir'] = $this->getPubExtras($row['pub_id'], 'compartir', $row['p_shared']);
            }			
            // CARGAR LIKES
            if($row['p_likes'] > 0){
                $row['likes'] = $this->getPubExtras($row['pub_id'], 'likes', $row['p_likes']);
            } else $row['likes'] = array('link' => 'Me gusta');
            // CARGAR COMENTARIOS
            if($row['p_comments'] > 0){
                $row['comments'] = $this->getPubExtras($row['pub_id'], 'comments', 2);
            }
            // MENCIONES
            $row['p_body'] = $tsCore->parseBadWords($tsCore->parseSmiles($tsCore->setMenciones($row['p_body'])), true);
            // CARGAR ADJUNTOS
            if($row['p_type'] != 1){
                $queryDos = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM u_muro_adjuntos WHERE pub_id = \''.$row['pub_id'].'\' LIMIT 1');
                $adj = db_exec('fetch_assoc', $queryDos);
                
                //
                $data[] = array_merge($row,$adj); 
            } else $data[] = $row;
        }
        
        //
        return array('total' => count($data), 'data' => $data);
    }

    /*
        getPubExtras($pud_id, $type)
    */
    function getPubExtras($pub_id = NULL, $type = 'likes', $likes = 0){
        global $tsUser, $tsCore;
        //
        switch($type){
            case 'likes':
                if(empty($likes)) return array('link' => 'Me gusta', 'text' => '');
                // VARIABLES
                $data['link'] = 'Me gusta';
                $i_like = false;
                // VEMOS SI ME GUSTA
                if($tsUser->is_member){
                    $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `like_id` FROM `u_muro_likes` WHERE `user_id` = \''.$tsUser->uid.'\' AND `obj_id` = \''.(int)$pub_id.'\' AND obj_type = \'1\'');
                    $i_like = db_exec('num_rows', $query);
                       
                }				
                // TEXOS
                if($likes == 1){
                    if($i_like) {
                        $data['link'] = 'Ya no me gusta';
                        $data['text'] = 'Te gusta esto.'; 
						$data['ami'] = '1';
                    }else {
                        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT u.user_name FROM u_muro_likes AS l LEFT JOIN u_miembros AS u ON l.user_id = u.user_id  WHERE l.obj_id = \''.(int)$pub_id.'\' AND l.obj_type = \'1\'');
                        $u_like = db_exec('fetch_assoc', $query);
                        
                        //
                        $data['text'] = 'A <a href="'.$tsCore->settings['url'].'/perfil/'.$u_like['user_name'].'">'.$u_like['user_name'].'</a> le gusta esto.';
                    }
                } elseif($likes == 2){
                    if($i_like){
                        $data['link'] = 'Ya no me gusta';
						$data['ami'] = '1';
                        //
                        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT u.user_name FROM u_muro_likes AS l LEFT JOIN u_miembros AS u ON l.user_id = u.user_id  WHERE l.user_id != \''.$tsUser->uid.'\' AND l.obj_id = \''.(int)$pub_id.'\' AND l.obj_type = 1');
                        $u_like = db_exec('fetch_assoc', $query);
                        
                        //
                        $data['text'] = 'A <a href="'.$tsCore->settings['url'].'/perfil/'.$u_like['user_name'].'">'.$u_like['user_name'].'</a> y a ti os gusta esto.';
                    } else {
                        $data['text'] = 'A <a onclick="muro.show_likes('.$pub_id.', \'pub\'); return false;">'.$likes.' personas</a> les gusta esto.';
                    }
                } elseif($likes > 2){
                    if($i_like){
						$data['ami'] = '1';
                        $data['link'] = 'Ya no me gusta';
                        $data['text'] = 'A ti y a <a onclick="muro.show_likes('.$pub_id.', \'pub\'); return false;">otras '.($likes-1).' personas m&aacute;s</a> les gusta esto.';
                    } else {
                        $data['text'] = 'A <a onclick="muro.show_likes('.$pub_id.', \'pub\'); return false;">'.$likes.' personas</a> les gusta esto.';
                    }
                }
            break;
            case 'comments':
                $limit = ($likes > 0) ? "LIMIT {$likes}" : '';
                //
                $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.*, u.user_name FROM u_muro_comentarios AS c LEFT JOIN u_miembros AS u ON c.c_user = u.user_id WHERE c.pub_id = \''.(int)$pub_id.'\' ORDER BY c.c_date DESC '.$limit.'');
                while($row = db_exec('fetch_array', $query)){
                    $row['c_body'] = $tsCore->parseBadWords($tsCore->parseSmiles($tsCore->setMenciones($row['c_body'])), true);
                    $row['like'] = 'Me gusta';
                    // ME GUSTA?
                    if($row['c_likes'] > 0){
                        //
                        $cuery = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `like_id` FROM `u_muro_likes` WHERE `user_id` = \''.$tsUser->uid.'\' AND `obj_id` = \''.$row['cid'].'\' AND `obj_type` = \'2\'');
                        $i_like = db_exec('num_rows', $cuery);
                        
                        if($i_like > 0) $row['like'] = 'Ya no me gusta';
                        //
                    }
                    //
                    
                    $data[] = $row;
                }
                
                // ORDENAMOS
                asort($data);
                //
            break;
			case 'favorito':
				//LO TENGO COMO MI FAVORITO TO-UP
				$quepedo = false;
                if($tsUser->is_member){
                    $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `favo_id` FROM `u_muro_favoritos` WHERE `fuser_id` = \''.$tsUser->uid.'\' AND `shout_id` = \''.(int)$pub_id.'\' LIMIT 1');
                    $quepedo = db_exec('num_rows', $query);                       
                }				
				if($quepedo) {
					$data['si'] = '1';
				}
			break;
			case 'compartir':
				//LO HE COMPARTIDO TO-UP
				$quepedo = false;
                if($tsUser->is_member){
                    $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `compa_id` FROM `u_muro_compartir` WHERE `cuser_id` = \''.$tsUser->uid.'\' AND `shout_id` = \''.(int)$pub_id.'\' LIMIT 1');
                    $quepedo = db_exec('num_rows', $query);                       
                }				
				if($quepedo) {
					$data['si'] = '1';
				}
			break;			
        }		
        //
        return $data;
    }	
	
    /*
        getStory()
    */
    function getStory($pub_id = NULL, $user_id = NULL){
        global $tsUser, $tsCore;
        // ELEGIMOS		
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, z.user_pais, z.user_sexo, r.r_name, r.r_image, u.user_lastactive, u.user_name, u.user_seguidores, u.user_id, u.user_puntos, f.f_id FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id LEFT JOIN u_rangos AS r ON u.user_rango = r.rango_id LEFT JOIN u_perfil AS z ON u.user_id = z.user_id LEFT JOIN u_follows AS f ON u.user_id = f.f_id WHERE p.pub_id = \''.(int)$pub_id.'\' LIMIT 1');
//      $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id WHERE p.pub_id = \''.(int)$pub_id.'\' LIMIT 1');
        $pub = db_exec('fetch_assoc', $query);										
        // COMPROBAMOS
        if(empty($pub['pub_id'])) return 'La publicaci&oacute;n que has solicitado no existe.';
        elseif($user_id != $pub['p_user']) return 'La publicaci&oacute;n que has solicitado no pertenece al perfil de <b>'.$tsUser->getUserName($user_id).'</b>.';
		//LO TENGO COMO MI FAVORITO TO-UP
		if($pub['p_favoritos'] > 0){
			$pub['favorito'] = $this->getPubExtras($pub['pub_id'], 'favorito', $pub['p_favoritos']);
		}
		//LO HE COMPARTIDO TO-UP
		if($pub['p_shared'] > 0){
			$pub['compartir'] = $this->getPubExtras($pub['pub_id'], 'compartir', $pub['p_shared']);
		}		
        // CARGAR LIKES
        if($pub['p_likes'] > 0){
            $pub['likes'] = $this->getPubExtras($pub['pub_id'], 'likes', $pub['p_likes']);
        } else $pub['likes'] = array('link' => 'Me gusta'); // FIX: 08/11/2014
        // CARGAR COMENTARIOS
        if($pub['p_comments'] > 0){
            $pub['comments'] = $this->getPubExtras($pub['pub_id'], 'comments');
        }
		$pub['p_body'] = $tsCore->parseBadWords($tsCore->parseBBCode($tsCore->setMenciones($pub['p_body'])), true);
        // EXTRA
        $pub['hide_more_cm'] = true;
        // ADJUNTOS
        if($pub['p_type'] != 1){
            $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM u_muro_adjuntos WHERE pub_id = \''.(int)$pub_id.'\' LIMIT 1');
            $adj = db_exec('fetch_assoc', $query);
            $data = array_merge($pub,$adj);
        } else $data = $pub;
		/*DATOS DEL AUTOR DEL SHOUT*/
		//CALCULAR NUMERO DE SHOUTS
		$shouts = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(pub_id) AS c FROM u_muro WHERE p_user_pub = \''.$pub['user_id'].'\''));
		$data['shouts'] = $shouts[0];
		//PAIS DE ORIGEN
		include(TS_EXTRA."datos.php");
		$data['pais'] = array('icon' => strtolower($data['user_pais']),'name' => $tsPaises[$data['user_pais']]);		
        // STATUS
        $is_online = (time() - ($tsCore->settings['c_last_active'] * 60));
        $is_inactive = (time() - (($tsCore->settings['c_last_active'] * 60) * 2)); // DOBLE DEL ONLINE
        if($data['user_lastactive'] > $is_online) $data['status'] = array('t' => 'Usuario Online', 'css' => 'online');
        elseif($data['user_lastactive'] > $is_inactive) $data['status'] = array('t' => 'Usuario Inactivo', 'css' => 'inactive');
        else $data['status'] = array('t' => 'Usuario Offline', 'css' => 'offline');		
		// FOLLOWS
		if($data['user_seguidores'] > 0){
			$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_id = \''.$pub['user_id'].'\' AND f_user = \''.$tsUser->uid.'\' AND f_type = \'1\'');
			//$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT follow_id FROM u_follows WHERE f_id = \''.(int)$user_id.'\' AND f_user = \''.$tsUser->uid.'\' AND f_type = \'1\'');
			$data['follow'] = db_exec('num_rows', $query);
			
		}		
		/*FIN DATOS DEL AUTOR DEL SHOUT*/
        // RETORNAMOS
        return $data;
    }
    /*
        getComments()
    */
    function getComments(){
        global $tsCore;
        //
        $pid = (int) $_POST['pid'];
        // EXISTE?
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `p_user`, `p_comments` FROM `u_muro` WHERE `pub_id` = \''.$pid.'\' LIMIT 1');
        $cmts = db_exec('fetch_assoc', $query);
        //
        if(!empty($cmts)){
            $data['data'] = $this->getPubExtras($pid, 'comments');
            // TOTAL / USER DUEÑO DE LA APLICACION
            $data['total'] = $cmts['p_comments'];
            $data['user'] = $cmts['p_user'];
            //
            return $data;
        } else return '0: La publicaci&oacute;n no existe.';
    }
    /*
        delete()
    */
    function deletePost(){
        global $tsCore, $tsUser;
        //
        $id = $tsCore->setSecure($_POST['id']);
        $type = ($_POST['type'] == 'pub') ? 'pub' : 'cmt';
        //
        switch($type){
            case 'pub':
                // DATOS
                $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `p_user`, `p_user_pub` FROM `u_muro` WHERE `pub_id` = \''.(int)$id.'\' LIMIT 1');
                $data = db_exec('fetch_assoc', $query);                
                //
                if(!empty($data['p_user'])){
                    // SI ES EL DUEÑO DEL MURO O DE LA PUBLICACION...
                    if($data['p_user'] == $tsUser->uid || $data['p_user_pub'] == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos['moepm']){
                       if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro` WHERE `pub_id` = \''.(int)$id.'\'')){
							//ELIMINAR ACTIVIDAD 
							db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_actividad` WHERE `obj_uno` = \''.(int)$id.'\' && (`ac_type` = \'10\' || `ac_type` = \'11\') && (`obj_dos` = \'0\' || `obj_dos` = \'1\'  || `obj_dos` = \'2\'  || `obj_dos` = \'3\')');
							//ELIMINAR MONITOR
							db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_monitor` WHERE `obj_uno` = \''.(int)$id.'\' && (`obj_dos` = \'0\' || `obj_dos` = \'1\') && (`not_type` = \'12\' || `not_type` = \'13\' || `not_type` = \'14\' || `not_type` = \'60\') ');
							//BORRAMOS EL HASHTAG DEL SHOUT
							db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_tags` WHERE `p_id` = \''.(int)$id.'\'');
							//BORRAMOS LOS FAVORITOS DE LA PUBLICACION
							db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_favoritos` WHERE `shout_id` = \''.(int)$id.'\'');
							//BORRAMOS LOS COMPARTIDOS DE LA PUBLICACION
							db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_compartir` WHERE `shout_id` = \''.(int)$id.'\'');
                            // BORRAMOS LOS LIKES DE LA PUBLICACION
							db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_likes` WHERE `obj_id` = \''.(int)$id.'\' AND `obj_type` = \'1\'');
                            // BORRAMOS LOS LIKES DE TODOS LOS COMENTARIOS
							$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT `cid` FROM `u_muro_comentarios` WHERE `pub_id` = \''.(int)$id.'\'');
                            $cmnts = result_array($query);
                            // IDS A BORRAR
                            foreach($cmnts as $key => $val){
                                $delete_ids .= $val['cid'].', ';
                            }
                            db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_likes` WHERE `obj_id` IN (\''.$delete_ids.'\') AND `obj_type` = \'2\'');
                            // BORRAR COMENTARIOS
                            db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_comentarios` WHERE `pub_id` = \''.(int)$id.'\'');
                            db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_adjuntos` WHERE `pub_id` = \''.(int)$id.'\'');
                            //
                            return '1: OK';
                        } else return '0: Error';
                    } else return '0: Hmmm... &iquest;Haciendo pruebas?';
                } else return '0: La publicaci&oacute;n no existe.';
            break;
            // ELIMINAR COMENTARIO
            case 'cmt':
                // DATOS
                $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT c.cid, c.c_user, p.pub_id, p.p_user FROM u_muro_comentarios AS c LEFT JOIN u_muro AS p ON c.pub_id = p.pub_id WHERE c.cid = \''.(int)$id.'\' LIMIT 1');
                $data = db_exec('fetch_assoc', $query);
                
                //
                if(!empty($data['cid'])){
                    // SI ES EL DUEÑO DEL MURO O DEL COMENTARIO...
                    if($data['p_user'] == $tsUser->uid || $data['c_user'] == $tsUser->uid  || $tsUser->is_admod || $tsUser->permisos['moecm']){
                        if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_comentarios` WHERE `cid` = \''.(int)$id.'\'')){
                            // UPDATES
                            db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM `u_muro_likes` WHERE `obj_id` = \''.(int)$id.'\' AND `obj_type` = \'2\'');
                            db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_muro` SET `p_comments` = p_comments - 1 WHERE `pub_id` = \''.$data['pub_id'].'\'');
                            //
                            return '1: Ok';
                        }
                    } else return '0: Hmmm... &iquest;Haciendo pruebas?';
                } else return '0: El comentario no existe.';
            break;
        }
    }
    /*
        likePost()
    */
   function likePost(){
        global $tsUser, $tsCore, $tsMonitor, $tsActividad;
        // ANTI FLOOD
		$date = time();
        $text = $tsCore->antiFlood(false, 'like', 'No te pueden gustar tantas cosas en tan poco tiempo.');
        if($text != 1) return array('status' => 'error', 'text' => $text);
        //
        $id = (int)$_POST['id'];
        $type = ($_POST['type'] == 'com') ? 2 : 1;
        $status = 'ok';
        // EXISTE O NO
        $sql = ($type == 1) ? "SELECT p_user AS uid FROM u_muro WHERE pub_id = {$id}" : "SELECT c_user AS uid FROM u_muro_comentarios WHERE cid = {$id}";
        $query = db_exec(array(__FILE__, __LINE__), 'query', $sql);
        $exists = db_exec('fetch_assoc', $query);
		//
        if(empty($exists['uid'])) return '0: La publicaci&oacute;n ya no existe.';
        // CHECAMOS SI YA LE GUSTA ESTO
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT like_id, user_id FROM u_muro_likes WHERE obj_id = \''.(int)$id.'\' AND obj_type = \''.(int)$type.'\'');
        $likes = result_array($query);
		//
        $total = count($likes);
        // CHECAMOS
        $i_like = 0;
        foreach($likes as $key => $val){
            if($val['user_id'] == $tsUser->uid) $i_like = $val['like_id'];
        }
        // SI AUN NO ME GUSTA
        if(empty($i_like)){
			//if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_likes (user_id, obj_id, obj_type) VALUES (\''.$tsUser->uid.'\', \''.(int)$id.'\', \''.(int)$type.'\')')){
            if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_likes (user_id, obj_id, obj_type, like_fecha) VALUES (\''.$tsUser->uid.'\', \''.(int)$id.'\', \''.(int)$type.'\', \''.$date.'\')')){
				// SUMAR LIKE
                if($type == 1) {
					db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro SET p_likes = p_likes + 1 WHERE pub_id = \''.(int)$id.'\'');
                    $ac_type = ($exists['uid'] == $tsUser->uid) ? 0 : 2; 
                }
                else {
					db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro_comentarios SET c_likes = c_likes + 1 WHERE cid = \''.(int)$id.'\'');
                    $ac_type = ($exists['uid'] == $tsUser->uid) ? 1 : 3;
                }
                // MONITOR
                $tsMonitor->setNotificacion(14, $exists['uid'], $tsUser->uid, $id, $type);
                // ACTIVIDAD
                $tsActividad->setActividad(11, $id, $ac_type);
                //
            } else $status = 'error';
        }
        else {
			if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM u_muro_likes WHERE like_id = \''.(int)$i_like.'\'')){
                // RESTAR LIKE
				if($type == 1) db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro SET p_likes = p_likes - 1 WHERE pub_id = \''.(int)$id.'\'');
                else db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro_comentarios SET c_likes = c_likes - 1 WHERE cid = \''.(int)$id.'\'');
            }
            else $status = 'error';
        }
        // RESPUESTA
        if($type == 1){
            $t_likes = empty($i_like) ? ($total+1) : ($total-1);
            //
            $data = $this->getPubExtras($id, 'likes', $t_likes);
            $link = $data['link'];
            $text = $data['text'];
        } else {
            $t_likes = empty($i_like) ? ($total+1) : ($total-1);
            $ed_like = ($t_likes > 1) ? 's' : '';
            
            $link = empty($i_like) ? 'Ya no me gusta' : 'Me gusta';
            $text = ($t_likes > 0) ? $t_likes.' persona'.$ed_like : '';
        }
        //
        return array('status' => $status, 'link' => $link, 'text' => $text);
    }
    /*
        showLikes()
    */
    function showLikes(){
        //
        $id = intval($_POST['id']);
        $type = ($_POST['type'] == 'com') ? 2 : 1;
        //
        $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT l.user_id, u.user_name FROM u_muro_likes AS l LEFT JOIN u_miembros AS u ON l.user_id = u.user_id WHERE obj_id = \''.(int)$id.'\' AND obj_type = \''.(int)$type.'\'');
        $data = result_array($query);
        
        //
        if(empty($data)) return array('status' => 0, 'data' => 'La publicaci&oacute;n no existe.');
        //
        return array('status' => 1, 'data' => $data);
    }

	//ACTIVIDAD DEL SHOUT
    function ActividadShouts(){
		global $tsCore;
		$id = $tsCore->setSecure($_GET['id'], true);
        //ACTIVIDAD LIKES
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT l.like_fecha, l.user_id, u.user_name FROM u_muro_likes AS l LEFT JOIN u_miembros AS u ON l.user_id = u.user_id WHERE l.obj_id = \''.(int)$id.'\' AND l.obj_type = \'1\' LIMIT 10');
        $likes = result_array($query);
		$data['likes'] = $likes;
		//ACTIVIDAD FAVORITOS
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT l.favo_fecha, l.fuser_id, u.user_name FROM u_muro_favoritos AS l LEFT JOIN u_miembros AS u ON l.fuser_id = u.user_id WHERE l.shout_id = \''.(int)$id.'\' LIMIT 10');
        $favoritos = result_array($query);
		$data['favoritos'] = $favoritos;
		//ACTIVIDAD COMPARTIDOS
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT l.compa_fecha, l.cuser_id, u.user_name FROM u_muro_compartir AS l LEFT JOIN u_miembros AS u ON l.cuser_id = u.user_id WHERE l.shout_id = \''.(int)$id.'\' LIMIT 10');
        $compartir = result_array($query);
		$data['compartir'] = $compartir;
		//ACTIVIDAD COMENTARIOS
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT l.c_date, l.c_user, u.user_name FROM u_muro_comentarios AS l LEFT JOIN u_miembros AS u ON l.c_user = u.user_id WHERE l.pub_id = \''.(int)$id.'\' LIMIT 10');
        $comentarios = result_array($query);
		$data['comentarios'] = $comentarios;		
		//
		return $data;
    }	
	
	//AGREGAR SHOUT A FAVORITOS
	function ShoutFavorito(){
		global $tsCore, $tsMonitor, $tsUser;
		$fecha = time(); 
		//
		$muro = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.pub_id, p.p_user_pub, p.p_user, p.p_body, p.p_type, u.user_name FROM u_muro AS p, u_miembros AS u WHERE p.pub_id = \''.(int)$_POST['comid'].'\''));
		$favorito = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT s.favo_id, s.fuser_id, s.shout_id, u.user_name FROM u_muro_favoritos AS s LEFT JOIN u_miembros AS u ON s.fuser_id = u.user_id WHERE s.shout_id = \''.(int)$_POST['comid'].'\''));
		//CONSULTA PARA EVITAR AGREGAR A FAVORITO EL SHOUT MAS DE UNA VEZ	
		$mi_favorito = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT favo_id FROM u_muro_favoritos WHERE shout_id = \''.$muro['pub_id'].'\' && fuser_id = \''.$tsUser->uid.'\' LIMIT 1'));
		//FUNCION AGREGAR A FAVORITOS		
		if(empty($mi_favorito)){	
			db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro SET p_favoritos = p_favoritos + 1 WHERE pub_id = \''.(int)$_POST['comid'].'\'');			
			db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_favoritos (fuser_id, shout_id,favo_fecha) VALUES (\''.$tsUser->uid.'\', \''.($muro['pub_id']).'\', \''.$fecha.'\')');			     
			// MONITOR
			//$tsMonitor->setNotificacion(20, $muro['p_user'], $tsUser->uid, $pub_id);
			return '1: Shout agregado a tus favoritos';
		}		
		//FUNCION QUITAR DE FAVORITOS
		if($favorito['fuser_id'] = $tsUser->uid && $muro['pub_id'] = $favorito['shout_id']){
			db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro SET p_favoritos = p_favoritos - 1 WHERE pub_id = \''.(int)$_POST['comid'].'\'');
			db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM u_muro_favoritos WHERE shout_id = \''.(int)$_POST['comid'].'\' && fuser_id = \''.$tsUser->uid.'\'');										
			return '2: Shout eliminado de tus favoritos';
		}		
	}	
	
	//COMPARTIR SHOUT
	function ShoutCampartir($cuerpo = NULL){
		global $tsCore, $tsMonitor, $tsUser;
		$date = time(); 
		$cuerpo = preg_replace("/#([A-Za-z0-9-_ñÑçÇáÁäÄàÀâÂéÉëËèÈêÊíÍïÏìÌîÎóÓöÖòÒôÔúÚüÜùÙûÛ]+)/", "<a href=/buscar/mi/?q=%23$1>$0</a>",  $cuerpo );				
		$data = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.pub_id, p.p_user_pub, p.p_user, p.p_body, p.p_type, u.user_name FROM u_muro AS p, u_miembros AS u WHERE p.pub_id = \''.(int)$_POST['comid'].'\''));
		$data2 = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT a.pub_id, a.a_title, a.a_url, a.a_img, a.a_desc, p.pub_id FROM u_muro_adjuntos as a, u_muro AS p WHERE a.pub_id = \''.(int)$_POST['comid'].'\''));
		$data3 = db_exec('fetch_assoc', $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT s.cuser_id, s.shout_id, u.user_name FROM u_muro_compartir AS s LEFT JOIN u_miembros AS u ON s.cuser_id = u.user_id WHERE s.shout_id = \''.(int)$_POST['comid'].'\''));
		//CONDICION PARA EVITAR QUE COMPARTAS TUS PROPIOS SHOUTS
		if($data['p_user_pub'] != $tsUser->uid){				
			//CONDICION PARA EVITAR COMPARTIR SHOUT MAS DE UNA VEZ
			if(!$data3['shout_id'] == $data['pub_id'] && !$data3['cuser_id'] == $tsUser->uid){
				if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro (p_user, p_user_pub, p_body, p_date, p_type, p_ip, p_user_shared) VALUES (\''.$tsUser->uid.'\', \''.$tsUser->uid.'\', \''.($data['p_body']).'\', \''.$date.'\', \''.($data['p_type']).'\', \''.$_SERVER['REMOTE_ADDR'].'\', \''.($data['p_user']).'\')'))		
					{
						$pub_id = db_exec('insert_id');
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro SET p_compa = '.($data['p_compa'] == 1 ? '\'0\'' : '\'1\'').' WHERE pub_id = \''.(int)$pub_id.'\'');
						db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE u_muro SET p_shared = p_shared + 1 WHERE pub_id = \''.(int)$_POST['comid'].'\'');						
						if($data['p_type'] != 1){							
							db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_adjuntos (pub_id, a_title, a_url, a_img, a_desc) VALUES (\''.(int)$pub_id.'\', \''.($data2['a_title']).'\', \''.($data2['a_url']).'\', \''.($data2['a_img']).'\', \''.($data2['a_desc']).'\')');
						}
						db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO u_muro_compartir (cuser_id, shout_id,compa_fecha) VALUES (\''.$tsUser->uid.'\', \''.($data['pub_id']).'\', \''.$date.'\')');
						// MONITOR
						//$tsMonitor->setNotificacion(20, $data['p_user'], $tsUser->uid, $pub_id);
						return '2: Se ha compartido el shout de '.($tsUser->getUserName($data['p_user'])).'.';
					} else return '0: Ocurri&oacute; un error';
			} else return '0: Ya has compartido este shout';
		} else return '0: No puedes compartir tu propio shout';
	}	
	
	//USUARIOS QUE COMPARTIERON EL SHOUT
    function Compartieron($id = NULL){
		global $tsCore;
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT l.compa_fecha, l.cuser_id, u.user_name FROM u_muro_compartir AS l LEFT JOIN u_miembros AS u ON l.cuser_id = u.user_id WHERE l.shout_id = \''.(int)$id.'\' LIMIT 21');
        $compartir = result_array($query);
		$data['compartir'] = $compartir;
		return $data;
    }	
	
	//MURO DESTACADOS
    function getDestacados($start = 0, $limit = 10, $tipo = NULL){
        global $tsUser, $tsCore;
		//OBTENER TIEMPO ACTUAL
        $tiempo = time();
		$seg = (int) date("s",$tiempo);
		// SOLO MOSTRAREMOS LAS ULTIMAS 100 PUBLICACIONES
        if($start > 90) return array('total' => '-1');
        // OBTENEMOS LAS ULTIMAS PUBLICACIONES
		if($tipo == 0){		
			$resta = 15*60 + $seg; //15 MINUTOS
			$final = $tiempo;
		}elseif($tipo == 1){
			$resta = 1*3600 + $seg; //1 HORA
			//CON ESTO EVITAMOS QUE SE INCLUYAN LOS ANTERIORES A 15 MINUTOS
			$x = 15*60;
			$final = $tiempo - $x;			
		}elseif($tipo == 2){
			$resta = 3*3600  + $seg; //3 HORAS
			//CON ESTO EVITAMOS QUE SE INCLUYAN LOS ANTERIORES A 1 HORA
			$x = 1*3600;
			$final = $tiempo - $x;			
		}elseif($tipo == 3){
			$resta = 6*3600 + $seg; //6 HORAS
			//CON ESTO EVITAMOS QUE SE INCLUYAN LOS ANTERIORES A 3 HORAS
			$x = 3*3600;
			$final = $tiempo - $x;			
		}				
		//DEFINIMOS RANGOS DE TIEMPO
		$inicio = $tiempo - $resta;
		//CON FILTRO POR FECHA DE COMENTARIOS $query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id LEFT JOIN u_muro_favoritos AS f ON p.pub_id = f.shout_id LEFT JOIN u_muro_likes AS l ON p.pub_id = l.obj_id LEFT JOIN u_muro_comentarios AS c ON p.pub_id = c.pub_id LEFT JOIN u_muro_compartir AS s ON p.pub_id = s.shout_id WHERE (f.favo_fecha BETWEEN '.$inicio.' AND '.$final.') OR (l.like_fecha BETWEEN '.$inicio.' AND '.$final.') OR (c.c_date BETWEEN '.$inicio.' AND '.$final.') OR (s.compa_fecha BETWEEN '.$inicio.' AND '.$final.') GROUP BY p.pub_id ORDER BY p.p_comments DESC, p.p_favoritos DESC, p.p_compa DESC, p.p_likes DESC, p.p_date DESC , f.favo_fecha DESC , l.like_fecha DESC, c.c_date DESC, s.compa_fecha DESC  LIMIT '.$start.','.$limit);
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id LEFT JOIN u_muro_favoritos AS f ON p.pub_id = f.shout_id LEFT JOIN u_muro_likes AS l ON p.pub_id = l.obj_id LEFT JOIN u_muro_compartir AS s ON p.pub_id = s.shout_id WHERE (f.favo_fecha BETWEEN '.$inicio.' AND '.$final.') OR (l.like_fecha BETWEEN '.$inicio.' AND '.$final.') OR (s.compa_fecha BETWEEN '.$inicio.' AND '.$final.') GROUP BY p.pub_id ORDER BY p.p_comments DESC, p.p_favoritos DESC, p.p_compa DESC, p.p_likes DESC, f.favo_fecha DESC , l.like_fecha DESC, s.compa_fecha DESC  LIMIT '.$start.','.$limit);
		while($row = db_exec('fetch_array', $query)){
			//LO TENGO COMO MI FAVORITO TO-UP
            if($row['p_favoritos'] > 0){
                $row['favorito'] = $this->getPubExtras($row['pub_id'], 'favorito', $row['p_favoritos']);
            }					
			//LO HE COMPARTIDO TO-UP
            if($row['p_shared'] > 0){
                $row['compartir'] = $this->getPubExtras($row['pub_id'], 'compartir', $row['p_shared']);
            }						
            // CARGAR LIKES
            if($row['p_likes'] > 0){
                $row['likes'] = $this->getPubExtras($row['pub_id'], 'likes', $row['p_likes']);
            } else $row['likes'] = array('link' => 'Me gusta');
            // CARGAR COMENTARIOS
            if($row['p_comments'] > 0){
                $row['comments'] = $this->getPubExtras($row['pub_id'], 'comments', 2);
            }			
            // MENCIONES
            $row['p_body'] = $tsCore->parseBadWords($tsCore->setMenciones($row['p_body']), true);
            // CARGAR ADJUNTOS
            if($row['p_type'] != 1){
                $queryDos = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM u_muro_adjuntos WHERE pub_id = \''.$row['pub_id'].'\' LIMIT 1');
                $adj = db_exec('fetch_assoc', $queryDos);
                //
                $data[] = array_merge($row,$adj); 
            } else $data[] = $row;
        }        
		return array('total' => count($data), 'data' => $data);
	}

	//MURO POPULARES
    function getPopulares($start = 0, $limit = 10, $tipo = NULL, $acciones = NULL, $tiempos = NULL){
        global $tsUser, $tsCore;
        if($start > 90) return array('total' => '-1');
		//TOMAR TIEMPOS ACTUALES DEL SERVIDOR
		$tiempo = time();
		$dia = (int) date("d",$tiempo);
		$hora = (int) date("G",$tiempo);
		$min = (int) date("i",$tiempo);
		$seg = (int) date("s",$tiempo);		
		//FILTRO POR TIPO
		if($tipo == 0){
			$tipo = 'p.p_type != 0';//TODO 			
		}elseif($tipo == 1){			
			$tipo = 'p.p_type = 1';//TEXTO
		}elseif($tipo == 2){
			$tipo = 'p.p_type = 2';//IMAGEN
		}elseif($tipo == 3){			
			$tipo = 'p.p_type = 4';//VIDEO
		}elseif($tipo == 4){
			$tipo = 'p.p_type = 3';//LINK
		}		
		// FILTRO POR ACCIONES
		if($acciones == 0){
			$mayor = 'AND p.p_likes > 0';
			$acciones = 'p.p_likes';//ME GUSTA
		}elseif($acciones == 1){
			$mayor = 'AND p.p_comments > 0';
			$acciones = 'p.p_comments';//COMENTARIOS
		}elseif($acciones == 2){
			$mayor = 'AND p.p_shared > 0';
			$acciones = 'p.p_shared';//COMPARTIDOS
		}elseif($acciones == 3){
			$mayor = 'AND p.p_favoritos > 0';
			$acciones = 'p.p_favoritos';//FAVORITOS
		}
		//FILTRO TIEMPOS
		$resta = $hora*3600 + $min*60 +$seg;
		if($tiempos == 0){
			//HOY
			$inicio = $tiempo - $resta;
			$final = $tiempo;					
		}elseif($tiempos == 1){
			//AYER
			$restaDos = $resta + 86400 + 3600;		
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;				
		}elseif($tiempos == 2){
			//ULTIMOS 7 DIAS
			$restaDos = $resta + 604800  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;				
		}elseif($tiempos == 3){
			//DEL MES
			$restaDos = $resta + 2592000  + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;		
		}elseif($tiempos == 4){
			//MES ANTERIOR
			$restaDos = $resta + 2*2592000 + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;				
		}elseif($tiempos == 5){
			//DEL AÑO
			$restaDos = $resta + 12*2592000 + 3600;
			$inicio = $tiempo - $restaDos;
			$final = $tiempo - $resta;
		}elseif($tiempos == 6){
			//HISTORICO
			$inicio = 0;
			$final = $tiempo;			
		}
		$rango = '(f.favo_fecha BETWEEN '.$inicio.' AND '.$final.') OR  '.$tipo.' '.$mayor.' AND (l.like_fecha BETWEEN '.$inicio.' AND '.$final.') OR  '.$tipo.' '.$mayor.' AND (s.compa_fecha BETWEEN '.$inicio.' AND '.$final.')';
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id LEFT JOIN u_muro_favoritos AS f ON p.pub_id = f.shout_id LEFT JOIN u_muro_likes AS l ON p.pub_id = l.obj_id LEFT JOIN u_muro_compartir AS s ON p.pub_id = s.shout_id WHERE '.$tipo.' '.$mayor.' AND '.$rango.' GROUP BY p.pub_id ORDER BY '.$acciones.' DESC LIMIT '.$start.','.$limit);
		//
		while($row = db_exec('fetch_array', $query)){
			//LO TENGO COMO MI FAVORITO TO-UP
            if($row['p_favoritos'] > 0){
                $row['favorito'] = $this->getPubExtras($row['pub_id'], 'favorito', $row['p_favoritos']);
            }					
			//LO HE COMPARTIDO TO-UP
            if($row['p_shared'] > 0){
                $row['compartir'] = $this->getPubExtras($row['pub_id'], 'compartir', $row['p_shared']);
            }						
            // CARGAR LIKES
            if($row['p_likes'] > 0){
                $row['likes'] = $this->getPubExtras($row['pub_id'], 'likes', $row['p_likes']);
            } else $row['likes'] = array('link' => 'Me gusta');
            // MENCIONES
            $row['p_body'] = $tsCore->parseBadWords($tsCore->setMenciones($row['p_body']), true);
            // CARGAR ADJUNTOS
            if($row['p_type'] != 1){
                $queryDos = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM u_muro_adjuntos WHERE pub_id = \''.$row['pub_id'].'\' LIMIT 1');
                $adj = db_exec('fetch_assoc', $queryDos);
                $data[] = array_merge($row,$adj); 
            } else $data[] = $row;
        }        
		return array('total' => count($data), 'data' => $data);
	}	

	//MURO PUBLICO
    function getPublico($start = 0, $limit = 10){
        global $tsUser, $tsCore;	
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id WHERE p.p_user = p.p_user_pub ORDER BY p.p_date DESC LIMIT '.$start.','.$limit);		
		while($row = db_exec('fetch_array', $query)){			
			//LO TENGO COMO MI FAVORITO
            if($row['p_favoritos'] > 0){
                $row['favorito'] = $this->getPubExtras($row['pub_id'], 'favorito', $row['p_favoritos']);
            }					
			//LO HE COMPARTIDO
            if($row['p_shared'] > 0){
                $row['compartir'] = $this->getPubExtras($row['pub_id'], 'compartir', $row['p_shared']);
            }						
            // CARGAR LIKES
            if($row['p_likes'] > 0){
                $row['likes'] = $this->getPubExtras($row['pub_id'], 'likes', $row['p_likes']);
            } else $row['likes'] = array('link' => 'Me gusta');
            // MENCIONES
            $row['p_body'] = $tsCore->parseBadWords($tsCore->setMenciones($row['p_body']), true);
            // CARGAR ADJUNTOS
            if($row['p_type'] != 1){
                $queryDos = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM u_muro_adjuntos WHERE pub_id = \''.$row['pub_id'].'\' LIMIT 1');
                $adj = db_exec('fetch_assoc', $queryDos);
                $data[] = array_merge($row,$adj); 
            } else $data[] = $row;
        }        
		return array('total' => count($data), 'data' => $data);
	}
	
	//MURO HOME
    function getMuroHome(){
        global $tsUser, $tsCore;	
		$tipo = $tsCore->setSecure(intval($_GET['tipo']));
		$total = 3;
		//DESTACADOS
		if($tipo == 1){
			$ordenar = 'p.p_comments DESC, p.p_favoritos DESC, p.p_compa DESC, p.p_likes DESC, p.p_date DESC , f.favo_fecha DESC , l.like_fecha DESC, s.compa_fecha DESC';	
		}
		//POPULARES
		if($tipo == 2){
			$ordenar = 'p.p_likes DESC, l.like_fecha DESC';
		}		
		//PUBLICO
		if($tipo == 0 || $tipo == 3){
			$ordenar = 'p.p_date DESC';
		}		
		//ESTO SIRVE PARA QUE SOLO SE VEAN LOS SHOUTS QUE PUBLICAMOS EN NUESTRO MURO EN LA HOME WHERE p.p_user = p.p_user_pub
//		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id LEFT JOIN u_muro_favoritos AS f ON p.pub_id = f.shout_id LEFT JOIN u_muro_likes AS l ON p.pub_id = l.obj_id LEFT JOIN u_muro_comentarios AS c ON p.pub_id = c.pub_id LEFT JOIN u_muro_compartir AS s ON p.pub_id = s.shout_id WHERE p.p_user = p.p_user_pub GROUP BY p.pub_id ORDER BY '.$ordenar.' LIMIT '.$total.'');
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.*, u.user_name FROM u_muro AS p LEFT JOIN u_miembros AS u ON p.p_user_pub = u.user_id LEFT JOIN u_muro_favoritos AS f ON p.pub_id = f.shout_id LEFT JOIN u_muro_likes AS l ON p.pub_id = l.obj_id LEFT JOIN u_muro_compartir AS s ON p.pub_id = s.shout_id WHERE p.p_user = p.p_user_pub GROUP BY p.pub_id ORDER BY '.$ordenar.' LIMIT '.$total.'');
		while($row = db_exec('fetch_array', $query)){			
			//LO TENGO COMO MI FAVORITO
            if($row['p_favoritos'] > 0){
                $row['favorito'] = $this->getPubExtras($row['pub_id'], 'favorito', $row['p_favoritos']);
            }					
			//LO HE COMPARTIDO
            if($row['p_shared'] > 0){
                $row['compartir'] = $this->getPubExtras($row['pub_id'], 'compartir', $row['p_shared']);
            }						
            // CARGAR LIKES
            if($row['p_likes'] > 0){
                $row['likes'] = $this->getPubExtras($row['pub_id'], 'likes', $row['p_likes']);
            } else $row['likes'] = array('link' => 'Me gusta');
            // MENCIONES
			$row['p_body'] = $tsCore->parseBadWords($tsCore->parseBBCode($tsCore->setMenciones($row['p_body'])), true);
            // CARGAR ADJUNTOS
            if($row['p_type'] != 1){
                $queryDos = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM u_muro_adjuntos WHERE pub_id = \''.$row['pub_id'].'\' LIMIT 1');
                $adj = db_exec('fetch_assoc', $queryDos);
                $data[] = array_merge($row,$adj); 
            } else $data[] = $row;
        }        
		return array('total' => count($data), 'data' => $data);
	}	
	
}	