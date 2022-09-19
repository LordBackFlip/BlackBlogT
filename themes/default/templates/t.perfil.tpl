{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/perfil.js"></script>
{if $tsType == 'story'}
<div class="tposts">
	<div class="izquierda"  id="diferir">
	{include file='modules/m.perfil_contenedor.tpl'}
	{include file='modules/m.perfil_shout_comentarios.tpl'}
	</div>
	<aside class="derecha">	
		{include file='modules/m.perfil_shout_autor.tpl'}
		{include file='modules/m.perfil_shout_opciones.tpl'}
		{include file='modules/m.perfil_shout_compartido.tpl'}		
	</aside>
</div>	
{else}
<div class="tposts">
	<div class="izquierda">
		{include file='modules/m.perfil_headinfo.tpl'}
		{include file='modules/m.perfil_contenedor.tpl'}	
	</div>
	<aside class="derecha">
		{include file='modules/m.perfil_herramientas.tpl'}
		{include file='modules/m.perfil_resdes_sociales.tpl'}		
		{include file='modules/m.perfil_karma.tpl'}
		{include file='modules/m.perfil_medallas.tpl'}
		{include file='modules/m.perfil_seguidores.tpl'}
		{include file='modules/m.perfil_siguiendo.tpl'}
		{include file='modules/m.perfil_comunidades.tpl'}
		{include file='modules/m.perfil_fotos.tpl'}		
		{include file='modules/m.perfil_visitas.tpl'}		
	</aside>
</div>
{/if}
{include file='sections/main_footer.tpl'}