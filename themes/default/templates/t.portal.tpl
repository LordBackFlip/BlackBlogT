{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/perfil.js"></script>
<script type="text/javascript" src="{$tsConfig.js}/portal.js"></script>
<link href="{$tsConfig.tema.t_url}/css/perfil.css" rel="stylesheet" type="text/css" />
<div id="mi" class="tposts">
	<div class="izquierda">
		{include file='modules/m.portal_noticias.tpl'}
	</div>
	<div class="derecha">
		{if $tsUser->is_member}
			{include file='modules/m.portal_cumpleanos.tpl'}
			{include file='modules/m.portal_pins.tpl'}
		{/if}
		{include file='modules/m.portal_hashtags.tpl'}
		{include file='modules/m.portal_buscador.tpl'}
		{include file='modules/m.portal_usuarios_recomendados.tpl'}
		{if $tsUser->is_member}
			{include file='modules/m.portal_seguidos_online.tpl'}
			{include file='modules/m.portal_estadisticas.tpl'}
		{/if}
	</div>
</div>
{include file='sections/main_footer.tpl'}