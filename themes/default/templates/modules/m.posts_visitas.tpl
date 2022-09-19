{if $tsPost.visitas}
<div class="boxposts separa">
	<div class="titular"><h2>Visitas</h2></div>	
	<div class="categoriaList estadisticasList">
		<ul>
			{foreach from=$tsPost.visitas item=v}
				<a href="{$tsConfig.url}/perfil/{$v.user_name}" class="hovercard" uid="{$v.user_id}" style="display:inline-block;"><img src="{$tsConfig.url}/files/avatar/{$v.user_id}_50.jpg" class="vctip" title="{$v.date|hace:true}" width="32" height="32"/></a> 
			{/foreach}
		</ul>
	</div>
</div>	
{/if}