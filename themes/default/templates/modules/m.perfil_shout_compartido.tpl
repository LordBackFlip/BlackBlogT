<div class="boxposts separa">
	<div class="titular">
		<h2>Compartido por</h2>
	</div>
	{if $tsMuroCompartir.compartir}
	<div class="compuser">	
	{foreach from=$tsMuroCompartir.compartir item=c}
		<a href="{$tsConfig.url}/perfil/{$c.user_name}" class="qtip" title="{$c.user_name}">
			<img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.cuser_id}_50.jpg"/>
		</a>		
	{/foreach}
	</div>		
	{else}
		<div class="nada-gris" style="margin: 5px 0 0 0;">Nadie a compartido este shout</div>
	{/if}	
</div>
	
