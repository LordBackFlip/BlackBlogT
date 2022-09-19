<div class="boxposts separa">
	<div class="titular">
		<h2>Filtrar</h2>
	</div>
	<div class="fil">
		<p>Categor&iacute;a</p>
		<div class="filterCat">
			<select onchange="location.href='{$tsConfig.url}/top/{$tsAction}/?fecha={$tsFecha}&cat='+$(this).val()">
			<option value="0">Todas las Categor&iacute;a</option>
				{foreach from=$tsConfig.categorias item=c}
					<option value="&cat={$c.cid}" {if $tsCat == $c.cid}selected="selected"{/if}>{$c.c_nombre}</option>
				{/foreach}
			</select>
		</div>					
	</div>
	<div class="fil">
		<p>Per&iacute;odo</p>
		<a href="{$tsConfig.url}/top/{$tsAction}/?fecha=2&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 2}class="aqui"{/if}>Ayer</a>
        <a href="{$tsConfig.url}/top/{$tsAction}/?fecha=1&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 1}class="aqui"{/if}>Hoy</a>
        <a href="{$tsConfig.url}/top/{$tsAction}/?fecha=3&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 3}class="aqui"{/if}>&Uacute;ltimos 7 d&iacute;as</a>
        <a href="{$tsConfig.url}/top/{$tsAction}/?fecha=4&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 4}class="aqui"{/if}>Del mes</a>
        <a href="{$tsConfig.url}/top/{$tsAction}/?fecha=5&cat={$tsCat}&sub={$tsSub}" {if $tsFecha == 5}class="aqui"{/if}>Todos los tiempos</a>
	</div>	
</div>				
