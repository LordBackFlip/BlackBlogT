{if $tsPage != 'buscar'}
<div class="subali">
	<div class="tiposub">
	{if $tsPage == 'tops'}
		<ul>
			<li><a {if $tsAction == 'posts'}class="viendo"{/if}href="{$tsConfig.url}/top/posts/">Posts</a></li>
			<li><a {if $tsAction == 'usuarios'}class="viendo"{/if} href="{$tsConfig.url}/top/usuarios/">Usuarios</a></li>
			<li><a {if $tsAction == 'comunidades'}class="viendo"{/if}href="{$tsConfig.url}/top/comunidades/">Comunidades</a></li>
			<li><a {if $tsAction == 'temas'}class="viendo"{/if} href="{$tsConfig.url}/top/temas/">Temas</a></li>			
		</ul>
	{elseif $tsPage == 'php_files/p.favoritos.home' || $tsAction == 'favoritos'}	
		<ul>
			<li><a {if $tsPage == 'php_files/p.favoritos.home'}class="viendo"{/if}href="{$tsConfig.url}/favoritos.php">Posts</a></li>
			<li><a {if $tsAction == 'favoritos'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/favoritos/">Temas</a></li>
		</ul>
	{elseif $tsPage == 'php_files/p.borradores.home' || $tsAction == 'borradores'}	
		<ul>
			<li><a {if $tsPage == 'php_files/p.borradores.home'}class="viendo"{/if}href="{$tsConfig.url}/borradores.php">Posts</a></li>
			<li><a {if $tsAction == 'borradores'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/borradores/">Temas</a></li>
		</ul>		
	{elseif $tsPage == 'perfil'}
		{if $tsType != 'story'}
		<ul id="tabs_menu_new" class="floatL">
			<li><a href="#Actividad" onclick="perfil.load_tab('actividad', this); return false" id="actividad"><span class="i actividad"></span>Actividad</a></li>			
			<li id="toupnet"><a href="#Iformacion" onclick="perfil.load_tab('info', this); return false"><span class="i info-p"></span>Informaci&oacute;n</a></li>			
			<li {if $tsType == 'wall'}class="viendo"{/if}><a href="#Mi" onclick="perfil.load_tab('wall', this); return false"><span class="i mi"></span>Mi</a></li>
			<li><a id="posts" href="#Posts" onclick="perfil.load_tab('posts', this); return false"><span class="i temas"></span>Posts</a></li>
			<li><a id="temas" href="#Temas" onclick="perfil.load_tab('temas', this); return false"><span class="i temascom"></span>Temas</a></li>
			<li><a id="seguidores" href="#Seguidores" onclick="perfil.load_tab('seguidores', this); return false"><span class="i mise"></span>Seguidores</a></li>
			<li><a id="medallas" href="#Medallas" onclick="perfil.load_tab('medallas', this); return false"><span class="i mm"></span>Medallas</a></li>
		</ul>	
		{if $tsUser->uid != $tsInfo.uid && $tsUser->is_member}		
			<ul class="floatR">
				<li><a href="javascript:bloquear({$tsInfo.uid}, {if $tsInfo.block.bid}false{else}true{/if}, 'perfil')" id="bloquear_cambiar">{if $tsInfo.block.bid}Desbloquear{else}Bloquear{/if}</a></li>
			</ul>
		{/if}
		{else}
		<ul>
			{if $tsUser->is_member}
				<li><a {if $tsAction == ''}class="viendo"{/if} href="{$tsConfig.url}/mi/">Mi {$tsConfig.titulo}!</a></li>
			{else}
				<li><a {if $tsAction == ''}class="viendo"{/if} href="{$tsConfig.url}/mi/populares">Mi {$tsConfig.titulo}!</a></li>
			{/if}		
			<li><a {if $tsAction == 'destacados'}class="viendo"{/if} href="{$tsConfig.url}/mi/destacados">Destacados</a></li>
			<li><a {if $tsAction == 'populares'}class="viendo"{/if} href="{$tsConfig.url}/mi/populares">Populares</a></li>
			<li><a {if $tsAction == 'publico'}class="viendo"{/if} href="{$tsConfig.url}/mi/publico">Publico</a></li>
		</ul>		
		{/if}
	{elseif $tsPage == 'portal'}
		<ul>
			{if $tsUser->is_member}
				<li><a {if $tsAction == '' || $tsAction == 'pin'}class="viendo"{/if} href="{$tsConfig.url}/mi/">Mi {$tsConfig.titulo}!</a></li>
			{else}
				<li><a {if $tsAction == '' || $tsAction == 'pin'}class="viendo"{/if} href="{$tsConfig.url}/mi/populares">Mi {$tsConfig.titulo}!</a></li>
			{/if}
			<li><a {if $tsAction == 'destacados'}class="viendo"{/if} href="{$tsConfig.url}/mi/destacados">Destacados</a></li>
			<li><a {if $tsAction == 'populares'}class="viendo"{/if} href="{$tsConfig.url}/mi/populares">Populares</a></li>
			<li><a {if $tsAction == 'publico'}class="viendo"{/if} href="{$tsConfig.url}/mi/publico">Publico</a></li>
		</ul>
	{elseif $tsPage == 'mod-history'}
		<ul>
			<li><a href="{$tsConfig.url}">Inicio</a></li>
			<li><a {if !$tsAction == 'fotos'}class="viendo"{/if} href="{$tsConfig.url}/mod-history/">Posts</a></li>
			<li><a {if $tsAction == 'fotos'}class="viendo"{/if} href="{$tsConfig.url}/mod-history/fotos/">Im&aacute;genes</a></li>
		</ul>	
	{elseif $tsPage == 'fotos'}	
		<ul>
			<li><a {if $tsAction == '' && $tsAction != 'agregar' && $tsAction != 'album' && $tsAction != 'favoritas' || $tsAction == 'ver'}class="viendo"{/if} href="{$tsConfig.url}/fotos/">Inicio</a></li>
			{if $tsAction == 'album' && $tsFUser.0 != $tsUser->uid}<li><a class="viendo" href="{$tsConfig.url}/fotos/{$tsFUser.1}">&Aacute;lbum de {$tsFUser.1}</a></li>{/if}
			{if $tsUser->is_admod || $tsUser->permisos.gopf}<li><a {if $tsAction == 'agregar'}class="viendo"{/if} href="{$tsConfig.url}/fotos/agregar.php"><img src="{$tsConfig.tema.t_url}/i/add.png"/>Publicar</a></li>{/if}
			{if $tsUser->is_member}<li><a {if $tsAction == 'album' && $tsFUser.0 == $tsUser->uid}class="viendo"{/if} href="{$tsConfig.url}/fotos/{$tsUser->nick}">Mis im&aacute;genes</a></li>{/if}
		</ul>	
	{elseif $tsPage == 'comunidades'}
		<ul class="floatL tabsMenu">
			{*<li><a {if $tsAction == '' || $tsAction == 'home' && $tsAction != 'mis-comunidades' && $tsAction != 'dir' && $tsAction != 'mod-history' && $tsAction != 'buscar' && $tsAction != 'favoritos' && $tsAction != 'borradores'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/">Inicio</a></li>*}
			<li><a {if $tsAction == '' || $tsAction == 'home'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/">Inicio</a></li>
			{if $tsUser->is_member}
				<li><a {if $tsAction == 'mis-comunidades'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/mis-comunidades/">Mis Comunidades</a></li>
			{/if}
			<li><a {if $tsAction == 'dir'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/dir/">Directorio</a></li>
			<li><a {if $tsAction == 'mod-history'} class="viendo"{/if} href="{$tsConfig.url}/comunidades/mod-history/">Historial</a></li>
				{*
			<li><a {if $tsAction == 'buscar'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/buscar/">Buscar</a></li>
			{if $tsUser->is_member}
				<li><a {if $tsAction == 'favoritos'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/favoritos/">Favoritos</a></li>
				<li><a {if $tsAction == 'borradores'}class="viendo"{/if} href="{$tsConfig.url}/comunidades/borradores/">Borradores</a></li>
			{/if}	
				*}			
		</ul>
	{else}
		<ul>
			<li><a href="{$tsConfig.url}" {if $tsAction == ''}class="viendo"{/if}><i class="fad fa-fire-alt"></i><span class="socult">Destacados</span></a></li>
			<li><a href="{$tsConfig.url}/posts/ascenso/" {if $tsAction == 'ascenso'}class="viendo"{/if}><i class="fad fa-arrow-alt-circle-up"></i><span class="socult">En ascenso</span></a></li>
			<li><a href="{$tsConfig.url}/posts/recientes/" {if $tsAction == 'recientes'}class="viendo"{/if}><i class="fad fa-clock"></i><span class="socult">M&aacute;s recientes</span></a></li>			
			{if $tsUser->is_member}<li><a href="{$tsConfig.url}/mod-history/"><i class="fad fa-history"></i><span class="socult">Historial</span></a></li>{/if}
			{if $tsUser->is_admod || $tsUser->permisos.moacp}<li><a {if $tsPage == 'moderacion'}class="viendo"{/if} href="{$tsConfig.url}/moderacion/"><i class="fad fa-shield-alt"></i><span class="socult">Moderaci&oacute;n</span> {if $tsConfig.c_see_mod && $tsConfig.novemods.total}<span class="cadGe cadGe_{if $tsConfig.novemods.total < 10}green{elseif $tsConfig.novemods.total < 30}purple{else}red{/if}" style="position:relative;top: -1px;left: 1px;">{$tsConfig.novemods.total}</span>{/if}</a></li>{/if}			
		</ul>
	{/if}
{if $tsUser->is_member}
<div class="dropdown">	
	<ul>		
		{if $tsAvisos}
		<li>
			<a title="Avisos" href="{$tsConfig.url}/mensajes/avisos/"><span class="ice toup-warning3"></span></a>
			<div id="alerta_avs" class="alertas"><a title="{$tsAvisos} aviso{if $tsAvisos != 1}s{/if}"><span>{$tsAvisos}</span></a></div>
		</li>
		{/if}
		<li>
			<a class="imhes" onclick="mostrarbb()">
				<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg?{$smarty.now}"/>
			</a>
	
			<ul id="myDropdown" class="dropdown-content">
			    <li><a href="{$tsConfig.url}/monitor/"></i><i class="fal fa-bell"></i>  Monitor</a></li>
			    <li><a href="{$tsConfig.url}/favoritos.php"><i class="fal fa-star"></i>  Favoritos</a></li>
			    <li><a href="{$tsConfig.url}/mensajes/"><i class="fal fa-envelope"></i>  Mensajes</a></li>
				<li><a href="{$tsConfig.url}/perfil/{$tsUser->nick}"><i class="fal fa-user"></i>  Perfil</a></li>
				<li><a href="{$tsConfig.url}/cuenta/"><i class="fal fa-cog"></i>  Cuenta</a></li>
				<li><a href="{$tsConfig.url}/borradores.php"><i class="fal fa-eraser"></i>  Borradores</a></li>
				<li><a href="{$tsConfig.url}/login-salir.php"><i class="fal fa-power-off"></i>  Salir</a></li>
			</ul>					
		</li>					
	</ul>
</div>
{else}
{/if}
	</div>
</div>
{else}
<div class="subali">
	<div class="tiposub">
		<ul>
			<li><a {if $tsAction == ''}class="viendo"{/if} href="{$tsConfig.url}/buscar/">Inicio</a></li>
			<li><a {if $tsAction == 'posts'}class="viendo"{/if} href="{$tsConfig.url}/buscar/posts/{if $tsPalabra}?q={$tsLimpia}{/if}">Posts</a></li>
			<li><a {if $tsAction == 'mi'}class="viendo"{/if} href="{$tsConfig.url}/buscar/mi/{if $tsPalabra}?q={$tsLimpia}{/if}">Shouts</a></li>
			<li><a {if $tsAction == 'imagenes'}class="viendo"{/if} href="{$tsConfig.url}/buscar/imagenes/{if $tsPalabra}?q={$tsLimpia}{/if}">Im&aacute;genes</a></li>
		</ul>	
{if $tsUser->is_member}
<div class="dropdown">	
	<ul>		
		{if $tsAvisos}
		<li>
			<a title="Avisos" href="{$tsConfig.url}/mensajes/avisos/"><span class="ice toup-warning3"></span></a>
			<div id="alerta_avs" class="alertas"><a title="{$tsAvisos} aviso{if $tsAvisos != 1}s{/if}"><span>{$tsAvisos}</span></a></div>
		</li>
		{/if}
		<li>
			<a class="imhes" onclick="mostrarbb()">
				<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg?{$smarty.now}"/>
			</a>
	
			<ul id="myDropdown" class="dropdown-content">
			    <li><a href="{$tsConfig.url}/monitor/"></i><i class="fal fa-bell"></i>  Monitor</a></li>
			    <li><a href="{$tsConfig.url}/favoritos.php"><i class="fal fa-star"></i>  Favoritos</a></li>
			    <li><a href="{$tsConfig.url}/mensajes/"><i class="fal fa-envelope"></i>  Mensajes</a></li>
				<li><a href="{$tsConfig.url}/perfil/{$tsUser->nick}"><i class="fal fa-user"></i>  Perfil</a></li>
				<li><a href="{$tsConfig.url}/cuenta/"><i class="fal fa-cog"></i>  Cuenta</a></li>
				<li><a href="{$tsConfig.url}/borradores.php"><i class="fal fa-eraser"></i>  Borradores</a></li>
				<li><a href="{$tsConfig.url}/login-salir.php"><i class="fal fa-power-off"></i>  Salir</a></li>
			</ul>			
		</li>					
	</ul>
</div>
{else}
{/if}	
	</div>
</div>						
{/if}
