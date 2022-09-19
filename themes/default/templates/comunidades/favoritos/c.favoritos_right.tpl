<div class="boxposts separa">
	<div class="titular">
		<h2>Categor&iacute;as</h2>
	</div>	
	<section class="tops">
		{if $tsFavoritos.total}
			<article>
				<a onclick="com.fav_filter('all');">Todas</a><span>{$tsFavoritos.total}</span>
			</article>
			{foreach from=$tsFavoritos.cat item=c}
			<article>
				<a onclick="com.fav_filter('{$c.c_seo}');">{$c.c_nombre}</a>
				<span>{$c.total}</span>
			</article>	
			{/foreach}
		{else}
			<div class="nada-gris">No hay temas para filtrar</div>
		{/if}			
	</section>
</div>