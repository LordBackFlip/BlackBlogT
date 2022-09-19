{include file='sections/main_header.tpl'}
<div class="aquino">
	<h3>{$tsAviso.titulo}</h3>
	<span>{$tsAviso.mensaje}</span>
	{if $tsAviso.but}
		<input type="button" onclick="location.href='{if $tsAviso.link}{$tsAviso.link}{else}{$tsConfig.url}{/if}'" value="{$tsAviso.but}" class="boto gris">
	{/if}
	{if $tsAviso.return}
		<input type="button" onclick="history.go(-{$tsAviso.return})" title="Volver" value="Volver" class="boto gris">
	{/if}
</div>
{include file='sections/main_footer.tpl'}