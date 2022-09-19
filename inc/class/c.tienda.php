<?php if ( ! defined('TS_HEADER')) exit('No se permite el acceso directo al script');

/**
 * Modelo para el control de la tienda v2
 *
 * @name    c.tienda.php
 * @author  aperpen
 */

class tsTienda  {

	// INSTANCIA DE LA CLASE
	public static function &getInstance(){
		static $instance;
		
		if( is_null($instance) ){
			$instance = new tsTienda();
    	}
		return $instance;
	}
	
	function getProducto($id = NULL){
		if(!is_int($id))
		return '#Cep1';
		
		$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM t_productos WHERE id =\''.(int)$id.'\'');
		if(db_exec('num_rows', $query) == 1){
		$data = db_exec('fetch_array', $query);
		return $data;
		} else
		return 'Error #Cep2';
	}
	function editProducto($id = NULL){
		global $tsCore;
		
	$id = (int)$_GET['id'];
	$type = (int)$_POST['type'];
	$precio = (int)$_POST['precio'];	
	if(db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT id FROM t_productos WHERE id = \''.(int)$id.'\''))){

	//AGREGAR POR NOMBRE
			
				if(strlen($_POST['val']) <= 2)
			$val = (int)$_POST['val'];
			
			elseif($type == 1 || $type == 2){
				
			$val = $tsCore->setSecure($_POST['val']);
			
	if($type == 1){
	$consulta = 'SELECT rango_id FROM u_rangos WHERE r_name = \''.$tsCore->setSecure($val).'\'';
	$id = db_exec('fetch_array', db_exec(array(__FILE__, __LINE__), 'query', $consulta));
				//RANGO = ID
				$val = (int)$id['rango_id'];
	}else{
	$consulta = 'SELECT medal_id FROM  w_medallas WHERE m_title = \''.$tsCore->setSecure($val).'\'';
	$id = db_exec('fetch_array', db_exec(array(__FILE__, __LINE__), 'query', $consulta));
				//RANGO = ID		
				$val = (int)$id['medal_id'];
  }
			}

			if(empty($val))
			return 'Error #Cep5';
			if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE t_productos SET type = \''.(int)$type.'\', precio = \''.(int)$precio.'\', obj = \''.(int)$val.'\' WHERE id = \''.(int)$id.'\''))
			return true;
			else 
			return 'Error #Cep4';
			
			}else
			return 'Error #Cep3';
	}
	function getProductos(){
	//Hacemos la consulta	
	$query = db_exec(array(__FILE__, __LINE__), 'query', 'SELECT * FROM t_productos');
	//Datos o error?
	if($query){
	if(db_exec('num_rows', $query) >= 1){
	$data = result_array($query);
	
	//CONVERTIMOS TIPOS Y OBJETOS
	$i = 0;
	foreach($data as $p){
	if($p['type'] == 1){
		$obj = db_exec('fetch_array', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r_name FROM u_rangos WHERE rango_id = \''.(int)$p['obj'].'\''));
	$data[$i]['obj'] = $obj['r_name'];
	$data[$i]['type'] = 'Rango';
		}
			if($p['type'] == 2){
		$obj = db_exec('fetch_array', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT m_title FROM w_medallas WHERE medal_id = \''.(int)$p['obj'].'\''));
	$data[$i]['obj'] = $obj['m_title'];
	$data[$i]['type'] = 'Medalla';
		}
		if($p['type'] == 3){
	$data[$i]['type'] = 'Puntos para dar';
		}
		if($p['type'] == 4){
			$data[$i]['obj'] = '-';
	$data[$i]['type'] = 'Cambio de nick';
		}
		$i++;
	}
	
	return $data;
	}else{
	return 'No hay productos.';
	}
	}else
	return 'Error #Stp1';
	}
	
	function add_rango($precio = NULL, $rango = NULL, $type = 0){
		global $tsCore;
		//POR NOMBRE O POR ID?
		$consulta = empty($type) ? 'SELECT rango_id FROM u_rangos WHERE rango_id = \''.(int)$rango.'\'' : 'SELECT rango_id FROM u_rangos WHERE r_name = \''.$tsCore->setSecure($rango).'\'';
		//COMPROBAMOS QUE EL RANGO EXISTE
		$rows = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', $consulta));

		if($rows == 1){
			//SE HIZO POR NOMBRE?
			if($type){
				//EN ESE CASO OBTENEMOS EL ID
				$id = db_exec('fetch_array', db_exec(array(__FILE__, __LINE__), 'query', $consulta));
				//RANGO = ID
			
				$rango = (int)$id['rango_id'];
			}else
			$rango = (int)$rango;
	
		//PEQUEÑAS VALIDACIÓNES
		if(empty($rango))
    		return 'Error #Vtr6';
			
		if($precio != 0 && empty($precio))
			return 'Error #Vtr7';
			
		if(!is_int($rango))
			return 'Error #Vtr3';
			
		if(!is_int($precio))
			return 'Error #Vtr4';



		//INTENTAMOS CREAR EL PRODUCTO
		if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO t_productos (type, precio, obj) VALUES (\'1\', \''.(int)$precio.'\', \''.(int)$rango.'\')'))		
		return true;
		else
			return 'Error #Ctr1';

		//COLUMNAS DUPLICADAS
		}elseif($rows > 1){
		return 'Error #Ctr2';

		}else{
		return 'Error #Ctr5.';
		}
	}
	function add_medalla($precio = NULL, $medalla = NULL, $type = 0){
		global $tsCore;
		//POR NOMBRE O POR ID?
		$consulta = empty($type) ? 'SELECT medal_id FROM w_medallas WHERE medal_id = \''.(int)$medalla.'\'' : 'SELECT medal_id FROM  w_medallas WHERE m_title = \''.$tsCore->setSecure($medalla).'\'';
		//COMPROBAMOS QUE EL RANGO EXISTE
		$rows = db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', $consulta));

		if($rows == 1){
			//SE HIZO POR NOMBRE?
			if($type){
				//EN ESE CASO OBTENEMOS EL ID
				$id = db_exec('fetch_array', db_exec(array(__FILE__, __LINE__), 'query', $consulta));
				//MEDALLA = ID
				$medalla = (int)$id['medal_id'];
				
			}else
			$medalla = (int)$medalla;
	
		//PEQUEÑAS VALIDACIÓNES
		if(!is_int($medalla))
			return 'Error #Vtm3';
			
		if(empty($medalla))
    		return 'Error #Vtm6';
			
		if($precio != 0 && empty($precio))
			return 'Error #Vtm7';
			
			
		if(!is_int($precio))
			return 'Error #Vtm4';



		//INTENTAMOS CREAR EL PRODUCTO
		if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO t_productos (type, precio, obj) VALUES (\'2\', \''.(int)$precio.'\', \''.(int)$medalla.'\')'))		
		return true;
		else
			return 'Error #Ctm1';

		//COLUMNAS DUPLICADAS
		}elseif($rows > 1){
		return 'Error #Ctm2';

		}else{
		return 'Error #Ctm5.';
		}
	}
	
	function add_puntos($precio = NULL, $puntos = NULL){
		
		//VALIDACIONES
		if($_POST['precio'] != 0 && empty($_POST['precio']))
		return 'Error #Vtp1';
		
		if(!is_int($precio))
		return 'Error #Vtp2.';
		
		if(!is_int($puntos))
		return 'Error #Vtp3.';
		
		//INTENTAMOS CREAR EL PRODUCTO
		if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO t_productos (type, precio, obj) VALUES (\'3\', \''.(int)$precio.'\', \''.(int)$puntos.'\')'))		
	return true;
		else
			return 'Error #Ctp1';
	}
	
	function add_cambio($precio = NULL, $puntos = NULL){
		
		//VALIDACIONES
		    if($_POST['precio'] != 0 && empty($_POST['precio']))
		return 'Error #Vtc1';
		
		if(!is_int($precio))
		return 'Error #Vtc2.';
		
		
	
		//INTENTAMOS CREAR EL PRODUCTO
		if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO t_productos (type, precio, obj) VALUES (\'4\', \''.(int)$precio.'\', \''.(int)$puntos.'\')'))		
	return true;
		else
			return 'Error #Ctc1';
	}
	
	function delProducto(){
       $id = (int)$_GET['id'];
		if(db_exec('num_rows', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT id FROM t_productos WHERE id = \''.(int)$id.'\''))){
		if(db_exec(array(__FILE__, __LINE__), 'query', 'DELETE FROM t_productos WHERE id = \''.(int)$id.'\''))
		return true;
		else
		return 'Error #Cbp2';
		}else{
		return 'Error #Cbp1';
		}
		
	}
	
	function nuevoProducto(){
		global $tsCore;
	$type = (int)$_POST['type'];
	
	if(empty($type))
	return 'Error #Vtn1';
	$_POST['precio'] = (int)$_POST['precio'];
		//RANGO
		if($type == 1){
			//VALIDACIONES
			if($_POST['precio'] != 0 && empty($_POST['precio']))
			return 'Error #Vtr7';
			
			if($_POST['opt'] != 0 && $_POST['opt'] != 1)
			return 'Error #Vtn2';
			
			if(empty($_POST['val']))
			return 'Error #Vtr6';


			//DATOS
			$precio = (int)$_POST['precio'];
			if(is_int($_POST['val']))
			$val = (int)$_POST['val'];
			else
			$val = $tsCore->setSecure($_POST['val']);
			$type = (int)$_POST['opt'];
			
			//RETORNAR
		return $this->add_rango($precio, $val, $type);
		}
		
		//MEDALLA
		if($type == 2){
			//VALIDACIONES
			if($_POST['precio'] != 0 && empty($_POST['precio']))
			return 'Error #Vtm7';
			
			if($_POST['opt'] != 0 && $_POST['opt'] != 1)
			return 'Error #Vtn3';
			
			if(empty($_POST['val']))
			return 'Error #Vtm6';


			//DATOS
			$precio = (int)$_POST['precio'];
	     	if(is_int($_POST['val']))
			$val = (int)$_POST['val'];
			else
			$val = $tsCore->setSecure($_POST['val']);
			
			$type = (int)$_POST['opt'];
			
			//RETORNAR
		return $this->add_medalla($precio, $val, $type);
		}
		
		//PUNTOS PARA DAR
		if($type == 3){
			//VALIDACIONES
			if($_POST['precio'] != 0 && empty($_POST['precio']))
			return 'Error #Vtp1';
	
			if(empty($_POST['val']))
			return 'Error #Vtp3';

			//DATOS
			$precio = (int)$_POST['precio'];
			$val = (int)$_POST['val'];
			
			//RETORNAR
			return $this->add_puntos($precio, $val);
		}
		
		//CAMBIO NICK
		if($type == 4){
			//VALIDACIONES
			if($_POST['precio'] != 0 && empty($_POST['precio']))
			return 'Error #Vtc1';

			

			//DATOS
			$precio = (int)$_POST['precio'];
			
			//RETORNAR
			return $this->add_cambio($precio);
		}
	}
	function comprarRango($id = NULL){
global $tsUser, $tsMonitor, $tsCore;
$data = $this->getProducto($id);
        if($data['type'] != 1)
return '#Crt1';
 
if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntos = user_puntos - \''.(int)$data['precio'].'\' WHERE user_id = \''.$tsUser->uid.'\'')){
if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_rango =  \''.(int)$data['obj'].'\' WHERE user_id = \''.$tsUser->uid.'\'')){
$obj = db_exec('fetch_array', db_exec(array(__FILE__, __LINE__), 'query', 'SELECT r_name FROM u_rangos WHERE rango_id = \''.(int)$data['obj'].'\''));
$notificacion = 'Tu compra del rango '.$obj['r_name'].' en la tienda de "'.$tsCore->settings['titulo'].'" ha sido procesado con éxito y tu rango ha sido cambiado a '.$obj['r_name'].'. </br> Gracias por tu atención.';
if($tsMonitor->setAviso($tsUser->uid, 'Compra de rango', $notificacion, 0))
return true;
 
}else{
	
		function comprarMedalla($id = NULL){
		global $tsUser;
		$data = $this->getProducto($id);
        if($data['type'] != 2)
		return '#Cmt1';
	
		if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntos = user_puntos - \''.(int)$data['precio'].'\' WHERE user_id = \''.$tsUser->uid.'\'')){
		if(db_exec(array(__FILE__, __LINE__), 'query', 'INSERT INTO `w_medallas_assign` (`medal_id`, `medal_for`, `medal_date`, `medal_ip`) VALUES (\''.(int)$data['obj'].'\', \''.$tsUser->uid.'\', \''.time().'\', \''.$tsUser->info['user_last_ip'].'\')'))
		return true;
		else{
		db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntos = user_puntos + \''.(int)$data['precio'].'\' WHERE user_id = \''.$tsUser->uid.'\'');
		return 'Error #Cmt3. Tus puntos te han sido devueltos.';
		}
		}else{
		return 'Error #Cmt2';
		}
	}
		function comprarDar($id = NULL){
		global $tsUser;
		$data = $this->getProducto($id);
        if($data['type'] != 3)
		return '#Cpt1';
	
		if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntos = user_puntos - \''.(int)$data['precio'].'\' WHERE user_id = \''.$tsUser->uid.'\'')){
		if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntosxdar = user_puntosxdar +\''.(int)$data['obj'].'\'  WHERE user_id = \''.$tsUser->uid.'\''))
		return true;
		else{
		db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntos = user_puntos + \''.(int)$data['precio'].'\' WHERE user_id = \''.$tsUser->uid.'\'');
		return 'Error #Cpt3. Tus puntos te han sido devueltos.';
		}
		}else{
		return 'Error #Cpt2';
		}
	}
	function comprarCambio($id = NULL, $nuevo = NULL){
		global $tsUser, $tsCore;
		$data = $this->getProducto($id);
        if($data['type'] != 4)
		return '#Cct1';
		
		$nuevo = $tsCore->setSecure($nuevo);
		
		if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntos = user_puntos - \''.(int)$data['precio'].'\' WHERE user_id = \''.$tsUser->uid.'\'')){
		if(db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_name = \'' .$nuevo. '\' WHERE user_id = \'' .$tsUser->uid.'\''))
		return true;
		else{
		db_exec(array(__FILE__, __LINE__), 'query', 'UPDATE `u_miembros` SET user_puntos = user_puntos + \''.(int)$data['precio'].'\' WHERE user_id = \''.$tsUser->uid.'\'');
		return 'Error #Cct3. Tus puntos te han sido devueltos.';
		}
		}else{
		return 'Error #Cct2';
		}
	}
	function comprarProducto($id = NULL){
		global $tsUser, $tsCore;
	//FILTRAMOS DATOS
	$id = (int)$id;
	
	$data = $this->getProducto($id);
		$type = $data['type'];

	if($tsUser->puntos < $data['precio'])
	return '#Cpt1';
	
	if($type == 1)
	return $this->comprarRango($id);
	
	if($type == 2)
	return $this->comprarMedalla($id);
	
	if($type == 3)
	return $this->comprarDar($id);
	
	if($type == 4)
	return $this->comprarCambio($id, $tsCore->setSecure($_POST['nuevo']));
	}
}
}
}
}