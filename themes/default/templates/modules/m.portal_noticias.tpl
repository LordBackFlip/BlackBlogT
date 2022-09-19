<div id="portal_{$tsType}" class="showHide" status="activo">
	<script type="text/javascript">
		muro.maxWidth = 400;
		muro.stream.total = {$tsMuro.total};
		muro.stream.tipo = {$tsFiltro};
		muro.stream.acciones = {if $tsAcciones}{$tsAcciones}{else}0{/if};
		muro.stream.tiempos = {if $tsTiempos}{$tsTiempos}{else}0{/if};
	</script>	
	{if $tsUser->is_member}
	<div id="info" pid="{$tsInfo.uid}"></div>	
	<div id="perfil-form" class="widget">
		{include file='modules/m.perfil_muro_form.tpl'}
	</div>
	{else}
		{include file='modules/m.portal_aviso_visitante.tpl'}
	{/if}
	{if $tsAction == 'pin'}	
		{include file='modules/m.portal_buscar_pin.tpl'}
	{else}
	{include file='modules/m.portal_noticias_menu.tpl'}
	<div class="widget clearfix" id="perfil-{$tsType}">
		<div id="{$tsType}-content">
			{include file='modules/m.perfil_muro_story.tpl'}                         
		</div>
		{if $tsMuro.total >= 10}
			<div class="more-pubs">
				<div class="content">
					<a href="#" onclick="muro.stream.loadMore('{$tsType}'); return false;" class="a_blue">Publicaciones m&aacute;s antiguas</a>
					<span><img alt="Cargando..." src="{$tsConfig.tema.t_url}/i/min-carga.gif"/></span>
				</div>
			</div>
		{elseif $tsMuro.total == 0}
			{if $tsAction == 'destacados' || $tsAction == 'populares' || $tsAction == 'publico'}
				<div class="nada-gris" id="solouno" style="margin: 0 18px 0 96px;clear: both;">No hay nada por aqui</div>
			{else}
				<div class="nada-gris" id="solouno" style="margin: 0 18px 0 96px;clear: both;">Hola {$tsUser->nick}!, &iquest;Por qu&eacute; no empiezas a seguir usuarios?</div>
			{/if}
		{/if}		
	</div>
	{/if}	
</div>