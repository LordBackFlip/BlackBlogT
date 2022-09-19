<div class="boxposts separa">
	<div class="titular">
		<h2>Comentarios</h2>
		{*<a class="botob" onclick="actualizar_comentarios('-1','0'); return false;"><span class="i flecha"></span></a>*}
	</div>
	<section class="secomo" id="lisco">
	{if $tsLastComments}
		{foreach from=$tsLastComments item=c}
			<article>
				<span><a href="{$tsConfig.url}/perfil/{$c.user_name}/">{$c.user_name}</a></span>
				<a href="{$tsConfig.url}/fotos/{$c.user_name}/{$c.foto_id}/{$c.f_title|seo}.html#div_cmnt_{$c.cid}">{$c.f_title}</a>
			</article>
		{/foreach}
	{else}
		<div class="nada-gris">No hay comentarios</div>
	{/if}			
	</section>
</div>

