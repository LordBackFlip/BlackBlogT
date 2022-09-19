<div id="bgcom">
	<main id="comi">
            {include file='comunidades/inicio/c.com_info.tpl'}
            {include file='comunidades/tema/c.tema_cuerpo.tpl'}
            {include file='comunidades/tema/c.tema_comentarios.tpl'}
	</main>
	<aside id="comd">
		{include file='comunidades/tema/c.tema_autor.tpl'}
		{include file='comunidades/tema/c.tema_herramientas.tpl'}
		{include file='comunidades/tema/c.tema_ultimos_comentarios.tpl'}
		<small><span class="bade"></span><a href="#" onclick="denuncia.nueva('tema',{$tsTema.t_id}, '{$tsTema.t_titulo}', '{$tsAutor.user_name}'); return false;">Denunciar Tema</a> - <a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/mod-history/">Historial</a></small>
	</aside>
</div>