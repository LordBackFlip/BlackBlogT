<div class="boxposts separa">
	<div class="titular">
		<h2>Comunidades</h2>
		<a class="botob" href="#comunidades" onclick="perfil.load_tab('comunidades', $('#comunidades'));">{$tsGeneral.comus_total|number_format:0:",":"."}</a>
	</div>
	{if $tsGeneral.comus}
		<div id="fullcu">
		{foreach from=$tsGeneral.comus item=c}
			<div class="nuel">
				<a class="avur" href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/"><img src="{$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg"/></a>
				<div class="nombes">	
					<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre}</a>
					<span>{$c.c_miembros} Miembros</span> 	
				</div>				
			</div>						
		{/foreach}		
		</div>	
		<!--		
		{if $tsGeneral.comus_total >= 1}
			<div class="titular">
				<h2 id="vermasp">
					<a href="#comunidades" onclick="perfil.load_tab('comunidades', $('#comunidades'));">Ver más</a>
				</h2>
			</div>
		{/if}
		-->
	{else}	
		<div class="nada-gris">No participa en ninguna comunidad</div>
	{/if}
</div>