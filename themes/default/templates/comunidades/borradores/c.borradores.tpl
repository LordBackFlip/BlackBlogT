<div id="bgcom">
	<div id="comi">
		<div class="titular">
			<h2>Borradores</h2>
			<a class="botob" href="javascript:com.borrador_filter('all')">{$tsBorradores.total}</a>
		</div>	
		{if $tsBorradores.data}
            {include file='comunidades/borradores/c.borradores_left.tpl'}
        {else}
			<div class="nada-gris">No tienes ning&uacute;n borrador a&uacute;n</div>
        {/if}		
	</div>	
	<div id="comd">
		<div class="com_right">
            {include file='comunidades/borradores/c.borradores_right.tpl'}
        </div>
	</div>
</div>		