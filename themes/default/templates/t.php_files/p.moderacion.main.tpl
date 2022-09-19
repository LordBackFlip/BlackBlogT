{if $tsDo == 'aviso'}
	<div id="boxdenu">
		<p>
			<label>Tipo:</label>
			<select name="mod_type" id="mod_type">
				<option value="0">Informaci&oacute;n</option>
				<option value="1">Alerta</option>
				<option value="2">Staff Message</option>
				<option value="3">Prohibici&oacute;n</option>
				<option value="4">Gif Message</option>
			</select>
		</p>
		<p>
			<label>Asunto</label>
			<input type="text" name="mod_subject" id="mod_subject" size="39" tabindex="0" maxlength="24" value=""/>
		</p>	
		<p>
			<label>Mensaje</label>
			<textarea name="mod_body" id="mod_body" rows="10" tabindex="0"></textarea>
		</p>			
	</div>
{elseif $tsDo == 'ban'}
	<div id="boxdenu">
		<p><label>Suspender a:</label><a>{$tsUsername}</a></p>
		<p>
			<label>Tiempo:</label>
			<select name="mod_time" id="mod_time" onchange="ban_time(this.value);">
				<option value="0">Indefinido</option>
				<option value="1">Permanente</option>
				<option value="2">Horas</option>
				<option value="3">D&iacute;as</option>
			</select>
		</p>		
		<div id="ban_time" style="display:none">
			<p>
				<label>Cuantos:</label>
				<input type="text" name="mod_cant" id="mod_cant" size="10" tabindex="0" maxlength="3" style="width: 300px;"/>
			</p>
		</div>		
		<p><label>Causa:</label></p>
		<textarea name="mod_causa" id="mod_causa" rows="5" cols="40" tabindex="6"></textarea>
	</div>
		<script type="text/javascript">
		// {literal}
		function ban_time(tid){
			if(tid == 2 || tid == 3){
				var txt = (tid == 2) ? 'Cuantas' : 'Cuantos';
				$('#ban_time > .m-col1').text(txt);
				$('#ban_time').show()
			} else $('#ban_time').hide();
		}
		// {/literal}
		</script>
{/if}