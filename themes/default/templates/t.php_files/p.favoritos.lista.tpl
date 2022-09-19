{if $tsFavoritos.data}
	{foreach from=$tsFavoritos.data item=f}
		<div id="notu">			
			<a href="{$tsConfig.url}/posts/{$f.c_seo}/{$f.post_id}/{$f.post_title|seo}.html" title="{$f.post_title}">
				{if $f.post_portada}
					<img src="{$tsConfig.url}/files/portadas/toup{$f.post_portada}P90X70.jpg"/>						
				{else}
					<img src="{$tsConfig.tema.t_url}/i/cat/{$f.c_seo}.jpg"/>
				{/if}
				<h3>{$f.post_title}</h3>
				<p>{$f.post_puntos} puntos | {$f.post_comments} comentarios</p>
			</a>			
		</div>
	{/foreach}
{else}
    <div class="errr">No hay posts en tus favoritos</div>
{/if}