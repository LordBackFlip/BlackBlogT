{if $tsFiltro == 3 && $tsType == news}
	{include file='modules/m.perfil_muro_story_posts.tpl'}
{else}
{foreach from=$tsMuro.data item=p}
	{if $tsType == 'story'}
		<div class="fectshie">
			<span>{$p.p_date|fecha}</span>
		</div>	
	{/if}
	<div class="Story" id="pub_{$p.pub_id}">
		<div class="boxreshout">
			{if $p.p_compa == 1}
				<a href="{$tsConfig.url}/perfil/{$tsUser->getUserName($p.p_user_shared)}" class="Story_Pic"><img alt="{$p.user_name}" src="{$tsConfig.url}/files/avatar/{$p.p_user_shared}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/></a>
				<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="non"><img alt="{$p.user_name}" src="{$tsConfig.url}/files/avatar/{$p.p_user_pub}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/></a>		
			{else}
				<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="Story_Pic"><img alt="{$p.user_name}" src="{$tsConfig.url}/files/avatar/{$p.p_user_pub}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/></a>		
			{/if}
		</div>	
		<div class="Story_Content">
			<span class="pushot"></span>
			<div class="Story_Head">
				{if $tsType == 'story'}
				{else}
				{if $p.p_user == $tsUser->uid || $p.p_user_pub == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moepm}
					{if $tsUser->is_admod}
						<span onclick="muro.eliminar({$p.pub_id},1); return false;" class="i elimina"></span>
					{else}
						<span onclick="muro.del_pub({$p.pub_id},1); return false;" class="i elimina"></span>
					{/if}
				{/if}
				{/if}
				<div class="quiendi"> 
					@<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="a_blue">{$p.user_name}</a> {if $p.p_type == 1}dijo{else}comparti&oacute;{/if}
					{if $p.p_compa == 1}v&iacute;a @<a href="{$tsConfig.url}/perfil/{$tsUser->getUserName($p.p_user_shared)}" class="a_blue">{$tsUser->getUserName($p.p_user_shared)}</a>{/if}
				</div>
				<div class="shoutbody">{$p.p_body|quot}</div>				
				{if $p.p_type == 2}
				<div class="tfoto">
					<img src="{$p.a_img}"/>
				</div>
				{elseif $p.p_type == 3}
				<div class="tlink">
					<h2><a href="{$p.a_url}" target="_blank">{$p.a_title}</a></h2>
					<div class="folink">						
						<a href="{$p.a_url}" target="_blank" class="a_blue"><img class="icon" src="http://www.google.com/s2/favicons?domain={$p.a_url}">{$p.a_url|replace:'http://':''|limit:80}</a>						
					</div>
				</div>
				{elseif $p.p_type == 4}
					<div class="tvideo">
						<iframe width="574" height="315" src="https://www.youtube.com/embed/{$p.a_url}" frameborder="0" allowfullscreen></iframe>
					</div>
				{/if}
			</div>
			<div class="Story_Foot">
				<!--
				{if $tsType == 'story'}
				<div class="shoL">
					<a class="vctip" title="Denunciar" onclick="denuncia.nueva('tema',{$tsTema.t_id}, '{$tsTema.t_titulo}', '{$tsAutor.user_name}'); return false;"><span class="i denuncias"></span></a>
				</div>
				{/if}
				-->
				<div class="lefsho">
					{if $p.p_type == 1}<span class="i tipot"></span>{/if}
					{if $p.p_type == 2}<span class="i tipoi"></span>{/if}
					{if $p.p_type == 3}<span class="i tipol"></span>{/if}
					{if $p.p_type == 4}<span class="i tipov"></span>{/if}
					<a>{$p.p_date|fecha}</a>
				</div>
				<div class="shofo">					
					<a class="vctip" title="Ver actividad" onclick="ver_actividad('{$p.pub_id}'); return false;"><span class="i actividades"></span></a>
					<a class="abrir" href="{$tsConfig.url}/perfil/{if $p.p_user == $p.p_user_pub}{$p.user_name}{else}{$tsUser->getUserName($p.p_user)}{/if}/{$p.pub_id}">{if $p.p_user == $p.p_user_pub}Abrir{else}Comentar{/if}</a>					
					<a class="vctip" title="Comentarios {if $p.p_privacidad != 0}cerrados{/if}" {if $p.p_privacidad == 0}onclick="muro.show_comment_box('{$p.pub_id}'); return false;"{/if}><span class="i comenta"></span><div class="acnu" id="sunc_{$p.pub_id}"><b id="datine">{$p.p_comments}</b></div></a>
					<a class="vctip" title="Favoritos" onclick="favorito_shout('{$p.pub_id}'); return false;" id="sunf_{$p.pub_id}"><span class="i {if $p.favorito.si ==1}favoriAmarillo{else}favori{/if}"></span><div class="acnu">{$p.p_favoritos}</div></a>
					<a class="vctip" title="Me gusta" onclick="muro.like_this('{$p.pub_id}', 'pub'); return false;" id="sunl_{$p.pub_id}"><span class="i {if $p.likes.ami ==1}likeliVerde{else}likeli{/if}"></span><div class="acnu">{$p.p_likes}</div></a>
					<a class="vctip" title="Compartir" onclick="compartir_shout('{$p.pub_id}'); return false;" id="suns_{$p.pub_id}"><span class="i  {if $p.compartir.si ==1}repostVerde{else}repost{/if}"></span><div class="acnu">{$p.p_shared}</div></a>
				</div>
			</div>
			<div class="espera" id="carga_{$p.pub_id}"></div>
			<div id="activida{$p.pub_id}" style="display:none;"></div>
			{if $tsType == 'story'}{else}
				{if $tsPrivacidad.mf.v == true && $tsUser->is_member || $tsType == 'news' || $tsType == 'destacados' || $tsType == 'populares' || $tsType == 'publico'}			
					<div class="adres" id="cb_{$p.pub_id}">
						<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" width="32" height="32"/>
						<textarea class="autogrow" title="Escribe un comentario..." id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" onfocus="onfocus_input(this)" onblur="onblur_input(this)"></textarea>
						<span class="boto gris" onclick="muro.comentar('{$p.pub_id}');">Comentar</span>
					</div>
				{/if}
			{/if}			
		</div>
	</div>		
{/foreach}
{/if}