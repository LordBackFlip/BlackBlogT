<div class="boxposts separa">
	<div class="titular">
		<h2>Afiliados</h2>
	</div>
	{if $tsAfiliados}
	<div id="afileado">
		{foreach from=$tsAfiliados item=af}
			<a href="#" onclick="afiliado.detalles({$af.aid}); return false;" title="{$af.a_titulo}">
				<img src="{$af.a_banner}"/>
			</a>
		{/foreach}
	</div>
	{else}
		<div class="nada-gris" style="margin-bottom: 10px;">No hay sitios afiliados</div>
	{/if}
	{if $tsUser->is_member}	
		<a class="boto verde" onclick="afiliado.nuevo(); return false" style="display: block;text-align: center;">Afiliate a {$tsConfig.titulo}!</a>	
	{/if}	
</div>