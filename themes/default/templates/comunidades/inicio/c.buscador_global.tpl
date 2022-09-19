<div class="boxposts separa">
	<div class="titular">
		<h2>Buscar en la Comunidad</h2>
	</div>
	<form action="{$tsConfig.url}/comunidades/buscar/" id="nel">
		<input type="text" class="input_text floatL" name="q"/>
		<input type="submit" value="Buscar" class="boto verde"/>
		<input type="hidden" name="tipo" value="temas"/>
		<input type="hidden" name="comid" value="{$tsCom.c_id}"/>
	</form>
</div>