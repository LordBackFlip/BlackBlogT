<div class="interes">
	<h3>Tambi&eacute;n te puede interesar...</h3>
	{if $tsRelated}
		{foreach from=$tsRelated item=p key=i}			
			<div class="clerela" id="espacio{$i+1}">
				<a class="cates" title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
					{if $p.post_portada}
						<img class="loadimg" title="{$p.post_title|limit:20}" data-original="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P240X180.jpg"/>
					{else}	
						<img class="loadimg" title="{$p.post_title|limit:20}" data-original="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
					{/if}
				</a>
				<div class="ditip">
					{*<span>{$p.c_nombre}</span>*}
					<a title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title}</a>
				</div>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">No hay posts relacionados que te puedan interesar</div>
	{/if}			
</div>