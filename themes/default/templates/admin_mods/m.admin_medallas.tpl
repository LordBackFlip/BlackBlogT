		<script type="text/javascript">
			// {literal}
			$(function(){
				$('#med_img').change(function(){
					var cssi = $("#med_img option:selected").css('background');
					$('#c_icon').css({"background" : cssi});
				});
			});
			//{/literal}
		</script>
<div class="boxy-title">
	<h3>Medallas</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}<div class="mensajes ok">Tus cambios han sido guardados</div>{/if}
	{if $tsError}<div class="aviso-error" style="margin: 20px 20px 0 20px;">{$tsError}</div>{/if}
	{if !$tsAct}
		{if !$tsMedals.medallas}
			<div class="nada-gris" style="margin: 10px;">No hay medallas creadas</div>
			<div class="botoboc">
				<input type="button" onclick="location.href = '{$tsConfig.url}/admin/medals?act=nueva'" value="Agregar nueva medalla" class="boton azul"/>
			</div>			
		{else}
			<table cellpadding="0" cellspacing="0" border="0" class="admin_table" width="550" align="center">
				<thead>
					<th>ID</th>
					<th>Imagen</th>
					<th>Tipo</th>
					<th>T&iacute;tulo</th>
					<th>Descripci&oacute;n</th>
					<th>Creada por</th>
					<th>Fecha</th>
					<th>Total</th>
					<th>Acciones</th>
				</thead>
				<tbody>
					{foreach from=$tsMedals.medallas item=m}
						<tr id="medal_id_{$m.medal_id}">
							<td>{$m.medal_id}</td>
							<td><img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_16.png" /></td>
							<td>{if $m.m_type == 1}Usuario{elseif $m.m_type == 2}Post{else}Foto{/if}</td>
							<td>{$m.m_title}</td>
							<td>{$m.m_description}</td>
							<td>{if $m.m_autor == 0}Sistema{else}<a href="{$tsConfig.url}/perfil/{$m.user_name}" class="hovercard" uid="{$m.user_id}">{$m.user_name}</a>{/if}</td>
							<td>{$m.m_date|date_format:"%d/%m/%Y"}</td>
							<td id="total_med_assig_{$m.medal_id}">{$m.m_total}</td>
							<td class="admin_actions">
								<a onclick="admin.medallas.asignar({$m.medal_id}); return false"><img src="{$tsConfig.tema.t_url}/images/icons/plus.png" title="Asignar Medalla"/></a>
								<a href="{$tsConfig.url}/admin/medals/editar/{$m.medal_id}"><img src="{$tsConfig.tema.t_url}/images/icons/editar.png" title="Editar Medalla"/></a>
								<a onclick="admin.medallas.borrar({$m.medal_id}); return false"><img src="{$tsConfig.tema.t_url}/images/icons/close.png" title="Borrar Medalla" /></a>
							</td>
						</tr>
					{/foreach}
				</tbody>
				<tfoot>
					<td colspan="9">P&aacute;ginas: {$tsMedals.pages}</td>
				</tfoot>
			</table>
			<div class="botoboc">
				<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/medals?act=nueva'" value="Agregar nueva medalla" class="boton azul" style="float: right;width: 49%;"/>
				<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/medals?act=showassign'" value="Ver medallas asignadas" class="boton azul" style="float: left;width: 49%;"/>
			</div>
		{/if}
	{elseif $tsAct == 'showassign'}
		{if $tsAsignaciones.asignaciones}
			<table cellpadding="0" cellspacing="0" border="0" class="admin_table" width="550" align="center">
				<thead>
					<th>ID</th>
					<th>Medalla</th>
					<th>Tipo</th>
					<th>Asignada a</th>
					<th>Fecha</th>
					<th>IP</th>
					<th>Acciones</th>
				</thead>
				<tbody>
					{foreach from=$tsAsignaciones.asignaciones item=m}
						<tr id="assign_id_{$m.id}">
							<td>{$m.id}</td>
							<td><img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_16.png" class="qtip" title="{$m.m_title}"/></td>
							<td>{if $m.m_type == 1}Usuario{elseif $m.m_type == 2}Post{else}Foto{/if}</td>
							<td>{if $m.m_type == 1}<a href="{$tsConfig.url}/perfil/{$m.user_name}" class="hovercard" uid="{$m.user_id}">@{$m.user_name}</a>{elseif $m.m_type == 2}<a href="{$tsConfig.url}/posts/{$m.c_seo}/{$m.post_id}/{$m.post_title|seo}.html" target="_blank">{$m.post_title}</a>{else}<a href="{$tsConfig.url}/fotos/autor/{$m.foto_id}/{$m.f_title}.html" target="_blank">{$m.f_title}</a>{/if}</td>
							<td>{$m.m_date|hace:true}</td>{*date_format:"%d/%m/%Y"*}
							<td>{$m.medal_ip}</td>
							<td class="admin_actions">
								<a onclick="admin.medallas.borrar_asignacion({$m.id}, {$m.medal_id}); return false"><img src="{$tsConfig.tema.t_url}/images/icons/close.png" title="Borrar Asignaci&oacute;n" /></a>
							</td>
						</tr>
					{/foreach}
				</tbody>
				<tfoot>
					<td colspan="7">P&aacute;ginas: {$tsAsignaciones.pages}</td>
				</tfoot>
			</table>
		{else}
			<div class="nada-gris" style="margin: 10px;">No hay medallas asignadas</div>
		{/if}
		<div class="botoboc">
			<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/medals'" value="Regresar" class="boton azul"/>
		</div>		
	{elseif $tsAct == 'nueva' || $tsAct == 'editar'}

		<form action="" method="post" autocomplete="off">
			<div class="boxblo">
				<h2 class="mixtu">{if $tsAct == 'nueva'}Nueva{else}Editar{/if} medalla</h2>
				<div class="desbox">
					<label for="med_name">T&iacute;tulo de la medalla:</label>				
				</div>		
				<input type="text" id="med_name" name="med_title" value="{$tsMed.m_title}" />
			</div>		
			<div class="boxblo">
				<div class="desbox">
					<label for="ai_desc">Descripci&oacute;n:</label>
					<span id="desc_message_welcome"> 
						<div class="nomo">
							<p style="margin: 5px 0 0 0;">Describe el motivo por el cual el contenido o el usuario ganara esta medalla</p> 
						</div>
					</span>				
				</div>
				<textarea name="med_desc" id="ai_desc" rows="3" cols="40" style="height: 69px;">{$tsMed.m_description}</textarea>
			</div>
			<div class="boxblo">
				<div class="desbox">
					<label for="med_img">Icono de la categor&iacute;a:</label>
					<img src="{$tsConfig.images}/space.gif" style="background:url({$tsConfig.tema.t_url}/images/icons/med/{if $tsMed.m_image}{$tsMed.m_image}{else}{$tsIcons.0}{/if}_16.png) no-repeat center;" width="16" height="16" id="c_icon"/>
				</div>
				<select name="med_img" id="med_img">
					{foreach from=$tsIcons key=i item=img}
						<option value="{$img}" style="background:url({$tsConfig.tema.t_url}/images/icons/med/{$img}_16.png) no-repeat center;" {if $tsMed.m_image == $img}selected="selected"{/if}>{$img}</option>
					{/foreach}
				</select>
			</div>	
			<div class="boxblo">
				<h2 class="mixtu">Condici&oacute;n especial</h2>
				<div id="nulis">
					<label onclick="$('#ai_cond_post').hide(); $('#ai_cond_foto').hide(); $('#ai_cond_user').show(); $('#ai_cond_user_rango_span').show();"><input name="med_type" type="radio" id="ai_type" value="1" {if $tsMed.m_type == 1}checked{/if} class="radio"/>Medalla para usuario</label>
					<label onclick="$('#ai_cond_user').hide(); $('#ai_cond_user_rango').hide();  $('#ai_cond_foto').hide(); $('#ai_cond_post').show();"><input name="med_type" type="radio" id="ay_type" value="2" {if $tsMed.m_type == 2}checked{/if} class="radio"/>Medalla para post</label>
					<label onclick="$('#ai_cond_user').hide(); $('#ai_cond_user_rango').hide();  $('#ai_cond_post').hide(); $('#ai_cond_foto').show();"><input name="med_type" type="radio" id="ay_type" value="3" {if $tsMed.m_type == 3}checked{/if} class="radio"/>Medalla para foto</label>				
				</div>
			</div>
			<div id="filps">
				<!--<input type="text" id="ai_cant" name="med_cant" maxlength="5" value="{$tsMed.m_cant}" {if $tsMed.m_cond_user == 9}style="display:none;"{/if} />-->
				<input type="text" id="ai_cant" name="med_cant" maxlength="5" value="{$tsMed.m_cant}"/>
				<select name="med_cond_user" id="ai_cond_user" {if $tsMed.m_type != 1}style="display:none;"{/if} onchange="if($('#ai_cond_user').val() == 9) $('#ai_cond_user_rango').show();  else  $('#ai_cond_user_rango').hide();">
					<option value="1"{if $tsMed.m_cond_user == 1} selected{/if}>Puntos</option>
					<option value="2"{if $tsMed.m_cond_user == 2} selected{/if}>Seguidores</option>
					<option value="3"{if $tsMed.m_cond_user == 3} selected{/if}>Siguiendo</option>
					<option value="4"{if $tsMed.m_cond_user == 4} selected{/if}>Comentarios en posts</option>
					<option value="5"{if $tsMed.m_cond_user == 5} selected{/if}>Comentarios en fotos</option>
					<option value="6"{if $tsMed.m_cond_user == 6} selected{/if}>Posts</option>
					<option value="7"{if $tsMed.m_cond_user == 7} selected{/if}>Fotos</option>
					<option value="8"{if $tsMed.m_cond_user == 8} selected{/if}>Medallas</option>
					<option value="9"{if $tsMed.m_cond_user == 9} selected{/if}>Rango</option>
				</select>
				<select name="med_cond_user_rango" id="ai_cond_user_rango" {if $tsMed.m_type != 1 || $tsMed.m_cond_user != 9}style="display:none;"{/if}  onchange="if($('#ai_cond_user').val() != 9) $('#ai_cond_user_rango').slideUp();">
					{foreach from=$tsRangos item=r}
						<option value="{$r.rango_id}" style="color:#{$r.r_color}" {if $r.rango_id == $tsMed.m_cond_user_rango}selected{/if}>{$r.r_name}</option>
					{/foreach}
				</select>
				<select name="med_cond_post" id="ai_cond_post" {if $tsMed.m_type != 2}style="display:none;"{/if}>
					<option value="1"{if $tsMed.m_cond_post == 1} selected{/if}>Puntos</option>
					<option value="2"{if $tsMed.m_cond_post == 2} selected{/if}>Seguidores</option>
					<option value="3"{if $tsMed.m_cond_post == 3} selected{/if}>Comentarios</option>
					<option value="4"{if $tsMed.m_cond_post == 4} selected{/if}>Favoritos</option>
					<option value="5"{if $tsMed.m_cond_post == 5} selected{/if}>Denuncias</option>
					<option value="6"{if $tsMed.m_cond_post == 6} selected{/if}>Visitas</option>
					<option value="7"{if $tsMed.m_cond_post == 7} selected{/if}>Medallas</option>
					<option value="8"{if $tsMed.m_cond_post == 8} selected{/if}>Veces compartido</option>
				</select>
				<select name="med_cond_foto" id="ai_cond_foto" {if $tsMed.m_type != 3}style="display:none;"{/if}>
					<option value="1"{if $tsMed.m_cond_foto == 1} selected{/if}>Puntos positivos</option>
					<option value="2"{if $tsMed.m_cond_foto == 2} selected{/if}>Puntos negativos</option>
					<option value="3"{if $tsMed.m_cond_foto == 3} selected{/if}>Comentarios</option>
					<option value="4"{if $tsMed.m_cond_foto == 4} selected{/if}>Visitas</option>
					<option value="5"{if $tsMed.m_cond_foto == 5} selected{/if}>Medallas</option>
				</select>
			</div>										
			{if $tsAct == 'nueva'}
				<div class="botoboc">
					<input type="submit" name="save" value="Crear medalla" class="boton azul">
				</div>			
			{else}
				<div class="botoboc">
					<input type="submit" name="edit" value="Guardar" class="boton azul">
				</div>			
			{/if}										
		</form>
	{/if}
</div>