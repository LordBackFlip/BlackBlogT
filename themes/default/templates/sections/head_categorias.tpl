<div class="menuca">
	<div id="selcat">{if $tsCatData.c_nombre}{$tsCatData.c_nombre}{else}Todas las categor&iacute;as{/if}<span class="toup-chevron-down"></span></div>
	<div class="catlis">
		{if $tsCatData.c_nombre}
			<a href="{$tsConfig.url}">Todas las categor&iacute;as</a>
		{else}
			<a href="{$tsConfig.url}" class="listo">Todas las categor&iacute;as</a>
		{/if}
		{foreach from=$tsConfig.categorias item=c}
			<a href="{$tsConfig.url}/posts/{$c.c_seo}/" {if $tsCat == $c.c_seo}class="listo"{/if}>{$c.c_nombre}</a>
		{/foreach}
	</div>
</div>