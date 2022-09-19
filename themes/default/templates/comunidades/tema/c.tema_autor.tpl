<div class="boxposts separa">
	<div class="titular">
		<h2><a href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">{$tsAutor.user_name}</a></h2>
		<div class="imgda">
			<img class="qtip ran" src="{$tsConfig.default}/images/icons/ran/{$tsAutor.rango.r_image}" title="{$tsAutor.rango.r_name}" />
			<img class="qtip sex" src="{$tsConfig.default}/images/icons/{if $tsAutor.user_sexo == 0}female{else}male{/if}.png" title="{if $tsAutor.user_sexo == 0}Mujer{else}Hombre{/if}" />
			<img class="qtip pai" src="{$tsConfig.default}/images/flags/{$tsAutor.pais.icon}.png" title="{$tsAutor.pais.name}" />		
		</div>
	</div>
	<div class="boxautor">
		<div class="floatL profile">
			<a class="nomis" href="{$tsConfig.url}/perfil/{$tsAutor.user_name}">
				<img alt="Ver perfil de {$tsAutor.user_name}" src="{$tsConfig.url}/files/avatar/{$tsAutor.user_id}_120.jpg?{$smarty.now|date_format:"%Y%m%d%H%M%S"}"/>
			</a>
			<span class="rank {$tsAutor.status.css}"><a href="/perfil/{$tsAutor.user_name}">{$tsAutor.rango.r_name}</a></span>
		</div>
		<div class="floatL dateando">
			<div class="estupi">
				<strong><span class="i oji"></span><a>{$tsAutor.user_seguidores|number_format:0:",":"."}</a></strong>
				<p>Seguidores</p>
			</div>
			<div class="estupi">
				<strong><span class="i moneda"></span><a>{$tsAutor.user_puntos|number_format:0:",":"."}</a></strong>
				<p>Puntos</p>
			</div>
			<div class="estupi">
				<strong><span class="i temas"></span><a>{$tsAutor.user_temas|number_format:0:",":"."}</a></strong>
				<p>Temas</p>
			</div>
			<div class="floatL botds">
				{if !$tsUser->is_member}
				<a class="boto gris follow_user_post" href="/registro/"><span class="i oji"></span>Seguir</a>
				{elseif $tsAutor.user_id != $tsUser->uid}
				<a class="boto verde unfollow_user_post" onclick="notifica.unfollow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if !$tsAutor.follow}style="display: none;"{/if}><span class="i oji"></span>Siguiendo</a>
				<a class="boto gris follow_user_post" onclick="notifica.follow('user', {$tsAutor.user_id}, notifica.userInPostHandle, $(this).children('span'))" {if $tsAutor.follow > 0}style="display: none;"{/if}><span class="i oji"></span>Seguir</a>
				{/if}
			</div>			
		</div>		
	</div>
</div>