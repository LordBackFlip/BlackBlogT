{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/fotos.js"></script>
<script type="text/javascript" src="{$tsConfig.js}/admin.js"></script>
{if $tsAction == ''}
	<div class="tposts">
		<div class="izquierda">
			{include file='modules/m.fotos_home_content.tpl'}
		</div>
		<div class="derecha">
			{include file='modules/m.fotos_home_stats.tpl'}
			{include file='modules/m.fotos_home_comentarios.tpl'}
		</div>
	</div>
{elseif $tsAction == 'agregar' || $tsAction == 'editar'}
	<div class="tposts">
		<div class="izquierda">
			{include file='modules/m.fotos_add_form.tpl'}
		</div>
		<div class="derecha">	
			{include file='modules/m.fotos_add_sidebar.tpl'}
		</div>
	</div>	
{elseif $tsAction == 'ver'}
	<div class="tposts">
		<div class="izquierda">	
			{include file='modules/m.fotos_ver_content.tpl'}
			{include file='modules/m.fotos_ver_comentarios.tpl'}
		</div>
		<div class="derecha">	
			{include file='modules/m.fotos_ver_autor.tpl'}
			{include file='modules/m.fotos_ver_right.tpl'}
		</div>
	</div>	
{elseif $tsAction == 'album'}
	<div class="tposts">
		<div class="izquierda">
			{include file='modules/m.fotos_album.tpl'}
		</div>
		<div class="derecha">	
		</div>
	</div>		
{elseif $tsAction == 'favoritas'}
	<div class="nada-gris">En construcci&oacute;n</div>
{/if}
{include file='sections/main_footer.tpl'}