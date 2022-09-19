{if $tsInfo.p_socials.f || $tsInfo.p_socials.t}
<div class="boxposts separa">
	<div class="titular">
		<h2>Redes Sociales</h2>
	</div>	
	<div class="socift">
	{if $tsInfo.p_socials.f}
		<a class="s-face" target="_blank" href="http://www.facebook.com/{$tsInfo.p_socials.f}" title="Facebook"></a>
	{/if}
	{if $tsInfo.p_socials.t}
		<a class="s-twi" target="_blank" href="http://www.twitter.com/{$tsInfo.p_socials.t}" title="Twitter"></a>
	{/if}  	
	</div>
</div>
{/if}