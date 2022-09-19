<div class="boxposts ipu">
	<div id="mensajes">	
		{if $tsAction == '' || $tsAction == 'enviados' || $tsAction == 'respondidos' || $tsAction == 'search'}		
			{include file='modules/m.mensajes_list.tpl'}
		{elseif $tsAction == 'leer'}
			{include file='modules/m.mensajes_leer.tpl'}
		{elseif $tsAction == 'avisos'}
			{include file='modules/m.mensajes_avisos.tpl'}
		{/if}
	</div>
</div>