<div class="boxposts separa">
	<div class="titular">
		<h2>Nuevo mensaje</h2>
	</div>
	<div class="fulme">	
		<a class="boto verde" onclick="mensaje.nuevo('','','',''); return false;">Escribir mensaje</a>
	</div>
</div>
<div class="boxposts separa">
	<div class="titular">
		<h2>Carpetas</h2>
	</div>
	<div class="meca">	
		<a {if $tsAction == ''}class="her"{/if} href="{$tsConfig.url}/mensajes/"><span class="i mrec"></span>Recibidos</a>
		<a {if $tsAction == 'enviados'}class="her"{/if} href="{$tsConfig.url}/mensajes/enviados/"><span class="i menv"></span>Enviados</a>
		<a {if $tsAction == 'respondidos'}class="her"{/if} href="{$tsConfig.url}/mensajes/respondidos/"><span class="i mres"></span>Respondidos</a>
		<a {if $tsAction == 'avisos'}class="her"{/if} href="{$tsConfig.url}/mensajes/avisos/"><span class="i mavi"></span>Avisos</a>
		<!--<a {if $tsAction == 'search'}class="her"{/if} href="{$tsConfig.url}/mensajes/search/"><span class="i mrec"></span>Buscador</a>-->
	</div>
</div>
<div class="titular">
	<h2>Buscador</h2>
</div>
<form method="get" action="{$tsConfig.url}/mensajes/search/">
	<input type="text" name="qm" placeholder="Buscar en Mensajes" title="Buscar en Mensajes" value="{$tsMensajes.texto}" class="search_mp onblur_effect"/>
</form>	
