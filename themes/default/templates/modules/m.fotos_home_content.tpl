<div class="boxposts separa" style="margin: 10px 10px 0 10px;">
	<div class="titular">
		<h2>Im&aacute;genes</h2>
		<a class="botob">{$tsStats.stats_fotos}</a>
	</div>	
	<div class="nofio">
	{if $tsLastFotos.data}
		{foreach from=$tsLastFotos.data item=f}
			<div class="imgfo" id="foto_{$f.foto_id}">				
				<a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">
					<img class="loadimg" data-original="{$f.f_url}"/>
				</a>
				{if $tsUser->is_member && $tsUser->is_admod}<a id="elimfo" class="boto gris" onclick="admin.fotos.borrar({$f.foto_id}); return false;">Eliminar</a>{/if}
			</div>			
		{/foreach}		
		{if $tsPages.pages > 1}
			<div class="pagin">
				{if $tsPages.prev > 0 && $tsPages.max == false}
					<a href="#" onclick="last_files('{$tsPages.prev}'); return false" class="floatL boto gris">Anterior</a>
				{else}	
					<a class="poff floatL boto gris">Anterior</a>
				{/if}
				<span class="contador" style="display:none;">
					<b id="c_soporte">Pagina {$tsPages.prev+1} de {$tsPages.pages}</b>
					<img src="{$tsConfig.tema.t_url}/i/min-carga.gif" id="com_gif"/>
				</span>
				{if $tsPages.next <= $tsPages.pages}
					<a href="#" onclick="last_files('{$tsPages.next}'); return false" class="floatR boto gris">Siguiente</a>
				{else}
					<a class="poff floatR  boto gris">Siguiente</a>		
				{/if}
			</div>
		{/if}		
	{else}
		<div class="nada-gris"  style="margin-bottom: 10px;">No hay im&aacute;genes</div>
	{/if}
	</div>	
</div>