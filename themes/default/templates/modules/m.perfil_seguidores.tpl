<div class="boxposts separa">
	<div class="titular">
		<h2>Seguidores</h2>
		<a class="botob" href="#seguidores" onclick="perfil.load_tab('seguidores', $('#seguidores'));">{$tsInfo.stats.user_seguidores|number_format:0:",":"."}</a>
	</div>	
	{if $tsGeneral.segs.data}
	<div class="seguidoresp">
		{foreach from=$tsGeneral.segs.data item=s}
			<a href="{$tsConfig.url}/perfil/{$s.user_name}" class="hovercard" uid="{$s.user_id}">
				{*
				<img class="loadimg" data-original="{$tsConfig.url}/files/avatar/{$s.user_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" width="33" height="33"/> 
				*}
				
				<img src="{$tsConfig.url}/files/avatar/{$s.user_id}_50.jpg"/>
				
					{*
			<img src="{$tsConfig.url}/files/avatar/{$s.user_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
			*}
			</a>			
		{/foreach}
	</div>	
	<!--
	{if $tsGeneral.segs.total >= 21}
		<div class="titular"><h2 id="vermasp" onclick="perfil.load_tab('seguidores', $('#seguidores'));">Ver más</h2></div>
	{/if}
	-->
	{else}	
		<div class="nada-gris">No tiene seguidores</div>
	{/if}
</div>