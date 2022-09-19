<div class="boxposts separa">
	<div class="titular">
		<h2>&Uacute;ltimos Miembros</h2>
	</div>
	{if $tsUltimos}
		<div class="alesr">
			{foreach from=$tsUltimos item=a}
				<a href="{$tsConfig.url}/perfil/{$a.user_name}" class="hovercard" uid="{$a.m_user}"><img src="{$tsConfig.url}/files/avatar/{$a.m_user}_50.jpg"/></a>
			{/foreach}
		</div>
	{else}	
		<div class="nada-gris">No hay usuarios aun</div>
	{/if}
</div>