{include file='sections/main_header.tpl'}
<div id="bgaviso">
	<div class="ladoi">
		<div class="avitoup">
			<p>{$tsAviso.1}</p>
			<span>Pero no pierdas las esperanzas, no todo est&aacute; perdido!</span>
		</div>
		<div class="boxposts">
			<div class="titular">
				<h2>Post relacionados</h2>
			</div>
			<section class="listados">
				{if $tsRelated}
					{foreach from=$tsRelated item=p}
						<article id="post_{$p.post_id}">
							<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}" />
							<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:40}</a>
						</article>
					{/foreach}
				{else}
					<div class="nada-gris">No se encontraron posts relacionados</div>
				{/if}
			</section>
			{if $tsPages.pages > 1}
				<div class="paginar">
					{if $tsPages.prev > 0 && $tsPages.max == false}<a href="pagina{$tsPages.prev}">Anterior</a>{/if}
					{if $tsPages.next <= $tsPages.pages}<a href="pagina{$tsPages.next}">Siguiente</a>{/if}
				</div>
			{/if}	
		</div>
	</div>
	<div class="ladod">
		<img class="noim" src="{$tsConfig.tema.t_url}/i/404graph.png">
	</div>
</div>    


{*
				<div class="post-{$tsAviso.0}">
                    <h3>+{$tsAviso.1}</h3>
                    Pero no pierdas las esperanzas, no todo est&aacute; perdido, la soluci&oacute;n est&aacute; en:
                    <h4>Post Relacionados</h4>
                    <ul>
                        {if $tsRelated}
                        {foreach from=$tsRelated item=p}
                        <li class="categoriaPost {$p.c_seo}">
                            <a class="{if $p.post_private}categoria privado{/if}"title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" rel="dc:relation">{$p.post_title}</a>
                        </li>
                        {/foreach}
                        {else}
                        <li>No se encontraron posts relacionados.</li>
                        {/if}
                    </ul>
                </div>
*}				
{include file='sections/main_footer.tpl'}