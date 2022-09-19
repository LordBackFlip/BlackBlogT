<!--Tipo: {$tsFiltro} - Acciones: {$tsAcciones} - Tiempo: {$tsTiempos}-->
{if $tsType == 'populares'}
	<div id="selec" style="margin: 0 18px 18px 0;">		
		<div class="boline {if $tsAcciones == 1}activo{/if}"><a onclick="shout_populares('{$tsFiltro}','populares','populares','1','{$tsTiempos}');">Comentarios</a></div>
		<div class="boline {if $tsAcciones == 0}activo{/if}"><a onclick="shout_populares('{$tsFiltro}','populares','populares','0','{$tsTiempos}');">Me gusta</a></div>
		<div class="boline {if $tsAcciones == 2}activo{/if}"><a onclick="shout_populares('{$tsFiltro}','populares','populares','2','{$tsTiempos}');">Compartido</a></div>
		<div class="boline {if $tsAcciones == 3}activo{/if}"><a onclick="shout_populares('{$tsFiltro}','populares','populares','3','{$tsTiempos}');">Favoritos</a></div>
		<div id="tamaTipo" class="boline">
			<a id="filTipo" >
				{if $tsFiltro == 0}Todo{elseif $tsFiltro == 1}Texto{elseif $tsFiltro == 2}Imagen{elseif $tsFiltro == 3}Video{elseif $tsFiltro == 4}Link{/if}<span class="puti"></span>
			</a>
			<div id="tmenu">
				<span class="tiup"></span>
				<div class="todmi">
					<a {if $tsFiltro == 0}class="acti"{/if} onclick="shout_populares('0','populares','populares','{$tsAcciones}','{$tsTiempos}');">Todo</a>
					<a {if $tsFiltro == 1}class="acti"{/if} onclick="shout_populares('1','populares','populares','{$tsAcciones}','{$tsTiempos}');">Texto</a>
					<a {if $tsFiltro == 2}class="acti"{/if} onclick="shout_populares('2','populares','populares','{$tsAcciones}','{$tsTiempos}');">Imagen</a>
					<a {if $tsFiltro == 3}class="acti"{/if} onclick="shout_populares('3','populares','populares','{$tsAcciones}','{$tsTiempos}');">Video</a>
					<a {if $tsFiltro == 4}class="acti"{/if} onclick="shout_populares('4','populares','populares','{$tsAcciones}','{$tsTiempos}');">Link</a>								
				</div>
			</div>
		</div>

		<div id="tamaFecha" class="boline">
			<a id="filTipo" >
				{if $tsTiempos == 6}Hist&oacute;rico{elseif $tsTiempos == 0}Hoy{elseif $tsTiempos == 1}Ayer{elseif $tsTiempos == 2}&Uacute;ltimos 7 d&iacute;as{elseif $tsTiempos == 3}Del mes{elseif $tsTiempos == 4}Mes anterior{elseif $tsTiempos == 5}Del a&ntilde;o{/if}<span class="puti"></span>
			</a>
			<div id="tmenu">
				<span class="tiup"></span>
				<div class="todmi">
					<a {if $tsTiempos == 6}class="acti"{/if} onclick="shout_populares('{$tsFiltro}','populares','populares','{$tsAcciones}','6');">Hist&oacute;rico</a>
					<a {if $tsTiempos == 0}class="acti"{/if} onclick="shout_populares('{$tsFiltro}','populares','populares','{$tsAcciones}','0');">Hoy</a>
					<a {if $tsTiempos == 1}class="acti"{/if} onclick="shout_populares('{$tsFiltro}','populares','populares','{$tsAcciones}','1');">Ayer</a>
					<a {if $tsTiempos == 2}class="acti"{/if} onclick="shout_populares('{$tsFiltro}','populares','populares','{$tsAcciones}','2');">&Uacute;ltimos 7 d&iacute;as</a>
					<a {if $tsTiempos == 3}class="acti"{/if} onclick="shout_populares('{$tsFiltro}','populares','populares','{$tsAcciones}','3');">Del mes</a>
					<a {if $tsTiempos == 4}class="acti"{/if} onclick="shout_populares('{$tsFiltro}','populares','populares','{$tsAcciones}','4');">Mes anterior</a>
					<a {if $tsTiempos == 5}class="acti"{/if} onclick="shout_populares('{$tsFiltro}','populares','populares','{$tsAcciones}','5');">Del a&ntilde;o</a>					
				</div>
			</div>
		</div>		
		
	</div>
{/if}