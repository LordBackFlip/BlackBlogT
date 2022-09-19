1:
<div id="perfil_medallas" class="widget" status="activo">
	<div class="titular">
		<h2>Medallas de {$tsUsername}</h2>
	</div>
	{if $tsMedallas.medallas}
	{foreach from=$tsMedallas.medallas item=m}
		<div class="divo">
			<img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_32.png" class="qtip floatL" title="{$m.medal_date|hace:true}" width="32" height="32"/>
			<div class="otrop">
				<span><b>{$m.m_title}</b><span>
				<p>{$m.m_description|limit:100}</p>			
			</div>
		</div>		
	{/foreach}
	{else}
        <div class="nada-gris" style="margin:5px 0 0 0;">No tiene medallas</div>
	{/if}
</div>