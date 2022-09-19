<div class="boxposts separa">
	<div class="titular">
		<h2><a href="{$tsConfig.url}/perfil/{$tsFoto.user_name}">{$tsFoto.user_name}</a></h2>
		<div class="imgda">
			<img class="qtip ran" src="{$tsConfig.default}/images/icons/ran/{$tsFoto.r_image}" title="{$tsFoto.r_name}"/>
			<img class="qtip sex" src="{$tsConfig.default}/images/icons/{if $tsFoto.user_sexo == 0}female{else}male{/if}.png" title="{if $tsFoto.user_sexo == 0}Mujer{else}Hombre{/if}" />
			<img class="qtip pai" src="{$tsConfig.default}/images/flags/{$tsFoto.user_pais.0|lower}.png" title="{$tsFoto.user_pais.1}" />		
		</div>
	</div>
	<div class="boxautor">
		<div class="floatL profile">
			<a class="nomis" href="{$tsConfig.url}/perfil/{$tsFoto.user_name}">
				<img alt="Ver perfil de {$tsFoto.user_name}" src="{$tsConfig.url}/files/avatar/{$tsFoto.f_user}_120.jpg?{$smarty.now|date_format:"%Y%m%d%H%M%S"}"/>
			</a>
			<span class="rank {$tsFoto.status.css}"><a href="/perfil/{$tsFoto.user_name}">{$tsFoto.r_name}</a></span>
		</div>
		<div class="floatL dateando">
			<div class="estupi">
				<strong><span class="i oji"></span><a>{$tsFoto.user_seguidores}</a></strong>
				<p>Seguidores</p>
			</div>
			<div class="estupi">
				<strong><span class="i moneda"></span><a>{$tsFoto.user_puntos}</a></strong>
				<p>Puntos</p>
			</div>
			<div class="estupi">
				<strong><span class="i phos"></span><a>{$tsFoto.user_fotos}</a></strong>
				<p>Fotos</p>
			</div>	
			<div class="floatL botds">
				{if !$tsUser->is_member}
					<a class="boto gris follow_user_post" href="#" onclick="registro_load_form(); return false"><span class="i oji"></span>Seguir</a>
				{elseif $tsUser->uid != $tsFoto.f_user && $tsUser->is_member}
					<a class="boto verde unfollow_user_post" onclick="notifica.unfollow('user', {$tsFoto.f_user}, notifica.userInPostHandle, $(this).children('span'))" {if $tsFoto.follow == 0}style="display: none;"{/if}><span class="i oji"></span>Siguiendo</a>
					<a class="boto gris follow_user_post" onclick="notifica.follow('user', {$tsFoto.f_user}, notifica.userInPostHandle, $(this).children('span'))" {if $tsFoto.follow == 1}style="display: none;"{/if}><span class="i oji"></span>Seguir</a>
				{/if}
			</div>			
		</div>		
	</div>
</div>