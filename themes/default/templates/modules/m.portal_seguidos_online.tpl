<div class="boxposts separa">
	<div class="titular">
		<h2>Seguidos online</h2>
		{if $tsSeguidos.data}<a class="botob" style="padding: 2px 0 0 10px;color: #21900F;">{$tsSeguidos.numero}</a>{/if}
	</div>
	<div class="boxreco">		
	{if $tsSeguidos.data}
		<div class="onlsu">
		{foreach from=$tsSeguidos.data item=u}
			<a class="hovercard" uid="{$u.user_id}" href="{$tsConfig.url}/perfil/{$u.user_name}"><img alt="{$u.user_name}" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/></a>
		{/foreach}
		</div>			
	{else}
		<div class="nada-gris">No hay seguidos online</div>
	{/if}
	</div>	
</div>
