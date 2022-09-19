<div class="tilims">
	<a href="{$tsConfig.url}/mensajes/">Mensajes</a>
	<a href="{$tsConfig.url}/mensajes/">Recibidos</a>
	<span>{$tsMensajes.msg.mp_subject}</span>
	<a class="drojo" onclick="denuncia.nueva('mensaje',{$tsMensajes.msg.mp_id}, '', ''); return false;">Denunciar Mensaje</a>
</div>
<div class="subms">
	<a class="boto gris" href="{$tsConfig.url}/mensajes/">Volver a recibidos</a>
	<a class="boto gris floatR" href="#" onclick="mensaje.eliminar('{$tsMensajes.msg.mp_id}:{$tsMensajes.msg.mp_type}',2); return false;">Eliminar</a>	
</div>
<h2 class="subams">{$tsMensajes.msg.mp_subject}</h2>
{if $tsMensajes.res}
	<div  id="historial">
	{foreach from=$tsMensajes.res item=mp}
		<div class="limps">
			<a href="{$tsConfig.url}/perfil/{$mp.user_name}" class="remispe">
				<img src="{$tsConfig.url}/files/avatar/{$mp.mr_from}_50.jpg?{$smarty.now|date_format:"%Y%m%d%H%M%S"}" />
			</a>
			<div class="rbody">
				<div class="smere">
					@<a href="{$tsConfig.url}/perfil/{$mp.user_name}" class="autor-name">{$mp.user_name}</a> 
					<span class="mp-date">{$mp.mr_date|fecha}</span>
				</div>
				<p>{$mp.mr_body|nl2br}</p>
			</div>
		</div>
	{/foreach}
	</div>
{else}
	<div class="nada-rojo" style="margin-bottom: 10px;">No se pudieron cargar los mensajes</div>
{/if}
{if $tsUser->is_admod || ($tsMensajes.msg.mp_del_to == 0 && $tsMensajes.msg.mp_del_from == 0 && $tsMensajes.ext.can_read == 1)}
	<div class="mpForm">
		<a href="{$tsConfig.url}/perfil/{$tsUser->nick}" class="remispe">
			<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" />
		</a>	
		<div class="form">
			<textarea id="respuesta" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="Escribe una respuesta..." class="autogrow onblur_effect">Escribe una respuesta...</textarea>
			<input type="hidden" id="mp_id" value="{$tsMensajes.msg.mp_id}" />
			<a class="boto gris floatR" onclick="mensaje.responder(); return false;">Responder</a>
		</div>
	</div>
{else}
	<div class="nada-amarillo">Un participante abandon&oacute; la conversaci&oacute;n o no tienes permiso para responder</div>
{/if}