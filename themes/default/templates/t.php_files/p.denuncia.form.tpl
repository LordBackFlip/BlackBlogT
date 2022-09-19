{if $tsAction == 'denuncia-post'}
	<div id="boxdenu">
		<p><label>Denunciar el post:</label>"{$tsData.obj_title}"</p>
		{*<p><label>Creado por:</label><a href="{$tsConfig.url}/perfil/{$tsData.obj_user}" target="_blank">{$tsData.obj_user}</a></p>*}
		<p>
		<label>Raz&oacute;n de la denuncia:</label>
		<select name="razon">
			{foreach from=$tsDenuncias key=i item=denuncia}
				{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
			{/foreach}
		</select>
		</p>
		<p>Aclaraci&oacute;n y comentarios:</p>
		<textarea tabindex="6" rows="5" cols="40" name="extras"></textarea>
		<span class="size9">Si es Re-post debes indicar el link del post original.</span>
	</div>
{elseif $tsAction == 'denuncia-foto'}
	<div id="boxdenu">
		<p><label>Denunciar foto:</label>"{$tsData.obj_title}"</p>
		<p>
		<label>Raz&oacute;n de la denuncia:</label>
		<select name="razon">
			{foreach from=$tsDenuncias key=i item=denuncia}
				{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
			{/foreach}
		</select>
		</p>
		<label>Aclaraci&oacute;n y comentarios:</label>
		<textarea tabindex="6" rows="5" cols="40" name="extras"></textarea>
		<span>Para atender tu denuncia r&aacute;pidamente, puedes adjuntar capturas de pantalla como pruebas.</span>
	</div>
{elseif $tsAction == 'denuncia-mensaje'}
	<div id="boxdenu">
		Si reportas este mensaje ser&aacute; eliminado de tu bandeja 
		<br />&iquest;Realmente quieres denunciar este mensaje?
	</div>
	<input type="hidden" name="razon" value="spam"/>
{elseif $tsAction == 'denuncia-usuario'}
	<div id="boxdenu">
		<p><label>Denunciar usuario:</label>"{$tsData.nick}"</p>
		<p>
		<label>Raz&oacute;n de la denuncia:</label>
		<select name="razon">
			{foreach from=$tsDenuncias key=i item=denuncia}
				{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
		{/foreach}
		</select>
		</p>
		<p><label>Aclaraci&oacute;n y comentarios:</label></p>
		<textarea tabindex="6" rows="5" cols="40" name="extras"></textarea>
		<span>Para atender tu denuncia r&aacute;pidamente, puedes adjuntar capturas de pantalla como pruebas.</span>
	</div>
{elseif $tsAction == 'denuncia-comunidad'}
	<div id="boxdenu">
		<p><label>Denunciar comunidad:</label>"{$tsData.obj_title}"</p>
		<p>
		<label>Raz&oacute;n de la denuncia:</label>
		<select name="razon">
			{foreach from=$tsDenuncias key=i item=denuncia}
				{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
			{/foreach}
		</select>
		</p>
		<label>Aclaraci&oacute;n y comentarios:</label>
		<textarea tabindex="6" rows="5" cols="40" name="extras"></textarea>
	</div>
{elseif $tsAction == 'denuncia-tema'}
	<div id="boxdenu">
		<p><label>Denunciar comunidad:</label>"{$tsData.obj_title}"</p>
		<p>
		<label>Raz&oacute;n de la denuncia:</label>
		<select name="razon">
			{foreach from=$tsDenuncias key=i item=denuncia}
				{if $denuncia}<option value="{$i}">{$denuncia}</option>{/if}
			{/foreach}
		</select>
		</p>
		<label>Aclaraci&oacute;n y comentarios:</label>
		<textarea tabindex="6" rows="5" cols="40" name="extras"></textarea>
		<span class="size9">Si es Re-post debes indicar el link del tema original.</span>
	</div>	
{/if}