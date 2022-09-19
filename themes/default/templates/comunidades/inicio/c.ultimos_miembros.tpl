<div class="boxposts separa">
	<div class="titular" style="margin-bottom: 2px;">
		<h2>&Uacute;ltimos Miembros</h2>
	</div>
	{if $tsMiembros}
		<div class="alesr">
			{foreach from=$tsMiembros item=a}
				<a href="{$tsConfig.url}/perfil/{$a.user_name}" class="hovercard" uid="{$a.m_user}"><img src="{$tsConfig.url}/files/avatar/{$a.m_user}_50.jpg"/></a>
			{/foreach}
		</div>
		{*<div class="titular"><h2 id="vermasp"><a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/miembros/">Ver más</a></h2></div>*}
	{else}	
		<div class="nada-gris">No hay usuarios aun</div>
	{/if}
</div>