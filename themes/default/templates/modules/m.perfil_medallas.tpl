<div class="boxposts separa">
	<div class="titular">
		<h2>Medallas</h2>
		<a class="botob" href="#medallas" onclick="perfil.load_tab('medallas', $('#medallas'));">{$tsGeneral.m_total|number_format:0:",":"."}</a>
	</div>	
	{if $tsGeneral.medallas}
	<div class="medallap">
		{foreach from=$tsGeneral.medallas item=m}
			<img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_32.png" class="qtip" title="{$m.m_title}"/>
		{/foreach}
	</div>
	{if $tsGeneral.m_total >= 21}
		<div class="titular"><h2 id="vermasp" onclick="perfil.load_tab('medallas', $('#medallas'));">Ver más</h2></div>
	{/if}			
	{else}	
		<div class="nada-gris">No tiene medallas</div>
	{/if}
</div>