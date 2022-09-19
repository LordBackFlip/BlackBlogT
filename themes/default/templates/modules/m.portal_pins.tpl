<div class="boxposts separa">
	<div class="titular">
		<h2>Pins</h2>
		<div class="fijoi"><span class="i pin"></span></div>
	</div>		
	<div class="boxreco" id="repin">	
	{if $tsPins}
		{foreach from=$tsPins item=p}
		<div class="htags">
			<a href="/mi/pin?q={$p.p_data}">{$p.p_data}</a>
			<div class="floatR opctag">
				<span class="close" onclick="pin.eliminar('{$p.pid}'),eli();"></span>
			</div>	
		</div>
		{/foreach}		
	{else}
		<div class="nada-gris vctip" title="Guarda palabras que te interesan como un pin para saber cuando se utilizan en un shout">No tienes pins</div>
	{/if}	
	</div>	
	<div class="fomupin">
		<textarea id="addPin" placeholder="Agregar pin" name="cuerpo"></textarea>
		<a onclick="pin.nuevo(),cambia();">+</a>
	</div>
</div>
