<div class="boxposts separa">
	<div class="titular">
		<h2>Comentarios Recientes</h2>
	</div>
	<section class="secomo">
		{if $tsLastRespuestas}
        	{foreach from=$tsLastRespuestas item=r}
			<article>
				<span><a href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name}</a></span>
				<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$r.t_id}/{$r.t_titulo|seo}.html#coment_id_{$r.r_id}">{$r.t_titulo}</a>
			</article>
			{/foreach}
		{else}
			<div class="nada-gris">No hay comentarios recientes</div>
		{/if}			
	</section>
</div>