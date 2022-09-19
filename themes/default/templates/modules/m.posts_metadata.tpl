<div id="malecho"></div>
{if $tsPost.post_user != $tsUser->uid}	
<div class="nels">
	<p><span class="toup-medal"></span>Dar puntos</p>
</div>
{/if}
<div class="meta">
	{*
	<div class="metatop">
		<div class="comparte">
			<span id="copnu">{$tsPost.post_shared|number_format:0:",":"."}</span>
			{if $tsUser->is_member}
				<a onclick="notifica.sharePost({$tsPost.post_id});"><b>T!</b>Compartir</a>
			{else}
				<a href="{$tsConfig.url}/registro/"><b>T!</b>Compartir</a>
			{/if}
		</div>
		<div id="socialrfo">
			<a class="fosrg qtip" onclick="RedSocial('https://plus.google.com/share?url={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html');" title="Compartir en Google"></a>
			<a class="fosrt qtip" onclick="RedSocial('https://twitter.com/intent/tweet?url={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html&text=Te invito a ver este post');" title="Compartir en Twitter"></a>			
			<a class="fosrf qtip" onclick="RedSocial('https://www.facebook.com/sharer/sharer.php?u={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html');" title="Compartir en Facebook"></a>	
		</div>
		
	</div>
	*}
	<div class="metacentro">
		<div id="agrepundi">Puntos agregados!</div>
		<div class="floatL" id="pundi">
			{include file='modules/m.posts_dar_puntos.tpl'}
		</div>
		<div class="floatR">
			<p class="cupuntos"><b id="puntos_post">{$tsPost.post_puntos|number_format:0:",":"."}</b> Puntos</p>
			{*<div class="score">Votos: <b>{$tsPost.votos}</b> - T! score: <b>{$tsPost.score}</b></div>*}
		</div>
	</div>
	<div class="metabottom">
		<div class="botones">
			{if !$tsUser->is_member}
				<li>
				<a class="btn_g follow_user_post" href="{$tsConfig.url}/registro/"><span class="toup-eye"></span>Seguir Post</a>
				</li>
			{elseif $tsPost.post_user != $tsUser->uid}				
				<li><a onclick="notifica.sharePost({$tsPost.post_id});" class="tetese">T!</a></li>
				<li><a href="#" onclick="{if !$tsUser->is_member}registro_load_form(){else}add_favoritos(){/if}; return false"><span class="toup-star"></span></a></li>
				<li><a href="#" onclick="denuncia.nueva('post',{$tsPost.post_id}, '{$tsPost.post_title}', '{$tsPost.user_name}'); return false;"><span class="toup-ban"></span>Denunciar</a></li>								
				<li {if !$tsPost.follow}style="display: none;"{/if}><a class="unfollow_post" onclick="notifica.unfollow('post', {$tsPost.post_id}, notifica.inPostHandle, $(this).children('span'))"><span class="toup-eye"></span>Dejar de seguir</a></li>
				<li {if $tsPost.follow > 0}style="display: none;"{/if}><a class="follow_post" onclick="notifica.follow('post', {$tsPost.post_id}, notifica.inPostHandle, $(this).children('span'))"><span class="toup-eye"></span>Seguir Post</a></li>
			{/if}
		</div>
		<div class="floatR">		
			<div class="bulto"><strong>{$tsPost.post_hits|number_format:0:",":"."}</strong>Visitas</div>
			<div class="bulto"><strong id="cfavori">{$tsPost.post_favoritos|number_format:0:",":"."}</strong>Favoritos</div>
			<div class="bulto"><strong>{$tsPost.m_total|number_format:0:",":"."}</strong>Medallas</div>
			<div class="bulto"><strong id="cseguir">{$tsPost.post_seguidores|number_format:0:",":"."}</strong>Seguidores</div>
		</div>
	</div>
</div>