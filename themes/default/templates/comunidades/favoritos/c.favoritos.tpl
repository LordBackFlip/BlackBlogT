<div id="bgcom">
	<div id="comi">
		<div class="titular">
			<h2>Mis temas favoritos</h2>
			<a class="botob" href="javascript:com.fav_filter('all')">{$tsFavoritos.total}</a>
		</div>	
		{if $tsFavoritos.data}
            {include file='comunidades/favoritos/c.favoritos_left.tpl'}
        {else}
			<div class="nada-gris">No has agregado temas a tus favoritos a&uacute;n</div>
        {/if}		
	</div>	
	<div id="comd">
		<div class="com_right">
			{include file='comunidades/favoritos/c.favoritos_right.tpl'}
        </div>
	</div>
</div>		