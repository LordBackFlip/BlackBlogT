<div class="subali">
	<div class="tiposub">				
		<div class="floatL">
			<div class="isume">
				<a href="{$tsConfig.url}" {if $tsAction == ''}class="her"{/if}>Destacados</a>
				<a href="{$tsConfig.url}/posts/ascenso/" {if $tsAction == 'ascenso'}class="her"{/if}>En ascenso</a>
				<a href="{$tsConfig.url}/posts/recientes/" {if $tsAction == 'recientes'}class="her"{/if}>M&aacute;s recientes</a>
			</div>		
		</div>		
		{include file='sections/head_filtro_pais.tpl'}
		{include file='sections/head_categorias.tpl'}
	</div>	
</div>
