{if $tsTopUsers}
	{foreach from=$tsTopUsers key=i item=u}
		{if $i==0}
		<div id="topUser">
			<a class="avtop" href="{$tsConfig.url}/perfil/{$u.user_name}">
				<img alt="{$u.user_name}" src="{$tsConfig.url}/files/avatar/{$u.user_id}_120.jpg?{$smarty.now}"/>
				<h3>{$u.user_name}</h3>
				<p>{$u.total}</p>
			</a>	
			<div id="igueme">			
				{if $tsUser->is_member && $u.user_id != $tsUser->uid}
					<a class="gris mf_{$u.user_id}" onclick="notifica.unfollow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 0}style="display: none;"{/if}>Siguiendo</a>
					<a class="verde mf_{$u.user_id}" onclick="notifica.follow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 1}style="display: none;"{/if}>Seguir</a>						
				{elseif !$tsUser->is_member}
					<a class="gris" href="#" onclick="registro_load_form(); return false">Seguir</a>
				{/if}
			</div>			
		</div>
		{else}		
		<div class="kleo">
			<b>{if $i < 9}0{/if}{$i+1}.</b>			
			<div class="wrapp">
				<a href="{$tsConfig.url}/perfil/{$u.user_name}">
					<h3>{$u.user_name}</h3>
					<p>{$u.total} puntos</p>
				</a>
			</div>
			<div id="ised">			
				{if $tsUser->is_member && $u.user_id != $tsUser->uid}
					<a class="gris mf_{$u.user_id}" onclick="notifica.unfollow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 0}style="display: none;"{/if}>Siguiendo</a>
					<a class="verde mf_{$u.user_id}" onclick="notifica.follow('user', {$u.user_id}, notifica.userInMencionHandle, $(this).children('span'))" {if $tsUser->iFollow($u.user_id) == 1}style="display: none;"{/if}>Seguir</a>						
				{elseif !$tsUser->is_member}
					<a class="gris" href="#" onclick="registro_load_form(); return false">Seguir</a>
				{/if}
			</div>			
		</div>	
		{/if}				
	{/foreach}
{else}
	<div class="nada-gris" style="margin-top: 10px;">Sin tops en este periodo</div>
{/if}			