<div class="boxposts separa" id="poput">
	<div class="titular">
		<h2>Top Temas</h2>
		<div class="mentop">
			<div class="actualtop" id="popucambi">Semana</div>
			<div class="listop"  id="popu">
				<a onclick="pestana('popu','psemana','popusemana','popucambi','poput'), com.pop_list_change('Semana')" class="popusemana listo">Semana</a>
				<a onclick="pestana('popu','pmes','popumes','popucambi','poput'), com.pop_list_change('Mes');" class="popumes">Mes</a>
				<a onclick="pestana('popu','ptodos','poputodos','popucambi','poput'), com.pop_list_change('Historico');" class="poputodos">Hist&oacute;rico</a>
			</div>	
		</div>		
	</div>
	<section class="tops">
		<div id="ccp_semana" style="display:block;">
			{if $tsTop.semana}
                {foreach from=$tsTop.semana item=t key=i}
					<article>
						<b>{$i+1}</b>
						<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|limit:30}</a>
						<span>{$t.t_votos_pos}</span>
					</article>
                {/foreach}
			{else}
                <div class="nada-gris">Sin tops en este periodo</div>
			{/if}
		</div>
		<div id="ccp_mes" style="display:none;">
			{if $tsTop.mes}
                {foreach from=$tsTop.mes item=t key=i}
					<article>
						<b>{$i+1}</b>
						<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|limit:30}</a>
						<span>{$t.t_votos_pos}</span>
					</article>
                {/foreach}
			{else}
                <div class="nada-gris">Sin tops en este periodo</div>
			{/if}
		</div>
		<div id="ccp_historico" style="display:none;">
			{if $tsTop.historico}
                {foreach from=$tsTop.historico item=t key=i}
					<article>
						<b>{$i+1}</b>
						<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|limit:30}</a>
						<span>{$t.t_votos_pos}</span>
					</article>
                {/foreach}
			{else}
                <div class="nada-gris">Sin tops en este periodo</div>
			{/if}
		</div>		
	</section>
</div>