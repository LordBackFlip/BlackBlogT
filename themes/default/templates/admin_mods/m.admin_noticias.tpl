<div class="boxy-title">
	<h3>Noticias</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}
		<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados</div>
	{/if}																
	{if $tsDelete == 'true'}
		<div style="display: block;" class="mensajes ok">Noticia eliminada</div>
	{/if}
	{if $tsAct == ''}
		{if $tsNews}
		<table cellpadding="0" cellspacing="0" border="0" class="admin_table" width="688px" align="center">
			<thead>
				<th>ID</th>
				<th>Noticia</th>
				<th>Autor</th>
				<th>Fecha</th>
				<th>Estado</th>
				<th>Acciones</th>
			</thead>
			<tbody>				
				{foreach from=$tsNews item=n}
					<tr>
						<td>{$n.not_id}</td>
						<td>{$n.not_body}</td>
						<td><a href="{$tsConfig.url}/perfil/{$n.user_name}" class="hovercard" uid="{$n.user_id}">{$n.user_name}</a></td>
						<td>{$n.not_date|hace:true}</td>
						<td id="status_noticia_{$n.not_id}">{if $n.not_active == 0}<font color="purple">Inactiva</font>{else}<font color="green">Activa</font>{/if}</td>
						<td class="admin_actions">
							<a href="{$tsConfig.url}/admin/news/editar/{$n.not_id}"><img src="{$tsConfig.default}/images/icons/editar.png" title="Editar" /></a>
							<a onclick="admin.news.accion({$n.not_id}); return false"><img src="{$tsConfig.default}/images/reactivar.png" title="Activar/Desactivar Noticia" /></a>
							<a href="{$tsConfig.url}/admin/news?act=borrar&nid={$n.not_id}"><img src="{$tsConfig.default}/images/icons/close.png" title="Borrar" /></a>
						</td>
					</tr>
				{/foreach}
			</tbody>
		</table>
		{else}
			<div class="nada-gris" style="margin: 10px;">No hay noticias ni avisos</div>
		{/if}
		<div class="botoboc">
			<input type="button" onclick="location.href = '{$tsConfig.url}/admin/news/nueva'" class="boton azul" value="Nueva noticia"/>
		</div>		
	{elseif $tsAct == 'nuevo' || $tsAct == 'editar'}
		<form action="" method="post" autocomplete="off">		
			<div class="boxblo">
				<div class="desbox">
					<label for="ai_new">{if $tsAct == 'nuevo'}Agregar {else}Editar{/if} noticia:</label>
					<span id="desc_message_welcome"> 
						<div class="nomo">
							<p style="margin: 5px 0 0 0;">El m&aacute;ximo de caracteres permitidos es de <b>190</b></p> 
							<p style="color: #008800;display: block;margin-top: 5px;">Puedes utilizar los siguentes BBCodes [url], [i] [b] y [u]</p>
						</div>
					</span>				
				</div>
				<textarea name="not_body" id="ai_new" rows="3" cols="50" style="height: 90px;">{$tsNew.not_body}</textarea>
			</div>
			<div class="boxblo">
				<div class="desbox">
					<label for="ai_count_guests">Activar noticia</label>
					<span class="foquito" onclick="mydialog.alert('Información','Activar inmediatamente esta noticia en {$tsConfig.titulo}.')"></span>
				</div>
				<select name="not_active">
					<option value="1" {if $tsNew.not_active == 1}selected="selected"{/if}>Si</option>
					<option value="0" {if $tsNew.not_active != 1}selected="selected"{/if}>No</option>
				</select>										
			</div>			
		<div class="botoboc">
			<input type="submit" name="save" value="{if $tsAct == 'new'}Agregar noticia{else}Guardar cambios{/if}" class="boton azul"/>
		</div>			
		</form>				
	{elseif $tsAct == 'borrar'}                                   
		<form action="" method="post" id="admin_form" autocomplete="off">
			<div class="aviso-error" style="margin: 20px;">Noticia eliminada</div>		
			<div class="botoboc">
				<input type="button" name="confirm" onclick="location.href = '/admin/news?borrar=true'" value="Regresar" class="boton azul"/>
			</div>
		</form>
	{/if}									
</div>