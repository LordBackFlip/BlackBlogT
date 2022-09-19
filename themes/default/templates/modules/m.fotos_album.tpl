<div class="boxposts separa" style="margin: 10px 10px 0 10px;">
	<div class="titular">
		<h2>{if $tsFUser.0 == $tsUser->uid}Mis fotos{else}Fotos de {$tsFUser.1}{/if}</h2>
	</div>	
	<div class="nofio">
	{if $tsFotos.data}
		{foreach from=$tsFotos.data item=f}
			<div class="imgfo">
				<a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">
					<img class="loadimg" data-original="{$f.f_url}"/>
				</a>
			</div>			
		{/foreach}
		
		
		{if $tsFotos.pages.prev || $tsFotos.pages.next}
		<div class="paginadorCom" style="margin-bottom: 10px;">
			{if $tsFotos.pages.prev}<div style="display:block;margin: 5px 0; width: 110px;text-align:left" class="floatL before"><a href="{$tsConfig.url}/fotos/{$tsFUser.1}/{$tsFotos.pages.prev}">&laquo; Anterior</a></div>{/if}
			{if $tsFotos.pages.next}<div style="display:block;margin: 5px 0; width: 110px;text-align:right" class="floatR next"><a href="{$tsConfig.url}/fotos/{$tsFUser.1}/{$tsFotos.pages.next}">Siguiente &raquo;</a></div>{/if}
		</div>
		{/if}		
	{else}
		<div class="nada-gris" style="margin-bottom: 10px;">No hay im&aacute;genes</div>
	{/if}
	</div>
</div>