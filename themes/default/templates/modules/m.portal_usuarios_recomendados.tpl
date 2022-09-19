<div class="boxposts separa">
	<div class="titular">
		<h2>Usuarios recomendados</h2>
	</div>	
	{if $tsRecomendados}
	<div class="boxreco">	
		{foreach from=$tsRecomendados item=u}
		{*
		{if $tsUser->iFollow($u.user_id) == 0}
		*}
		<div class="zebrea">
			<a class="sipo" href="{$tsConfig.url}/perfil/{$u.user_name}">
				<img alt="{$u.user_name}" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
			</a>
			<div class="dareco">
				<a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name|limit:15}</a>
				<span>{$u.p_nombre|limit:15}</span>
			</div>
			<div class="floatR">
				{if $tsUser->is_member && $u.user_id != $tsUser->uid}
					<a class="boto verde mf_{$u.user_id}" onclick="notifica.unfollow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 0}style="display: none;"{/if}><span class="i oji"></span>Siguiendo</a>
					<a class="boto gris mf_{$u.user_id}" onclick="notifica.follow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 1}style="display: none;"{/if}><span class="i oji"></span>Seguir</a>						
				{elseif !$tsUser->is_member}
					<a class="boto gris" href="{$tsConfig.url}/registro/"><span class="i oji"></span>Seguir</a>
				{/if}			
			</div>
		</div>
		{*
		{/if}
		*}
		{/foreach}		
	</div>	
	{else}
		<div class="nada-gris">No hay usuarios recomendados</div>
	{/if}
</div>