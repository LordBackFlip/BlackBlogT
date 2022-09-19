<div class="boxy-title">
	<h3>Caracter&iacute;sticas y Opciones</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}
		<div style="display: block;" class="mensajes ok">Configuraciones guardadas</div>
	{/if}
	<form action="" method="post" autocomplete="off">
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_titulo">Nombre del sitio:</label>				
			</div>			
			<input type="text" id="ai_titulo" name="titulo" maxlength="24" value="{$tsConfig.titulo}"/>
		</div>
		<div class="boxblo">
			<div class="desbox">	
				<label for="ai_slogan">Descripci&oacute;n del sitio:</label>
			</div>	
			<input type="text" id="ai_slogan" name="slogan" maxlength="32" value="{$tsConfig.slogan}"/>					
		</div>
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_url">Direcci&oacute;n del sitio:</label>
			</div>			
			<input type="text" id="ai_url" name="url" maxlength="32" value="{$tsConfig.url}" />	
		</div>		
		<div class="boxblo">
			<div class="desbox">
				<label for="pkey">reCaptcha pública:</label>
			</div>
			<input type="text" id="pkey" name="pkey" maxlength="45" value="{$tsConfig.pkey}" placeholder="Clave del sitio"/>
		</div>	
        <div class="boxblo">
			<div class="desbox">
				<label for="skey">reCaptcha secreta:</label>
			</div>
			<input type="text" id="skey" name="skey" maxlength="45" value="{$tsConfig.skey}" placeholder="Clave secreta"/>
		</div>				
		<div class="boxblo">
			<div class="desbox">				
				<label>Modo mantenimiento:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Esto har&aacute; al sitio inaccesible para los usuarios que no formen parte del staff.')"></span>
			</div>
			<select name="offline">
				<option value="0" {if $tsConfig.offline != 1}selected="selected"{/if}>Mantenimiento Desactivado</option>
				<option value="1" {if $tsConfig.offline == 1}selected="selected"{/if}>Mantenimiento Activado</option>
			</select>												
		</div>		
		<div class="boxblo">
			<div class="desbox">
				<label>Mensaje modo mantenimiento:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Puedes introducir un breve mensaje (255 caracteres)<br/> para mostrar a los usuarios durante el mantenimiento.')"></span>
			</div>
			<input type="text" name="offline_message" id="ai_offline" value="{$tsConfig.offline_message}" />
		</div>
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_chat">Chatango ID:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Por defecto puedes agregar un chat de <b>Chatango</b> para tu sitio<br/> solo crea tu grupo he ingresa el nombre.')"></span>
			</div>
			<input type="text" id="ai_chat" name="chat" maxlength="20" value="{$tsConfig.chat_id}" placeholder="Dejar vac&iacute;o para usar xat"/>
		</div>		
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_xat">Xat ID:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Por defecto puedes agregar un chat de <b>Xat</b> para tu web<br/> solo crea tu grupo he ingresa el nombre.')"></span>
			</div>
			<input type="text" id="ai_xat" name="xat" maxlength="20" value="{$tsConfig.xat_id}"/>
		</div>
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_edad">Edad requerida:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','A partir de que edad los usuarios pueden registrarse.')"></span>
			</div>
			<input type="text" id="ai_edad" name="edad" maxlength="2" value="{$tsConfig.c_allow_edad}" />
		</div>
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_met_welcome">Mensaje de Bienvenida:</label>
				<span id="desc_message_welcome" {if $tsConfig.c_met_welcome == 0}style="display:none;"{/if}> 
					<div class="nomo" style="margin-right: 0;">
						<p style="margin: 5px 0 0 0;"><b>[usuario]</b> = Nombre del registrado</p> 
						<p><b>[welcome]</b> = Bienvenido/a</p> 
						<p><b>[web]</b> = Nombre de esta web </p> 
						<p style="color: #008800;display: block;margin-top: 5px;">(Se aceptan BBCodes y Smileys)</p>
					</div>
				</span>				
			</div>
			<select id="ai_met_welcome" name="met_welcome" class="select" {if $tsConfig.c_met_welcome == 0} onchange="if($('#ai_met_welcome').val() != 0) $('textarea[name=message_welcome]').show(); $('#desc_message_welcome').show();" {/if}>
				<option value="0" {if $tsConfig.c_met_welcome == 0}selected{/if} >No dar bienvenida</option>
				<option value="1" {if $tsConfig.c_met_welcome == 1}selected{/if} >Muro</option>
				<option value="2" {if $tsConfig.c_met_welcome == 2}selected{/if} >Mensaje privado</option>
				<option value="3" {if $tsConfig.c_met_welcome == 3}selected{/if} >Aviso</option>
			</select>
			<textarea name="message_welcome" id="ai_met_welcome" style="{if $tsConfig.c_met_welcome == 0} display:none; {/if}" >{$tsConfig.c_message_welcome}</textarea>			
		</div>
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_active">Usuario online:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Tiempo que debe trascurrir para considerar que un usuario est&aacute; en linea.')"></span>
			</div>
			<input type="text" id="ai_active" name="active" maxlength="2" value="{$tsConfig.c_last_active}" />
		</div>		
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_stats_cache">Estad&iacute;sticas en buffer:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Tiempo que debe trascurrir para actualizar las estad&iacute;sticas del sitio.')"></span>
			</div>
			<input type="text" id="ai_stats_cache" name="stats_cache" maxlength="2" value="{$tsConfig.c_stats_cache}"/>
		</div>				
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_sess_ip">Login por IP:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Por seguridad cada que un usuario cambie de IP se le pedir&aacute; loguearse nuevamente.')"></span>
			</div>
			<select name="sess_ip">
				<option value="1" {if $tsConfig.c_allow_sess_ip == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_allow_sess_ip != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>	
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_count_guests">Visitantes suman estad&iacute;sticas</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Contar a los visitantes en las estad&iacute;sticas generales.')"></span>
			</div>
			<select name="count_guests">
				<option value="1" {if $tsConfig.c_count_guests == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_count_guests != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>		
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_hits_guest">Los visitantes suman visitas</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Contar las visitas de los visitantes en posts y fotos.')"></span>
			</div>
			<select name="hits_guest">
				<option value="1" {if $tsConfig.c_hits_guest == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_hits_guest != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>	
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_reg_active">Registro abierto:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Permitir el registro de nuevos usuarios')"></span>
			</div>
			<select name="reg_active">
				<option value="1" {if $tsConfig.c_reg_active == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_reg_active != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>			
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_reg_activate">Activar usuarios:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Activar autom&aacute;ticamente la cuenta de usuario.')"></span>
			</div>
			<select name="reg_activate">
				<option value="1" {if $tsConfig.c_reg_activate == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_reg_activate != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>						
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_firma">Firma de usuario:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Las firmas de los usuarios son visibles en los post.')"></span>
			</div>
			<select name="firma">
				<option value="1" {if $tsConfig.c_allow_firma == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_allow_firma != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>								
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_upload">Carga externa:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Si cuentas con un servidor de pago o la librer&iacute;a CURL <br/>puedes subir im&aacute;genes remotamente a imgur.com')"></span>
			</div>
			<select name="upload">
				<option value="1" {if $tsConfig.c_allow_upload == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_allow_upload != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>										
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_portal">Activar portal:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Los usuarios podr&aacute;n tener un inicio perzonalizado.')"></span>
			</div>
			<select name="portal">
				<option value="1" {if $tsConfig.c_allow_portal == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_allow_portal != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>										
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_fotos_private">Secci&oacute;n de fotos oculta</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Si est&aacute; activado, los visitantes no podr&aacute;n ver la secci&oacute;n fotos.')"></span>
			</div>
			<select name="fotos_private">
				<option value="1" {if $tsConfig.c_fotos_private == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_fotos_private != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>												
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_see_mod">Vista moderativa amplia</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Si est&aacute; activado, el equipo de moderaci&oacute;n podr&aacute; ver<br/> diferenciado por colores, los distintos estados de los posts.')"></span>
			</div>
			<select name="see_mod">
				<option value="1" {if $tsConfig.c_see_mod == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_see_mod != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>												
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_desapprove_post">Revisi&oacute;n posts tras publicaci&oacute;n</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Si est&aacute; activado, el equipo de moderaci&oacute;n deber&aacute; aprobar un post <br/>antes de que &eacute;ste sea publicado.')"></span>
			</div>
			<select name="desapprove_post">
				<option value="1" {if $tsConfig.c_desapprove_post == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_desapprove_post != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>												
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_keep_points">Mantener los puntos:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Al momento de recargar los puntos, si est&aacute; habilitado se conservar&aacute;n los puntos<br/> que el usuario no haya gastado los puntos en el d&iacute;, si est&aacute; deshabilitado,<br/> se restablecer&aacute;n a los puntos asignados para cada rango.')"></span>
			</div>
			<select name="keep_points">
				<option value="1" {if $tsConfig.c_keep_points == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_keep_points != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_live">Notificaciones Live:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Los usuarios podr&aacute;n ver en tiempo real sus notificaciones. <br/>(Esta opci&oacute;n puede consumir un poco m&aacute;s de recursos.)')"></span>
			</div>
			<select name="live">
				<option value="1" {if $tsConfig.c_allow_live == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_allow_live != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>		
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_max_nots">M&aacute;ximo de notificaciones:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Cuantas notificaciones puede recibir un usuario.')"></span>
			</div>
			<input type="text" id="ai_max_nots" name="max_nots" maxlength="3" value="{$tsConfig.c_max_nots}"/>
		</div>	
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_max_acts">M&aacute;ximo de actividades:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Cuantas actividades puede registrar un usuario.')"></span>
			</div>
			<input type="text" id="ai_max_acts" name="max_acts" maxlength="3" value="{$tsConfig.c_max_acts}"/>
		</div>			
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_max_post">Posts por p&aacute;gina:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','N&uacute;mero m&aacute;ximo de posts a mostrar en cada p&aacute;gina de la portada.')"></span>
			</div>
			<input type="text" id="ai_max_post" name="max_posts" maxlength="3" value="{$tsConfig.c_max_posts}" />
		</div>			
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_max_com">Comentarios por post:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','N&uacute;mero m&aacute;ximo de comentarios por p&aacute;gina en los post')"></span>
			</div>
			<input type="text" id="ai_max_com" name="max_com" maxlength="3" value="{$tsConfig.c_max_com}" />
		</div>			
		<div class="boxblo">			
			<div class="desbox">
				<label for="ai_allow_points" class="qtip" title="Si introducimos '0', se permitir&aacute; dar los puntos definidos por el rango del usuario. <br /> <br />  Si introducimos '-1', se podr&aacute;n dar todos los puntos que el usuario tenga para dar hoy. <br /> <br /> Introduciendo un n&uacute;mero superior a 0, todos los usuarios sin importar su rango, tend&aacute;n esa cantidad para dar." >Puntos por post:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','N&uacute;mero m&aacute;ximo de puntos que permitimos dar en los posts.')"></span>
			</div>
			<input type="text" id="ai_allow_points" name="allow_points" maxlength="3" value="{$tsConfig.c_allow_points}" />
		</div>				
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_sum_p">Los votos suman puntos:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Cada voto positivo en un comentario es un punto m&aacute;s para el usuario. <br/><strong>Nota:</strong> Los votos negativos no restan puntos')"></span>
			</div>
			<select name="sump">
				<option value="1" {if $tsConfig.c_allow_sump == 1}selected="selected"{/if}>Si</option>
				<option value="0" {if $tsConfig.c_allow_sump != 1}selected="selected"{/if}>No</option>
			</select>										
		</div>	
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_nfu">Cambio de rango:</label>
				<span class="foquito" onclick="mydialog.alert('Informaci&oacute;n','Un usuario sube de rango cuando obtiene los puntos m&iacute;nimos <br/>en un posts o en la suma de todos sus post')"></span>
			</div>
			<select name="newr">
				<option value="1" {if $tsConfig.c_newr_type == 1}selected="selected"{/if}>Al alcanzar el minimo de puntos en todos sus post</option>
				<option value="0" {if $tsConfig.c_newr_type != 1}selected="selected"{/if}>Al alcanzar el minimo de puntos en un solo post</option>
			</select>										
		</div>										
		<div class="botoboc">
			<input type="submit" name="save" value="Guardar cambios" class="boton azul"/>
		</div>									
	</form>
</div>