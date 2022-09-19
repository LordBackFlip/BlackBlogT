<div class="iebox">
	<div class="boxtes">
		<h2>Los m&aacute;s buscados</h2>
	</div>
	<div class="secomo" id="lisco">	
		{if $tsMasBuscado}	
			{foreach from=$tsMasBuscado item=p key=i}
				<div class="ccom" {if $i+1 == 1}style="border-top: 0;"{/if}>			
					<a class="hulk" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
					{if $p.post_portada}
						<img title="{$p.post_title|limit:20}" src="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P90X70.jpg"/>						
					{else}
						<img title="{$p.post_title|limit:20}" src="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
					{/if}												
					<h3>{$p.post_title}</h3>
				</a>
				</div>
			{/foreach}
		{else}
			<div class="nada-blanco">No hay nada por aqui</div>
		{/if}
	</div>	
</div>