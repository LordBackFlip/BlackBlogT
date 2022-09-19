{foreach from=$tsMuro.data item=p}
<div class="boxposts separa">
	<div class="titular">
		<h2><a href="{$tsConfig.url}/perfil/{$p.user_name}">{$p.user_name}</a></h2>
		<div class="imgda">
			<img class="qtip ran" src="{$tsConfig.default}/images/icons/ran/{$p.r_image}" title="{$p.r_name}" />
			<img class="qtip sex" src="{$tsConfig.default}/images/icons/{if $p.user_sexo == 0}female{else}male{/if}.png" title="{if $p.user_sexo == 0}Mujer{else}Hombre{/if}" />
			<img class="qtip pai" src="{$tsConfig.default}/images/flags/{$p.pais.icon}.png" title="{$p.pais.name}" />		
		</div>
	</div>
	<div class="boxautor">
		<div class="floatL profile">
			<a class="nomis" href="{$tsConfig.url}/perfil/{$p.user_name}">
				<img alt="Ver perfil de {$tsAutor.user_name}" src="{$tsConfig.url}/files/avatar/{$p.user_id}_120.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
			</a>
			<span class="rank {$p.status.css}"><a href="/perfil/{$p.user_name}">{$p.r_name}</a></span>
		</div>
		<div class="floatL dateando">
			<div class="estupi">
				<strong><span class="i oji"></span><a>{$p.user_seguidores}</a></strong>
				<p>Seguidores</p>
			</div>
			<div class="estupi">
				<strong><span class="i moneda"></span><a>{$p.user_puntos}</a></strong>
				<p>Puntos</p>
			</div>
			<div class="estupi">
				<strong><span class="i temas"></span><a>{$p.shouts}</a></strong>
				<p>Shouts</p>
			</div>	
			<div class="floatL botds">
				{if !$tsUser->is_member}
				<a class="boto gris follow_user_post" href="#" onclick="registro_load_form(); return false"><span class="i oji"></span>Seguir</a>
				{elseif $p.user_id != $tsUser->uid}
				<a class="boto verde unfollow_user_post" onclick="notifica.unfollow('user', {$p.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if !$p.follow}style="display: none;"{/if}><span class="i oji"></span>Siguiendo</a>
				<a class="boto gris follow_user_post" onclick="notifica.follow('user', {$p.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if $p.follow > 0}style="display: none;"{/if}><span class="i oji"></span>Seguir</a>
				{/if}
			</div>			
		</div>		
	</div>
</div>
{/foreach}