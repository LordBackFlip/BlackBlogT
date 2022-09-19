<div id="bgcom">
	<main id="comi">
		{include file='comunidades/inicio/c.com_info.tpl'}
		{include file='comunidades/inicio/c.com_temas.tpl'}
	</main>
	<aside id="comd">
		{include file='comunidades/inicio/c.buscador_global.tpl'}
		{include file='comunidades/inicio/c.staff_comunidad.tpl'}
		{include file='comunidades/inicio/c.estadisticas_comunidad.tpl'}		
		{include file='comunidades/inicio/c.comentarios_recientes.tpl'}
		{include file='comunidades/inicio/c.ultimos_miembros.tpl'}
		{include file='comunidades/inicio/c.top_temas.tpl'}		
		<small>
			<span class="bade"></span>
			<a href="#" onclick="denuncia.nueva('comunidad',{$tsCom.c_id}, '{$tsCom.c_nombre}', ''); return false;">Denunciar</a> - <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/mod-history/">Historial</a></small>		
	</aside>
</div>