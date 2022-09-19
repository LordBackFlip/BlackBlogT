<div class="floatR filterCat">
	<select onchange="com.ir_a_categoria(this.value)">	
		<option value="{if $tsAct}-1{/if}">{if $tsAct}Ver todas{else}Seleccionar categor&iacute;a{/if}</option>
		{foreach from=$tsCats item=c}
			<option value="{$c.c_seo}" {if $tsAct == $c.c_seo}selected="selected"{/if}>{$c.c_nombre}</option>
		{/foreach}
	</select>	
</div>