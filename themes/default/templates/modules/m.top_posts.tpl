<div class="futopbox">
	<div class="htops">
		<h2>Top post con m&aacute;s puntos</h2>
		<span class="i moneda"></span>
	</div>
	<div class="boxtops">
	{if $tsTops.puntos}
		{foreach from=$tsTops.puntos item=p key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}"/>
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:35}</a>
				<span>{$p.post_puntos}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Top post m&aacute;s favoritos</h2>
		<span class="i mf"></span>
	</div>
	<div class="boxtops">		
	{if $tsTops.favoritos}
		{foreach from=$tsTops.favoritos item=p key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}"/>
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:35}</a>
				<span>{$p.post_favoritos}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}	
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Top post m&aacute;s comentarios</h2>
		<span class="i mmm"></span>
	</div>
	<div class="boxtops">		
	{if $tsTops.comments}
		{foreach from=$tsTops.comments item=p key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}"/>
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:35}</a>
				<span>{$p.post_comments}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}	
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Top post con m&aacute;s seguidores</h2>
		<span class="i issgu"></span>
	</div>
	<div class="boxtops">		
	{if $tsTops.seguidores}
		{foreach from=$tsTops.seguidores item=p key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}"/>
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:35}</a>
				<span>{$p.post_seguidores}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}	
	</div>
</div>