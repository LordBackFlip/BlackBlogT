<div class="boxposts separa">
	<div class="titular">
		<h2>Comunidades</h2>
	</div>	
	<section class="tops">
		<article>
			<a onclick="com.borrador_filter('all')">Todas</a>
			<span>{$tsBorradores.total}</span>
		</article>
		{foreach from=$tsBorradores.comus item=c}
		<article>
			<a onclick="com.borrador_filter('{$c.c_id}')">{$c.c_nombre}</a>
			<span>{$c.total}</span>
		</article>	
		{/foreach}		
	</section>
</div>