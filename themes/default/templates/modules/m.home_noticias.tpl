{if $tsConfig.news}
<div class="iebox">
	<div class="boxtes">
		<h2><i class="fas fa-info-circle"></i>  Noticias y avisos</h2>
	</div>
	<div id="noticias">
		{foreach from=$tsConfig.news key=i item=n}
			<div id="newtexto">{$n.not_body}</div>
		{/foreach}
	</div>	
</div>
{/if}