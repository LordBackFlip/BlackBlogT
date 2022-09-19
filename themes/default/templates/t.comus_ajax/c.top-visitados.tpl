	{if $tsVisitados}
		{foreach from=$tsVisitados key=i item=c}
			<article>
				<b>{$i+1}</b>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/{$c.t_id}/{$c.t_titulo|seo}.html#coment_id_{$c.r_id}">{$c.t_titulo|limit:30}</a>				
				<span>{$c.t_visitas}</span>
			</article>
		{/foreach}
	{else}
		<div class="nada-gris" style="margin-bottom: 10px;">Sin temas visitados en este periodo</div>
	{/if}	