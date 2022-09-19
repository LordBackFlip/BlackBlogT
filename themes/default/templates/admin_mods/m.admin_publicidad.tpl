<div class="boxy-title">
	<h3>Administrar Publicidad</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}
		<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados</div>
	{/if}
	<form action="" method="post" autocomplete="off">
		<div class="boxblo">
			<div class="desbox" style="height: 92px;">
				<label for="ai_ban_1">Banner 300x250:</label>
			</div>
			<textarea name="ad300" id="ai_ban_1" rows="5" cols="50" onclick="select(this);" style="height: 90px;">{$tsConfig.ads_300}</textarea>
		</div>
		<div class="boxblo">
			<div class="desbox" style="height: 92px;">
				<label for="ai_ban_2">Banner 468x60:</label>
			</div>
			<textarea name="ad468" id="ai_ban_2" rows="5" cols="50" onclick="select(this);" style="height: 90px;">{$tsConfig.ads_468}</textarea>
		</div>
		<div class="boxblo">
			<div class="desbox" style="height: 92px;">
				<label for="ai_ban_3">Banner 160x600:</label>
			</div>
			<textarea name="ad160" id="ai_ban_3" rows="5" cols="50" onclick="select(this);" style="height: 90px;">{$tsConfig.ads_160}</textarea>
		</div>		
		<div class="boxblo">
			<div class="desbox" style="height: 92px;">
				<label for="ai_ban_4">Banner 728x90:</label>
			</div>
			<textarea name="ad728" id="ai_ban_4" rows="5" cols="50" onclick="select(this);" style="height: 90px;">{$tsConfig.ads_728}</textarea>
		</div>				
		<div class="boxblo">
			<div class="desbox">
				<label for="ai_xat">Search ID:</label>
				<span class="foquito" onclick="mydialog.alert('Información','ID de tu buscador de GOOGLE')"></span>
			</div>
			<input type="text" name="adSearch" id="ai_ban_5" value="{$tsConfig.ads_search}"/>
		</div>
		<div class="botoboc">
			<input type="submit" value="Guardar cambios" name="save" class="boton azul"/>
		</div>
	</form>
</div>