{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/borradores.js"></script>
<script type="text/javascript">
	var borradores_data = [{$tsDrafts}];
</script>
<div class="tposts">
	<div id="borradores">
		<div class="derecha">				
			<div class="boxposts separa">
				<div class="boxy">
					<div class="titular">
						<h2>Filtrar</h2>
					</div>                                
					<h4>Mostrar</h4>
					<ul class="cat-list" id="borradores-filtros">
						<li id="todos" class="active"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'todos'; borradores.query(); return false;">Todos</a></span> <span class="count"></span></li>
						<li id="borradores"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'borradores'; borradores.query(); return false;">Borradores</a></span> <span class="count"></span></li>
						<li id="eliminados"><span class="cat-title"><a href="" onclick="borradores.active(this); borradores.filtro = 'eliminados'; borradores.query(); return false;">Eliminados</a></span> <span class="count"></span></li>
					</ul>
					<h4>Ordenar por</h4>
					<ul id="borradores-orden" class="cat-list">
						<li class="active"><span><a href="" onclick="borradores.active(this); borradores.orden = 'fecha_guardado'; borradores.query(); return false;">Fecha guardado</a></span></li>
						<li><span><a href="" onclick="borradores.active(this); borradores.orden = 'titulo'; borradores.query(); return false;">T&iacute;tulo</a></span></li>
						<li><span><a href="" onclick="borradores.active(this); borradores.orden = 'categoria'; borradores.query(); return false;">Categor&iacute;a</a></span></li>
					</ul>
					<h4>Categorias</h4>
					<ul class="cat-list" id="borradores-categorias">
						<li id="todas" class="active"><span class="cat-title active"><a href="" onclick="borradores.active(this); borradores.categoria = 'todas'; borradores.query(); return false;">Ver todas</a></span> <span class="count"></span></li>
					</ul>
				</div>
			</div>
		</div>	
		<div class="izquierda">
			<div style="margin: 10px;">
				<div class="titular">
					<h2>Posts</h2>
					<input type="text" id="borradores-search" value="" onKeyUp="borradores.search(this.value, event)" onFocus="borradores.search_focus()" onBlur="borradores.search_blur()" autocomplete="off" />
				</div>                               			
				<div class="boxy">
					<div id="res" class="boxy-content">
						{if $tsDrafts}
							<ul id="resultados-borradores"></ul>
						{else}
						<div class="nada-gris">No tienes ning&uacute;n borrador ni post eliminado.</div>{/if}
					</div>
				</div>
				<div id="template-result-borrador" style="display:none">
					<li id="borrador_id___id__">
						<a title="__categoria_name__" class="categoriaPost __categoria__ __tipo__" href="__url__" onclick="__onclick__" style="background-image:url({$tsConfig.tema.t_url}/images/icons/cat/__imagen__)">__titulo__</a>
						<span class="causa">Causa: __causa__</span>
						<span class="gray">&Uacute;ltima vez guardado el __fecha_guardado__</span> 
						<a style="float:right" href="" onclick="borradores.eliminar(__borrador_id__, true); return false;">
							<img src="{$tsConfig.tema.t_url}/images/borrar.png" alt="eliminar" title="Eliminar Borrador" />
						</a>
					</li>
				</div>
			</div>				
		</div>				
	</div>   
</div>   				
{include file='sections/main_footer.tpl'}