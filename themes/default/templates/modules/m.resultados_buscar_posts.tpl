<div class="tposts">
	<div class="izquierda">
		<div class="dimencion">
			<form name="buscador" action="" method="GET">
				<input class="busk" name="q" type="text" value="{$tsPalabra}"/>
				<input type="submit" title="Buscar" value="Buscar" class="boto verde"/>
			</form>
		</div>
	<!--RESULTADOS ENCONTRADOS EN LOS POST-->
	<div class="sepre">
	<div class="titular">
		<h2>Posts</h2><span class="cuto">({$tsResults.pages.total})</span>
	</div>
	{if $tsResults.data}
		{foreach from=$tsResults.data item=r}
			<div class="reps">
				<div class="posbs">
					<div class="sipov">
					<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$r.c_img}" />
					<a class="titlePost" href="{$tsConfig.url}/posts/{$r.c_seo}/{$r.post_id}/{$r.post_title|seo}.html">{$r.post_title}</a>
					</div>
					<p>
						{$r.post_date|hace:true} - En {$r.c_seo} - Por <a href="/perfil/{$r.user_name}">{$r.user_name}</a> - {$r.post_favoritos} Favoritos - {$r.post_comments} Comentarios
					</p>
				</div>	
				<div class="punbs">
					<span>{$r.post_puntos}</span>
					<p>Puntos</p>
				</div>
			</div>
		{/foreach}
		{if $tsResults.pages.total > 12}
			<div class="pagin">
				{if $tsResults.pages.prev != 0}
					<div class="floatL">
						<a class="boto gris" href="{$tsConfig.url}/buscar/{$tsAction}/?{if $tsPalabra}q={$tsPalabra}{/if}{if $tsCat}&category={$tsCat}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.prev}">Anterior</a>
					</div>	
				{else}
					<div class="floatL nofi">
						<a class="boto gris">Anterior</a>
					</div>				
				{/if}	
				{if $tsResults.pages.next != 0}
					<div class="floatR">
						<a class="boto gris" href="{$tsConfig.url}/buscar/{$tsAction}/?{if $tsPalabra}q={$tsPalabra}{/if}{if $tsCat}&category={$tsCat}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.next}">Siguiente</a>
					</div>
				{else}	
					<div class="floatR nofi">
						<a class="boto gris">Siguiente</a>
					</div>					
				{/if}		
			</div>		
		{/if}
	{else}
		{if $tsPalabra}
			<div class="aviso">
				<span>Oops... Nada por aquí</span>
				<p>No hay resultados para <b>"{$tsPalabra}"</b> intenta usando alguno de los filtros</p>
			</div>
		{/if}
	{/if}
	</div>	
	</div>
	<div class="derecha">
		<!--FILTROS PARA LA BUSQUEDA-->
		<div class="boxposts separa">
			<div class="titular">
				<h2>Filtros</h2>
			</div>	
			<div class="fil">
				<p>Creado</p>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=recent" {if $tsTiempo == 'recent'}class="aqui"{/if}>&Uacute;ltimas 24 horas</a>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-week" {if $tsTiempo == 'last-week'}class="aqui"{/if}>&Uacute;ltima semana</a>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-month" {if $tsTiempo == 'last-month'}class="aqui"{/if}>&Uacute;ltimo mes</a>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-year" {if $tsTiempo == 'last-year'}class="aqui"{/if}>&Uacute;ltimo a&ntilde;o</a>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=all-time" {if $tsTiempo == 'all-time' || $tsTiempo == ''}class="aqui"{/if}>Hist&oacute;rico</a>
			</div>
			<div class="fil">
				<p>Categor&iacute;a</p>
				<div class="floatL filterCat">
				<select onchange="location.href='{$tsConfig.url}/buscar/posts/?q={$tsPalabra}&category='+$(this).val()+'{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}'">
					<option value="0">Todas las categorias</option>
					{foreach from=$tsConfig.categorias item=c}
						<option value="{$c.cid}" {if $tsCat == $c.cid}selected="selected"{/if}>{$c.c_nombre}</option>
					{/foreach}
				</select>				
				</div>				
			</div>			
			<div class="fil">
				<p>Autor</p>
				<div class="autob">				
				<form name="buscador" action="" method="GET">
					<input name="q" type="text" value="{$tsPalabra}" style="display:none;"/>
					<input class="buska" type="text" name="autor" value="{$tsAutor}"/>
					<input type="submit" title="Buscar" value="Ir" class="botos"/>
				</form>	
				</div>
			</div>		
			<div class="fil">
				<p>Como</p>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}&type=titulo{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == 'titulo'}class="aqui"{/if}>T&iacute;tulos</a>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}&type=cuerpo{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == 'cuerpo' || $tsTipo == ''}class="aqui"{/if}>Contenido</a>
				<a href="{$tsConfig.url}/buscar/posts/?q={$tsPalabra}{if $tsCat}&category={$tsCat}{/if}&type=tags{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == 'tags'}class="aqui"{/if}>Tags</a>
			</div>						
		</div>
	</div>
</div>