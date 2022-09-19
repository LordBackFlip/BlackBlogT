{include file='sections/main_header.tpl'}
<script type="text/javascript">
// {literal}
var global_com = {
	// {/literal}
	comid:'{$tsCom.c_id}',
	temaid:'{$tsTema.t_id}',
	// {literal}
};
// {/literal}
</script>	
<script type="text/javascript" src="{$tsConfig.js}/comunidades.js"></script>  
{if $tsCom.c_id}
	<body style="background-color: #{$tsCom.c_back_color};background-repeat: {if $tsCom.c_back_repeat}repeat{else}no-repeat{/if};">
{/if}
{if $tsTema.t_estado == 1}
	<div class="nada-gris">Este tema est&aacute; eliminado</div>
{/if}
{if $tsAction == '' || $tsAction == 'home'}
	{include file='comunidades/home/c.pagina_home.tpl'}
{elseif $tsAction == 'crear' || $tsAction == 'editar'}    
	{include file='comunidades/crear/c.crear_comunidad.tpl'}
{elseif $tsAction == 'agregar' || $tsAction == 'editar-tema'}
		{include file='comunidades/c.agregar_tema.tpl'}
{elseif $tsAction == 'tema'}
	{include file='comunidades/tema/c.pagina_tema.tpl'}
{elseif $tsAction == 'mis-comunidades'}
	{include file='comunidades/mis-comunidades/c.mis_comunidades.tpl'}
{elseif $tsAction == 'miembros'}
    {include file='comunidades/miembros/c.miembros.tpl'}	
{elseif $tsAction == 'dir'}
	{include file='comunidades/directorio/c.directorio.tpl'}	
{elseif $tsAction == 'mod-history'}
	{include file='comunidades/c.historial.tpl'}
{elseif $tsAction == 'com-mod-history'}
	{include file='comunidades/c.com_historial.tpl'}		
{elseif $tsAction == 'buscar'}
	{include file='comunidades/buscar/c.buscar.tpl'}
{elseif $tsAction == 'favoritos'}
	{include file='comunidades/favoritos/c.favoritos.tpl'}
{elseif $tsAction == 'borradores'}
    {include file='comunidades/borradores/c.borradores.tpl'}
{else}
	{include file='comunidades/inicio/c.comunidad.tpl'}
{/if}
{include file='sections/main_footer.tpl'}