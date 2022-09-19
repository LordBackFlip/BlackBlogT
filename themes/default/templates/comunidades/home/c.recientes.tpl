<div class="boxposts separa">
	<div class="titular">
		<h2>Comunidades recientes</h2>
	</div>
	<section class="secomo">
		{if $tsRecientes}
            {foreach from=$tsRecientes item=c}
			<article>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|limit:50}</a>
			</article>
			{/foreach}			
		{else}
			<div class="nada-gris">No hay comunidades recientes</div>
		{/if}			
	</section>
	<a style="margin-top: 10px;text-align: center;display: block;" href="{$tsConfig.url}/comunidades/crear/" class="boto gris">&iquest;Qu&eacute; esperas para crear la tuya?</a>
</div>    