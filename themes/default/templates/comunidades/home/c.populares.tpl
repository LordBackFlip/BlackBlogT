<div class="boxposts separa" id="poput">
	<div class="titular">
		<h2>Populares</h2>
		<div class="mentop">
			<div class="actualtop" id="popucambi">Todos</div>
			<div class="listop"  id="popu">
				<a onclick="pestana('popu','payer','popuayer','popucambi','poput'), filtrar_top_populares('2');" class="popuayer">Ayer</a>
				<a onclick="pestana('popu','phoy','popuhoy','popucambi','poput'), filtrar_top_populares('1');" class="popuhoy">Hoy</a>				
				<a onclick="pestana('popu','psemana','popusemana','popucambi','poput'), filtrar_top_populares('3');" class="popusemana">Semana</a>
				<a onclick="pestana('popu','pmes','popumes','popucambi','poput'), filtrar_top_populares('4');" class="popumes">Mes</a>
				<a onclick="pestana('popu','ptodos','poputodos','popucambi','poput'), filtrar_top_populares('5');" class="poputodos listo">Todos</a>
			</div>	
		</div>		
	</div>
	<section class="tops" id="poputops">
	{if $tsPopulares}
		{foreach from=$tsPopulares key=i item=c}
			<article>
				<b>{$i+1}</b>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|limit:30}</a>
				<span>{$c.c_miembros}</span>
			</article>
		{/foreach}
	{else}
		<div class="nada-gris" style="margin-bottom: 10px;">Sin populares en este periodo</div>
	{/if}			
	</section>
</div>