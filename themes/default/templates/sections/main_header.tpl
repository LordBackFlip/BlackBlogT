<html xmlns="http://www.w3.org/1999/xhtml" lang="es" xml:lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	{if $tsPage == 'posts'}
	<!--METAS PARA CADA POST-->
	<meta name="description" content="{$tsPost.descriptcion}"/>
	<meta name="keywords" content="{$tsPost.tags}">
	<meta name="google" content="nositelinkssearchbox"/>
	<!--METAS PARA FACEBOOK-->
	<meta property="og:image" content="{$tsConfig.url}/files/portadas/toup{$tsPost.portada}P240X180.jpg"/>
	<meta property="og:title" content="{$tsPost.post_title}"/>
	<meta property="og:description" content="{$tsPost.descriptcion}"/>
	<meta property="og:locale" content="es_ES"/>		
	{/if}
	<title>{$tsTitle}</title>
	<link href="{$tsConfig.tema.t_url}/taringa.css" rel="stylesheet" type="text/css" />
	<link href="{$tsConfig.tema.t_url}/estilo.css" rel="stylesheet" type="text/css" />
	<link href="{$tsConfig.tema.t_url}/phpost.css" rel="stylesheet" type="text/css" />
	<link href="{$tsConfig.tema.t_url}/extras.css" rel="stylesheet" type="text/css" />
	<!--ICONOS FUENTE BY TO-UP-->
	<script src="{$tsConfig.js}/fonta.js"></script>
	<link href="{$tsConfig.tema.t_url}/css/fonts/style.css" rel="stylesheet" type="text/css" />	
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,300,400italic" rel="stylesheet" type="text/css">
	{if $tsUser->is_admod && $tsConfig.c_see_mod && $tsConfig.novemods.total}
		<link href="{$tsConfig.tema.t_url}/css/moderacion.css" rel="stylesheet" type="text/css" />
		<div id="stickymsg" onmouseover="$('#brandday').css('opacity',0.5);" onmouseout="$('#brandday').css('opacity',1);" onclick="location.href = '{$tsConfig.url}/moderacion/'" style="cursor:pointer;">Hay {$tsConfig.novemods.total} contenido{if $tsConfig.novemods.total != 1}s{/if} esperando revisi&oacute;n</div>
	{/if}
	<!-- AGREGAMOS UN ESTILO EXTRA SI EXISTE -->
	<link href="{$tsConfig.css}/{$tsPage}.css" rel="stylesheet" type="text/css" />		
	<link rel="shortcut icon" href="{$tsConfig.tema.t_url}/i/favicon.ico" type="image/x-icon" />	
	<script src="{$tsConfig.js}/jquery.min.js" type="text/javascript"></script>
	<script src="{$tsConfig.js}/jquery.plugins.js" type="text/javascript"></script>
	<script src="{$tsConfig.js}/acciones.js" type="text/javascript"></script>
	<script src="{$tsConfig.js}/funciones.js" type="text/javascript"></script>
	<script src="{$tsConfig.js}/rapidez.js"></script>
	{if $tsUser->is_admod || $tsUser->permisos.moacp || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.mosu || $tsUser->permisos.modu || $tsUser->permisos.moep || $tsUser->permisos.moop || $tsUser->permisos.moedcopo || $tsUser->permisos.moaydcp || $tsUser->permisos.moecp}
		<script src="{$tsConfig.js}/moderacion.js" type="text/javascript"></script>
	{/if}
	{if $tsConfig.c_allow_live}
		<link href="{$tsConfig.css}/live.css" rel="stylesheet" type="text/css" />
		<script src="{$tsConfig.js}/live.js" type="text/javascript"></script>
	{/if}
	<script type="text/javascript">
	// {literal}
	var global_data={
	// {/literal}
		user_key:'{$tsUser->uid}',
		postid:'{$tsPost.post_id}',
		fotoid:'{$tsFoto.foto_id}',
		img:'{$tsConfig.tema.t_url}/',
		url:'{$tsConfig.url}',
		domain:'{$tsConfig.domain}',
		s_title: '{$tsConfig.titulo}',
		s_slogan: '{$tsConfig.slogan}'
	// {literal}
	};
	// {/literal} {literal}
	$(document).ready(function(){
	// {/literal}
		{if $tsNots > 0} 
		notifica.popup({$tsNots});
		{/if}
		{if $tsMPs > 0 &&  $tsAction != 'leer'}
		mensaje.popup({$tsMPs});
		{/if}
	// {literal}
	});
	//	{/literal}
	</script>
</head>
<body class="is-preload right-sidebar">
	<span id="scroll-up" onclick="$('body').scrollTo(0);"></span>
	{if $tsUser->is_admod == 1}{$tsConfig.install}{/if}
	<div id="loading" style="display:none"><img src="{$tsConfig.tema.t_url}/images/ajax-loader.gif" alt="Cargando"> Cargando...</div>
	<div id="swf"></div>
	<div id="js" style="display:none"></div>
	<div id="mask"></div>
	<div id="mydialog"></div>
	<div class="UIBeeper" id="BeeperBox"></div>
	<div id="brandday">
			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<a id="logoi" title="{$tsConfig.titulo}" href="{$tsConfig.url}"></a>
							</div>

						<!-- Nav -->
							{include file='sections/head_menu.tpl'}
							{include file='sections/menu_usuario.tpl'}
					</header>
				</div>
				<div id="page-wrapper">
	{if $tsPage != 'login' && $tsPage != 'registro' && $tsPage != 'pages'}
			    <div id="submenu-wrapper">
			{include file='sections/head_submenu.tpl'}
			    </div>
	{/if}
	{if $tsPage == 'home' || $tsPage == 'posts'}
	{else}
		<section id="maincontainer">
	{/if}