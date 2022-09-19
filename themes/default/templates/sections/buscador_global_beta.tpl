<div id="bushome">
	<img src="{$tsConfig.tema.t_url}/i/buscador.png"/>
	<form action="" method="GET" name="buscar">
		<input type="text" value="{$tsQuery}" class="busk" name="q"/>
		<!--<input type="submit" title="Buscar" value="Buscar" class="boto verde"/>-->
		<!--<input type="hidden" name="e" value="{$tsEngine}" />-->
	</form>
</div>
{if $tsQuery}
	<div>Mostrando <strong>{$tsResults.total}</strong> de <strong>{$tsResults.pages.total}</strong> resultados totales</div>
{foreach from=$tsResults.data item=r}
	<div><a class="titlePost" href="{$tsConfig.url}/posts/{$r.c_seo}/{$r.post_id}/{$r.post_title|seo}.html">{$r.post_title}</a></div>
{/foreach}
<div class="paginadorCom">
	{if $tsResults.pages.prev != 0}<div style="display: block; margin: 5px 0pt; width: 110px;text-align:left" class="floatL before"><a href="{$tsConfig.url}/buscar/?page={$tsResults.pages.prev}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">&laquo; Anterior</a></div>{/if}
	{if $tsResults.pages.next != 0}<div style="display: block; margin: 5px 0pt; width: 110px;text-align:right" class="floatR next"><a href="{$tsConfig.url}/buscar/?page={$tsResults.pages.next}{if $tsQuery}&q={$tsQuery}{/if}{if $tsEngine}&e={$tsEngine}{/if}{if $tsCategory}&cat={$tsCategory}{/if}{if $tsAutor}&autor={$tsAutor}{/if}">Siguiente &raquo;</a></div>{/if}
</div>			
{/if}			