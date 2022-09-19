<nav id="nav">	
    <ul>
	<li><a {if $tsPage == 'posts' || $tsPage == 'home'}class="active"{/if} href="{$tsConfig.url}"><i class="far fa-home-alt"></i></i>Inicio</a>
	</li>
	{if $tsUser->is_member}
		<li><a {if $tsPage == 'portal'}class="active"{/if} href="{$tsConfig.url}/mi/"><i class="far fa-globe-americas"></i></i>Global {if $Shouts || $Posts}<span class="globe">{if $Shouts+$Posts >99}+{/if}{$Shouts+$Posts}</span>{/if}</a></li>
	{else}
		<li><a {if $tsPage == 'portal'}class="active"{/if} href="{$tsConfig.url}/mi/populares"><i class="far fa-globe-americas"></i>Global</a></li>
	{/if}
	<li><a {if $tsPage == 'comunidades'}class="active"{/if} href="{$tsConfig.url}/comunidades/"><i class="far fa-building"></i>Comunidades</a></li>
	{if $tsUser->is_admod == 1}
		<li><a {if $tsPage == 'admin'}class="active"{/if} href="{$tsConfig.url}/admin/"><i class="far fa-cog"></i>    Administrac&iacute;on</a></li>
	{/if}
    </ul>	
</nav>