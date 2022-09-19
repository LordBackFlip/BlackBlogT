{include file='sections/main_header.tpl'}	
<div id="main-wrapper">
	<div class="container">
		<div class="row gtr-200">
				<div class="col-8 col-12-medium">
			<div class="bl">
	{if $tsPost.post_status > 0 || $tsAutor.user_activo != 1}<div style="margin: 10px 0;" class="nada-amarillo">Este post se encuentra {if $tsPost.post_status == 2}eliminado{elseif $tsPost.post_status == 1} inactivo por acomulaci&oacute;n de denuncias{elseif $tsPost.post_status == 3} en revisi&oacute;n{elseif $tsPost.post_status == 3} en revisi&oacute;n{elseif $tsAutor.user_activo != 1} oculto porque pertenece a una cuenta desactivada{/if}, t&uacute; puedes verlo porque {if $tsUser->is_admod == 1}eres Administrador{elseif $tsUser->is_admod == 2}eres Moderador{else}tienes permiso{/if}.</div><br />{/if}
	<div class="mepot">
		<div class="det">
			<div class="fesLti"><span class="toup-clock"></span>{$tsPost.post_date|hace}</div>
			<div class="fesL"><a href="{$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/"><span class="toup-chevron-right2"></span>{$tsPost.categoria.c_nombre}</a></div>
		</div>
		<div class="altere">
			<a class="vctip" title="Post Anterior (m&aacute;s viejo)" href="{$tsConfig.url}/posts/prev?id={$tsPost.post_id}"><span class="toup-caret-left"></span></a>
			<a class="vctip" title="Post Aleatorio" href="{$tsConfig.url}/posts/fortuitae"><span class="toup-random"></span></a>
			<a class="vctip" title="Post Siguiente (m&aacute;s nuevo)" href="{$tsConfig.url}/posts/next?id={$tsPost.post_id}"><span class="toup-caret-right"></span></a>					
		</div>
	</div>
	<div class="ccpot">
		{include file='modules/m.posts_content.tpl'}
		{include file='modules/m.posts_relacionados_tags.tpl'}
		<a name="comentarios"></a>
		{include file='modules/m.posts_comments.tpl'}
		<a name="comentarios-abajo"></a>	
	</div>
			</div>
				</div>
				<div class="col-4 col-12-medium">
			<div class="br">
		{include file='modules/m.posts_autor.tpl'}
		{include file='modules/m.posts_herramientas.tpl'}
		{include file='modules/m.posts_administrar_autor.tpl'}
		{include file='modules/m.posts_visitas.tpl'}
		{include file='modules/m.posts_medallas.tpl'}
		{include file='modules/m.posts_relacionados_contenido.tpl'}
			</div>
				</div>
		</div>
	</div>
</div>
{include file='sections/main_footer_v6.tpl'}