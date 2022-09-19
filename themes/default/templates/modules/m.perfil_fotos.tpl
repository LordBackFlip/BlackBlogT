<div class="boxposts separa">
	<div class="titular">
		<h2>Mis im&aacute;genes</h2>
		<a class="botob" href="/fotos/{$tsInfo.nick}">{$tsInfo.stats.user_fotos|number_format:0:",":"."}</a>
	</div>
	{if $tsGeneral.fotos_total > 0}
		<div class="fotope">
			{foreach from=$tsGeneral.fotos item=f key=i}
				{if $f.foto_id}
				<a href="{$tsConfig.url}/fotos/{$tsInfo.nick}/{$f.foto_id}/{$f.f_title|seo}.html" title="{$f.f_title|truncate:10}">
					<img class="loadimg" data-original="{$f.f_url}" width="80" height="80"/> 
				</a>
				{/if}
			{/foreach}
		</div>
		{if $tsGeneral.fotos_total >= 6}		
			<div class="titular"><h2 id="vermasp"><a href="{$tsConfig.url}/fotos/{$tsInfo.nick}">Ver más</a></h2></div>
		{/if}
	{else}	
		<div class="nada-gris">No tiene im&aacute;genes publicadas</div>
	{/if}
</div>