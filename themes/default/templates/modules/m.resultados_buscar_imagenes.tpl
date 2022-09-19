<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/perfil.js"></script>
<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/portal.js"></script>
<link href="{$tsConfig.tema.t_url}/css/perfil.css" rel="stylesheet" type="text/css"/>
<div class="tposts">
	<div class="izquierda">
		<div class="dimencion">
			<form name="buscador" action="" method="GET">
				<input class="busk" name="q" type="text" value="{$tsPalabra}"/>
				<input type="submit" title="Buscar" value="Buscar" class="boto verde"/>
			</form>
		</div>
	<!--RESULTADOS ENCONTRADOS EN LOS SHOUTS-->
	<div class="sepre">
	<div class="titular" style="margin-bottom: 10px;">
		<h2>Shouts</h2><span class="cuto">({$tsResults.pages.total})</span>
	</div>
	{if $tsResults.data}
		{foreach from=$tsResults.data item=p}
		<div class="boximg">
			<a href="{$tsConfig.url}/perfil/{if $p.p_user == $p.p_user_pub}{$p.user_name}{else}{$tsUser->getUserName($p.p_user)}{/if}/{$p.pub_id}">
				<img class="loadimg" data-original="{$p.a_img}"/> 
			</a>			
		</div>
		{/foreach}
		
		{if $tsResults.pages.total > 12}
			<div class="pagin">
				{if $tsResults.pages.prev != 0}
					<div class="floatL">
						<a class="boto gris" href="{$tsConfig.url}/buscar/{$tsAction}/{if $tsPalabra}?q={$tsPalabra}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.prev}">Anterior</a>
					</div>	
				{else}
					<div class="floatL nofi">
						<a class="boto gris">Anterior</a>
					</div>				
				{/if}	
				{if $tsResults.pages.next != 0}
					<div class="floatR">
						<a class="boto gris" href="{$tsConfig.url}/buscar/{$tsAction}/{if $tsPalabra}?q={$tsPalabra}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.next}">Siguiente</a>
					</div>
				{else}	
					<div class="floatR nofi">
						<a class="boto gris">Siguiente</a>
					</div>					
				{/if}		
			</div>		
		{/if}		

			{*		
		{if $tsResults.pages.total > 12}
		<div class="paginadorCom">
			{if $tsResults.pages.prev != 0}
				<div class="floatL before">
					<a href="{$tsConfig.url}/buscar/{$tsAction}/{if $tsPalabra}?q={$tsPalabra}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.prev}">&laquo; Anterior</a>
				</div>
			{/if}
			{if $tsResults.pages.next != 0}
				<div class="floatR next">
					<a href="{$tsConfig.url}/buscar/{$tsAction}/{if $tsPalabra}?q={$tsPalabra}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.next}">Siguiente &raquo;</a>
				</div>
			{/if}
		</div>	
		{/if}
*}		
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
				<a href="{$tsConfig.url}/buscar/imagenes/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=recent" {if $tsTiempo == 'recent'}class="aqui"{/if}>&Uacute;ltimas 24 horas</a>
				<a href="{$tsConfig.url}/buscar/imagenes/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-week" {if $tsTiempo == 'last-week'}class="aqui"{/if}>&Uacute;ltima semana</a>
				<a href="{$tsConfig.url}/buscar/imagenes/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-month" {if $tsTiempo == 'last-month'}class="aqui"{/if}>&Uacute;ltimo mes</a>
				<a href="{$tsConfig.url}/buscar/imagenes/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-year" {if $tsTiempo == 'last-year'}class="aqui"{/if}>&Uacute;ltimo a&ntilde;o</a>
				<a href="{$tsConfig.url}/buscar/imagenes/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=all-time" {if $tsTiempo == 'all-time' || $tsTiempo == ''}class="aqui"{/if}>Hist&oacute;rico</a>
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
		</div>	
	</div>
</div>