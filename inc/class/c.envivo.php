<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');
class tsEnvivo {

	//FUNCION PARA OBTENER LA ACTIVIDAD
	function getEnvivo(){
		global $tsUser, $tsCore;
		//
		$posts = $tsCore->setSecure($_POST['posts']);
		$shouts = $tsCore->setSecure($_POST['shouts']);
		$usuarios = $tsCore->setSecure($_POST['usuarios']);
		$fotos = $tsCore->setSecure($_POST['fotos']);
		//
		if($posts == 1){
			$filtro1 = '(a.ac_type = 1 OR a.ac_type = 2 OR a.ac_type = 3 OR a.ac_type = 4 OR a.ac_type = 5 OR a.ac_type = 6 OR a.ac_type = 7)';
		}
		//
		if($shouts == 1){
			if($posts == 1 || $usuarios == 1){
				if($posts == 0){
					$filtro2 = '(a.ac_type = 10 OR a.ac_type = 11)';
				}else{
					$filtro2 = 'OR (a.ac_type = 10 OR a.ac_type = 11)';	
				}				
			}else{			
				$filtro2 = '(a.ac_type = 10 OR a.ac_type = 11)';				
			}
		}
		//
		if($usuarios == 1){
			if($posts == 1 || $shouts == 1){
				$filtro3 = 'OR (a.ac_type = 8)';				
			}else{			
				$filtro3 = '(a.ac_type = 8)';
			}
		}
		//
		if($fotos == 1){
			if($posts == 1 || $shouts == 1 || $usuarios == 1){
				$filtro4 = 'OR (a.ac_type = 9)';
			}else{
				$filtro4 = '(a.ac_type = 9)';
			}
		}
		/***********************************************************************/
		if($posts == 1 || $shouts == 1 || $usuarios == 1 || $fotos == 1){
			$where = 'WHERE';			
		}
		//
		$contar = db_exec('fetch_row', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT COUNT(*) FROM u_actividad AS a '.$where.' '.$filtro1.' '.$filtro2.' '.$filtro3.' '.$filtro4.''));		
		$filas = $contar[0];
		$aleatorio = rand(0, $filas-1);
		//ALEATORIO 
		$query = db_exec(array(__FILE__, __LINE__), 'query', '
		SELECT p.post_title, a.user_id, a.ac_type, a.obj_uno, a.obj_dos, u.user_name 
		FROM u_actividad AS a 
		LEFT JOIN u_miembros AS u ON a.user_id = u.user_id 
		LEFT JOIN u_muro AS m ON a.obj_uno = m.pub_id 
		LEFT JOIN p_posts AS p ON a.obj_uno = p.post_id '.$where.' '.$filtro1.' '.$filtro2.' '.$filtro3.' '.$filtro4.' ORDER BY RAND() LIMIT 20');


		//REAL
//		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT p.post_title, a.ac_type, a.obj_uno, a.obj_dos, u.user_name FROM u_actividad AS a LEFT JOIN u_miembros AS u ON a.user_id = u.user_id LEFT JOIN p_posts AS p ON a.obj_uno = p.post_id '.$where.' '.$filtro1.' '.$filtro2.' '.$filtro3.' '.$filtro4.' ORDER BY a.ac_date DESC LIMIT 20');
		$data['data'] = result_array($query);
		return $data;
	}
}