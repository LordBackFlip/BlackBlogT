{if ($tsUser->is_admod || $tsUser->permisos.godp) && $tsUser->is_member == 1 && $tsPost.post_user != $tsUser->uid && $tsUser->info.user_puntosxdar >= 1}
	{if $tsPunteador.rango >= 50}
		<div align="center">
			<input type="number" id="points" style="width:50px;height:15px;" value="{$tsPunteador.rango}" min="1" max="{$tsPunteador.rango}"/> 	
			<input type="submit" onclick="votar_post(document.getElementById('points').value); return false;" value="Votar" class="btn_g" style="width: 55px;">  
		</div>
	{else}
		<div class="barpuntos">
			{section name=puntos start=1 loop=$tsUser->info.user_puntosxdar+1 max=9}
				<a href="#" onclick="votar_post({$smarty.section.puntos.index}); return false;">{$smarty.section.puntos.index}</a>
			{/section}		
		</div>
		{if  $tsUser->info.user_puntosxdar > $tsPunteador.rango}	
			<div class="topdar"><a onclick="votar_post({$tsPunteador.rango}); return false;">+{$tsPunteador.rango}</a></div>
		{/if}	
	{/if}
{/if}