<script type="text/javascript">
	muro.maxWidth = 400;
	muro.stream.total = {$tsMuro.total};
	muro.stream.tipo = {$tsFiltro};
	muro.stream.acciones = {if $tsAcciones}{$tsAcciones}{else}0{/if};
	muro.stream.tiempos = {if $tsTiempos}{$tsTiempos}{else}0{/if};		
</script>	
{include file='modules/m.portal_noticias_menu_ajax.tpl'}
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
	<div class="nada-gris" id="solouno" style="margin: 0 18px 0 96px;clear: both;">No hay nada por aqui</div>
{/if}		


