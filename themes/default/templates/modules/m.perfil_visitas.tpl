{if $tsInfo.can_hits}
<div class="boxposts separa">
	<div class="titular">
		<h2>Visitas</h2>
		<a class="botob">{$tsInfo.visitas_total|number_format:0:",":"."}</a>
	</div>	
	{if $tsInfo.visitas}
	<div class="seguidoresp">
		{foreach from=$tsInfo.visitas item=v}
			<a href="{$tsConfig.url}/perfil/{$v.user_name}" class="hovercard" uid="{$v.user_id}" style="display:inline-block;">
				<img src="{$tsConfig.url}/files/avatar/{$v.user_id}_50.jpg" class="vctip" title="{$v.date|hace:true}"/>
			</a>
		{/foreach}	
	</div>	
	{else}	
		<div class="nada-gris" style="margin: 5px 0 0 0;">No tienes visitas</div>
	{/if}
</div>
{/if}