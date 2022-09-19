{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/favoritos.js"></script>
<script type="text/javascript">
	var favoritos_data = [{$tsFavoritos}];
</script>
<div class="tposts">
	<div class="izquierda">
		<div style="margin: 10px;">
			<div class="titular">
				<h2>Mis posts favoritos</h2>
			</div>	
			{if $tsFavoritos}
			<div id="resultados">
				<div class="mefavs">
					<a class="tidd" href="" onclick="favoritos.active2(this); favoritos.orden = 'titulo'; favoritos.query(); return false;">T&iacute;tulo</a>
					<a href="" onclick="favoritos.active2(this); favoritos.orden = 'fecha_creado'; favoritos.query(); return false;">Creado</a>
					<a href="" onclick="favoritos.active2(this); favoritos.orden = 'fecha_guardado'; favoritos.query(); return false;" class="here">Guardado</a>
					<a style="width: 50px;" href="" onclick="favoritos.active2(this); favoritos.orden = 'puntos'; favoritos.query(); return false;">Puntos</a>
					<a style="width: 75px;" href="" onclick="favoritos.active2(this); favoritos.orden = 'comentarios'; favoritos.query(); return false;">Comentarios</a>
				</div>
				<div id="favbox"></div>
			</div>
			{else}	
				<div class="nada-gris">No agregaste ning&uacute;n post a favoritos todav&iacute;a</div>
			{/if}
		</div>
	</div>
	<div class="derecha">
		<div class="boxposts separa">
			<div class="titular">
				<h2>Buscador</h2>
			</div>
			<input type="text" autocomplete="off" onblur="favoritos.search_blur()" onfocus="favoritos.search_focus()" onkeyup="favoritos.search(this.value, event)" value="" id="favoritos-search">
		</div>
		<div class="boxposts separa">
			<div class="titular">
				<h2>Categor&iacute;as</h2>
			</div>
			<div class="categoriaList">
				<ul>
					<li id="cat_-1">
						<a href="" onclick="favoritos.active(this); favoritos.categoria = 'todas'; favoritos.query(); return false;">
							<strong>Todas las Categor&iacute;as</strong>
						</a>
					</li>
				</ul>
			</div>
		</div>		
	</div>
</div>		
{include file='sections/main_footer.tpl'}