{if $tsPopulares}
	{foreach from=$tsPopulares key=i item=c}
		<article>
			<b>{$i+1}</b>
			<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|limit:30}</a>
			<span>{$c.c_miembros}</span>
		</article>
	{/foreach}
{else}
	<div class="nada-gris" style="margin-bottom: 10px;">Sin populares en este periodo</div>
{/if}			