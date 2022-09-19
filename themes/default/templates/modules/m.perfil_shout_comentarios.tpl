<div class="bee">
{foreach from=$tsMuro.data item=p}
{if $p.p_privacidad == '2'}<!--NADIE PUEDE COMENTAR-->
	<div class="nada-rojo">El shout se encuentra cerrado y no se permiten comentarios</div>	
{else}
	<div class="titular">
		<h2><b id="datin">{$p.p_comments}</b> Comentarios</h2>
	</div>	
	<div id="cl_{$p.pub_id}">
	{if $p.comments}
		{foreach from=$p.comments item=c}
			<div class="clearfix ufiItem" id="cmt_{$c.cid}">
				<a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorPic">
					<img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.c_user}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
				</a>
				<div class="mensaje">				
					<div class="comment-info clearbeta">
					<div class="btoace botonear">
						<a onclick="muro.like_this({$c.cid}, 'com', this); return false;" class="a_blue qtip" title="{$c.like}">
							<span class="i sigusta"></span>
						</a>
						{if $p.p_user == $tsUser->uid || $c.c_user == $tsUser->uid  || $tsUser->is_admod || $tsUser->permisos.moecm}
							<a href="#" onclick="muro.eliminar({$c.cid}, 2); return false" class="qtip" title="Eliminar"><span class="i eliminas"></span></a>
						{/if}						
					</div>					
						<div class="floatL">
							@<a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorName a_blue">{$c.user_name}</a>
							<span> {$c.c_date|fecha}</span>
							<div class="numbersvotes">
								<div class="overview">
									<span class="positivo {if $c.c_likes == 0}versi{/if}" id="mgus_{$c.cid}">{$c.c_likes}</span>
								</div>
							</div>						
						</div>						
					</div>	
					<div class="comment-content">{$c.c_body|quot}</div>
				</div>
			</div>
		{/foreach}
	{else}
		{if $tsUser->is_member}
			{if $p.p_privacidad == '1' && $p.follow == '0'}
				{if $p.user_id == $tsUser->uid}
					<div class="nada-azul" style="margin-top: 10px;">No hay comentarios. ¡S&eacute; el primero!</div>
				{/if}	
			{else}
				<div class="nada-azul" style="margin-top: 10px;">No hay comentarios. ¡S&eacute; el primero!</div>
			{/if}
		{else}
			<div class="nada-amarillo" style="margin-top: 10px;"><a href="/registro/">Registrate</a> para poder comentar el shout</div>
		{/if}
	{/if}		
	</div>
	{if $tsPrivacidad.mf.v == true && $tsUser->is_member}
	
		{if $p.p_privacidad == '0'}<!--TODOS PUEDEN COMENTAR-->
			<div id="fulcomx">
				<img class="avetesu" src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>		
				<textarea  class="autogrow onblur_effect" id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" title="Escribir un comentario..." onfocus="onfocus_input(this)" onblur="onblur_input(this)">Escribir un comentario...</textarea>
				<div class="limpse">	
					<a class="boto gris floatL" onclick="muro.comentar_shout({$p.pub_id});">Comentar</a>
					{include file='modules/m.global_emoticons.tpl'}
				</div>
			</div>
		{else}
			{if $p.user_id == $tsUser->uid}
				<div id="fulcomx">
					<img class="avetesu" src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg"/>		
					<textarea  class="autogrow onblur_effect" id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" title="Escribir un comentario..." onfocus="onfocus_input(this)" onblur="onblur_input(this)">Escribir un comentario...</textarea>
					<div class="limpse">	
						<a class="boto gris floatL" onclick="muro.comentar_shout({$p.pub_id});">Comentar</a>
						{include file='modules/m.global_emoticons.tpl'}
					</div>
				</div>			
			{else}	
				{if $p.p_privacidad == '1' && $p.follow == '0'}
					<div class="nada-azul">Solo usuarios que sigue pueden comentar su shout</div>
				{else}		
					<div id="fulcomx">
						<img class="avetesu" src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg"/>		
						<textarea  class="autogrow onblur_effect" id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" title="Escribir un comentario..." onfocus="onfocus_input(this)" onblur="onblur_input(this)">Escribir un comentario...</textarea>
						<div class="limpse">	
							<a class="boto gris floatL" onclick="muro.comentar_shout({$p.pub_id});">Comentar</a>
							{include file='modules/m.global_emoticons.tpl'}
						</div>
					</div>	
				{/if}
			{/if}
		{/if}		
	{else}
		<div id="cb_{$p.pub_id}" class="nada-gris" style="display:none;width: 585px;margin: 0 auto;position: relative;">
			No tienes permiso para comentar el shout
		</div>
	{/if}
{/if}
{/foreach}
</div>