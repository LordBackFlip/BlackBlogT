<div class="boxposts separa" id="visitop">
	<div class="titular">
		<h2>Temas m&aacute;s visitados</h2>
		<div class="mentop">
			<div class="actualtop" id="visicambi">Todos</div>
			<div class="listop"  id="visipopu">
				<a onclick="pestana('visipopu','payer','visiayer','visicambi','visitop'), filtrar_temas_vistos('2');" class="visiayer">Ayer</a>
				<a onclick="pestana('visipopu','phoy','visihoy','visicambi','visitop'), filtrar_temas_vistos('1');" class="visihoy">Hoy</a>				
				<a onclick="pestana('visipopu','psemana','visisemana','visicambi','visitop'), filtrar_temas_vistos('3');" class="visisemana">Semana</a>
				<a onclick="pestana('visipopu','pmes','visimes','visicambi','visitop'), filtrar_temas_vistos('4');" class="visimes">Mes</a>
				<a onclick="pestana('visipopu','ptodos','visitodos','visicambi','visitop'), filtrar_temas_vistos('5');" class="visitodos listo">Todos</a>
			</div>	
		</div>		
	</div>
	<section class="tops" id="vistotops">
	{if $tsVisitados}
		{foreach from=$tsVisitados key=i item=c}
			<article>
				<b>{$i+1}</b>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/{$c.t_id}/{$c.t_titulo|seo}.html#coment_id_{$c.r_id}">{$c.t_titulo|limit:30}</a>				
				<span>{$c.t_visitas}</span>
			</article>
		{/foreach}
	{else}
		<div class="nada-gris" style="margin-bottom: 10px;">Sin temas visitados en este periodo</div>
	{/if}			
	</section>
</div>