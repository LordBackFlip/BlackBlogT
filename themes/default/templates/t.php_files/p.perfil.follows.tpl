1:
	{if $tsHide != 'true'}
		<div id="perfil_{$tsType}" class="widget" status="activo">
	{/if}
	<div class="titular">
		<h2>{if $tsType == 'seguidores'}Usuarios que siguen a {$tsUsername}{else}Usuarios que {$tsUsername} sigue{/if}</h2>	
	</div>
    {if $tsData.data}
		{foreach from=$tsData.data item=u}
		<div class="divo">
			<a class="simpeda" href="{$tsConfig.url}/perfil/{$u.user_name}">
				<img src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" width="32" height="32"/>
			</a>
			<div class="otrop">
				<a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a>
				<p><img src="{$tsConfig.images}/flags/{$u.user_pais|lower}.png"/> {$u.p_mensaje|limit:50}</p>			
			</div>
			<div class="sigod">
				{if $tsUser->is_member && $u.user_id != $tsUser->uid}
					<a class="boto verde mf_{$u.user_id}" onclick="notifica.unfollow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 0}style="display: none;"{/if}><span class="i oji"></span>Siguiendo</a>
					<a class="boto gris mf_{$u.user_id}" onclick="notifica.follow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 1}style="display: none;"{/if}><span class="i oji"></span>Seguir</a>						
				{elseif !$tsUser->is_member}
					<a class="boto gris" href="#" onclick="registro_load_form(); return false"><span class="i oji"></span>Seguir</a>
				{/if}			
			</div>
		</div>
		{/foreach}
		{if $tsData.pages.prev != 0}
			<a href="#" onclick="perfil.follows('{$tsType}', {$tsData.pages.prev}); return false;" class="anterior-listado floatL">Anterior</a>
		{/if}
		{if $tsData.pages.next != 0}
			<a href="#" onclick="perfil.follows('{$tsType}', {$tsData.pages.next}); return false;" class="siguiente-listado floatR">Siguiente</a>
		{/if}	
    {else}
		<div class="nada-gris" style="margin:5px 0 0 0;">{if $tsType == 'seguidores'}No tiene seguidores{else}No sigue usuarios{/if}</div>
    {/if}    
{if $tsHide != 'true'}</div>{/if}