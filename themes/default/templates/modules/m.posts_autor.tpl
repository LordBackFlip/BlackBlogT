<div class="esees">
	<div class="eites">
		<a class="nomis" href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
			<img alt="Ver perfil de {$tsAutor.user_name}" src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg?{$smarty.now}"/>
		</a>
		<span><img src="{$tsConfig.default}/images/icons/ran/{$tsAutor.rango.r_image}" title="{$tsAutor.rango.r_name}"/>{$tsAutor.rango.r_name}</span>
	</div>
	<div class="gkes">
		<div class="eolr">
			<span class="tepe-{$tsAutor.status.css} vctip" title="{$tsAutor.status.css}"></span>
			<a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">{$tsAutor.user_name}</a>
		</div>	
		<div class="nekes">
			{if $tsAutor.user_sexo == 0}<span class="toup-female vctip" title="Mujer"></span>{else}<span class="toup-male vctip" title="Hombre"></span>{/if}
			<img class="vctip pai" src="{$tsConfig.default}/images/flags/{$tsAutor.pais.icon}.png" title="{$tsAutor.pais.name}" />		
		</div>
		<div class="eliese">
			<div class="tyes"><span class="toup-user"></span><b>{$tsAutor.user_seguidores|number_format:0:",":"."}</b> Seguidores</div>
			<div class="tyes"><span class="toup-bullseye"></span><b>{$tsAutor.user_puntos|number_format:0:",":"."}</b> Puntos</div>
			<div class="tyes"><span class="toup-files-o"></span><b>{$tsAutor.user_posts|number_format:0:",":"."}</b> Posts</div>
		</div>
		{if !$tsUser->is_member}
			<a class="bverde follow_user_post" href="/registro/">Seguir</a>
		{elseif $tsAutor.user_id != $tsUser->uid}
			<a class="bgris unfollow_user_post" onclick="notifica.unfollow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if !$tsAutor.follow}style="display: none;"{/if}>Siguiendo</a>
			<a class="bverde follow_user_post" onclick="notifica.follow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if $tsAutor.follow > 0}style="display: none;"{/if}>Seguir</a>
		{/if}		
	</div>
</div>