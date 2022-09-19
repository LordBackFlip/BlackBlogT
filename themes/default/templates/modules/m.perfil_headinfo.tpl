<div id="headtop">
	<div class="perfil-avatar">
		<a href="{$tsConfig.url}/perfil/{$tsInfo.nick}">
			<img alt="" src="{$tsConfig.url}/files/avatar/{if $tsInfo.p_avatar}{$tsInfo.uid}_120{else}avatar{/if}.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
		</a>
	</div>
	<div class="perfil-info">
		<h1 class="nick">{if $tsInfo.p_nombre}{$tsInfo.p_nombre}{else}{$tsInfo.nick}{/if} {if $tsInfo.yfollow}<span class="tsigue">&Eacute;sta sigui&eacute;ndote</span>{/if}</h1>
		{if $tsInfo.p_mensaje}
			<div class="pani">{$tsInfo.p_mensaje}</div>
		{else}	
			<div class="pani">@{$tsInfo.nick} - {$tsInfo.user_pais}</div>
		{/if}
		<div class="delp">
			<p><span class="i gene"></span>Es {if $tsInfo.user_sexo == 1}un <b>hombre</b>{else}una <b>mujer</b>{/if}</p>
			<p><span class="i edad"></span>Tiene <b>{if $tsActualm < $tsInfo.user_mes}{$tsActualy-$tsInfo.user_ano-1}{else}{if $tsActuald < $tsInfo.user_dia}{$tsActualy-$tsInfo.user_ano-1}{else}{$tsActualy-$tsInfo.user_ano}{/if}{/if}</b> a&ntilde;os</p>
			<p><span class="i vive"></span>Vive en <b>{$tsInfo.user_pais}</b></p>			
			{if $tsInfo.p_empresa}<p><span class="i traba"></span>Trabaja en <b>{$tsInfo.p_empresa}</b></p>{/if}			
			<p><span class="i unio"></span>Se uni&oacute; a <b>{$tsConfig.titulo}</b> <b id="espp">el {$tsInfo.user_registro|fecha:true}</b></p>
			{if $tsInfo.p_sitio}<p><a href="{$tsInfo.p_sitio}" target="_blank">{$tsInfo.p_sitio|replace:'http://':''}</a></p>{/if}
		</div>
		{if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}
		<div class="botonera">
			<a class="boto verde unfollow_user_post" onclick="notifica.unfollow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 0}style="display: none;"{/if}><span class="i oji"></span>Siguiendo</a>
			<a class="boto gris follow_user_post" onclick="notifica.follow('user', {$tsInfo.uid}, notifica.userInPostHandle, $(this).children('span'))" {if $tsInfo.follow == 1}style="display: none;"{/if}><span class="i oji"></span>Seguir</a>
			<a href="#" onclick="mensaje.nuevo('{$tsInfo.nick}','','',''); return false" class="boto gris"><div class="texbo"><img src="{$tsConfig.images}/icon-mensajes-recibidos.gif"/> Enviar mensaje</div></a>
            <a href="#" onclick="denuncia.nueva('usuario',{$tsInfo.uid}, '', '{$tsInfo.nick}'); return false" class="boto verde"><div class="texbo"><img src="{$tsConfig.images}/icons/warning.png"/>Denunciar</div></a> 
			{if ($tsUser->is_admod || $tsUser->permisos.mosu) && !$tsInfo.user_baneado}
				<a href="#" onclick="mod.users.action({$tsInfo.uid}, 'ban', true); return false;" class="boto rojo">Suspender</a>
			{/if}
		</div>
		{/if}		
	</div>
	<div class="floatR">
		<span title="{if $tsInfo.user_sexo == 1}Hombre{else}Mujer{/if}" class="qtip i {if $tsInfo.user_sexo == 1}chico{else}chica{/if}"></span>
		<img class="qtip pai" src="{$tsConfig.default}/images/flags/{$tsInfo.pais.icon}.png" title="{$tsInfo.pais.name}"/>
	</div>
</div>
<div class="estaper">
	<p class="ranpe"><b style="color:#{$tsInfo.stats.r_color}">{$tsInfo.stats.r_name}<span class="status {$tsInfo.status.css}"></span></b><span>Rango</span></p>
	<p><b>{$tsInfo.stats.user_puntos|number_format:0:",":"."}</b><span>Puntos</span></p>
	<p><b><a href="#posts" onclick="perfil.load_tab('posts', $('#posts'));">{$tsInfo.stats.user_posts|number_format:0:",":"."}</a></b><span>Posts</span></p>
	<p><b>{$tsInfo.stats.user_comentarios}</b><span>Comentarios</span></p>
	<p><b><a href="#temas" onclick="perfil.load_tab('temas', $('#temas'));">{$tsInfo.stats.user_temas|number_format:0:",":"."}</a></b><span>Temas</span></p>	
	<p><b><a href="#seguidores" onclick="perfil.load_tab('seguidores', $('#seguidores'));">{$tsInfo.stats.user_seguidores|number_format:0:",":"."}</a></b><span>Seguidores</span></p>
	<p><b><a href="#siguiendo" onclick="perfil.load_tab('siguiendo', $('#siguiendo'));">{$tsGeneral.sigd.total|number_format:0:",":"."}</a></b><span>Siguiendo</span></p>
</div>