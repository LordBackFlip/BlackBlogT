<h3 class="active" onclick="cuenta.chgsec(this)">M&aacute;s sobre mi</h3>
<fieldset>
	<div class="alert-cuenta cuenta-2"></div>
	<div class="field">
		<label for="nombrez">Nombre completo</label>
		<input type="text" value="{$tsPerfil.p_nombre}" maxlength="60" name="nombrez" id="nombrez" class="text cuenta-save-2">
	</div>
	<div class="field">
		<label for="sitio">Mensaje Personal</label>
		<textarea value="" maxlength="60" name="mensaje" id="mensaje" class="cuenta-save-2">{$tsPerfil.p_mensaje}</textarea>
	</div>
	<div class="field">
		<label for="sitio">Sitio Web</label>
		<input type="text" value="{$tsPerfil.p_sitio}" maxlength="60" name="sitio" id="sitio" class="text cuenta-save-2">
	</div>
	<div class="field">
		<label for="ft">Redes sociales</label>
		<div style="float:left;">
			<div class="ddsf">
				<img src="{$tsConfig.default}/images/icons/facebook.png" width="16" height="16"/>
				<strong>facebook.com/</strong>
				<input type="text" value="{$tsPerfil.p_socials.f}" maxlength="64" name="facebook" id="ft" class="text cuenta-save-2">
			</div>
			<div class="ddsf">
				<img src="{$tsConfig.default}/images/icons/twitter.png" width="16" height="16"/>
				<strong>twitter.com/</strong>
				<input type="text" value="{$tsPerfil.p_socials.t}" maxlength="64" name="twitter" id="ft2" class="text cuenta-save-2">
			</div>
		</div>
	</div>
	<div class="field">
		<label>Me gustar&iacute;a</label>
		<div class="input-fake">
			<ul>
				{foreach from=$tsPData.gustos key=val item=text}
					<li><input type="checkbox" name="g_{$val}" class="cuenta-save-2" value="1" {if $tsPerfil.p_gustos.$val == 1}checked="checked"{/if}>{$text}</li>
				{/foreach}
			</ul>
		</div>
	</div>
	<div class="field">
		<label for="estado">Estado Civil</label>
		<div class="input-fake">
			<select class="cuenta-save-2" name="estado" id="estado">
				{foreach from=$tsPData.estado key=val item=text}
					<option value="{$val}" {if $tsPerfil.p_estado == $val}selected="selected"{/if}>{$text}</option>
				{/foreach}
			</select>
		</div>
	</div>
	<div class="field">
		<label for="hijos">Hijos</label>
		<div class="input-fake">
			<select class="cuenta-save-2" name="hijos" id="hijos">
				{foreach from=$tsPData.hijos key=val item=text}
					<option value="{$val}" {if $tsPerfil.p_hijos == $val}selected="selected"{/if}>{$text}</option>
				{/foreach}
			</select>
		</div>
	</div>
	<div class="field" style="border-bottom: 0;">
		<label for="vivo">Vivo con</label>
		<div class="input-fake">
			<select class="cuenta-save-2" name="vivo" id="vivo">
				{foreach from=$tsPData.vivo key=val item=text}
					<option value="{$val}" {if $tsPerfil.p_vivo == $val}selected="selected"{/if}>{$text}</option>
				{/foreach}
			</select>
		</div>
	</div>
	<div class="buttons">
		<input type="button" value="Guardar" onclick="cuenta.save(2, false)" class="boto verde" style="margin-right: 5px;">
		<input type="button" value="Siguiente" onclick="cuenta.save(2, true)" class="boto gris">
	</div>
</fieldset>