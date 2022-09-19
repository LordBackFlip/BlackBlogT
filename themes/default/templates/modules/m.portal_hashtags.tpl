<div class="boxposts separa">
	<div class="titular">
		<h2>#Hashtags del momento</h2>
	</div>	
	{if $tsHashtags}
	<div class="boxreco">	
		{foreach from=$tsHashtags item=h}
		<div class="htags">
			<a href="/mi/pin?q=%23{$h.p_tags}">#{$h.p_tags}</a>
			{if $tsUser->is_member}
			<div class="floatR opctag">
				<span class="i pin" onclick="pin.convertir('{$h.id}'),eli();"></span>
				<span class="mas" onclick="$('#wall').val('#{$h.p_tags} ').focus()"></span>
			</div>	
			{/if}
		</div>
		{/foreach}		
	</div>	
	{else}
		<div class="nada-gris">No hay hashtags</div>
	{/if}
</div>