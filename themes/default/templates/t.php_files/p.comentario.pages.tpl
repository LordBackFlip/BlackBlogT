<div class="before floatL">
	<a href="#ver-comentarios" {if $tsPages.prev > 0}onclick="comentario.cargar({$tsPages.post_id}, {$tsPages.prev}, {$tsPages.autor});"{else}class="desactivado"{/if}></a>
</div>
{if $tsPages.section-1 < 14}
<div class="touppages">
	<ul>
		{section name=page start=1 loop=$tsPages.section}
			<li class="numbers">
				<a href="#ver-comentarios" {if $tsPages.current == $smarty.section.page.index}class="here"{else}onclick="comentario.cargar({$tsPages.post_id}, {$smarty.section.page.index}, {$tsPages.autor});"{/if}>{$smarty.section.page.index}</a>
			</li>
		{/section}
	</ul>
</div>
{else}
	<div class="paginon">Pagina {$tsPages.current} de {$tsPages.section-1 > 13}</div>
{/if}
<div class="floatR next">
	<a href="#ver-comentarios" {if $tsPages.next <= $tsPages.pages}onclick="comentario.cargar({$tsPages.post_id}, {$tsPages.next}, {$tsPages.autor});"{else}class="desactivado"{/if}></a>
</div>
