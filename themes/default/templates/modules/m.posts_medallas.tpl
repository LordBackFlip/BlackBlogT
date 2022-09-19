{if $tsPost.medallas}
<div class="boxposts separa">
	<div class="titular"><h2>Medallas</h2></div>
	<div>
		<ul style="margin-left:11px;">
		{foreach from=$tsPost.medallas item=m}
			<img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_16.png" style="margin-left:1px;margin-bottom:2px;" class="qtip" title="{$m.m_title} - {$m.m_description}"/>
		{/foreach}
		</ul>
	</div>					
</div>
{/if}	