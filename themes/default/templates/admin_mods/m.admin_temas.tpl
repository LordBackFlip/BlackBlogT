<div class="boxy-title">
	<h3>Administrar Temas</h3>
</div>
<div id="res" class="boxgris">
{if $tsSave}<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
{if $tsAct == ''}
	<table cellpadding="0" cellspacing="0" border="0" width="668" align="center" class="admin_table">
		<thead>
			<th>Vista previa</th>
			<th>Nombre</th>
			<th>Opciones</th>
		</thead>
		<tbody>
			{foreach from=$tsTemas item=tema}
			<tr>
				<td width="150"><img src="{$tema.t_url}/screenshot.png" width="150" height="100" /></td>
				<td><b><u>{$tema.t_name}</u></b></td>
				<td class="admin_actions">
					<a href="?act=editar&tid={$tema.tid}"><img src="{$tsConfig.url}/themes/default/images/icons/editar.png" title="Editar este tema"/></a>
					{if $tsConfig.tema_id == $tema.tid}
						<a onclick="return false;"><img src="{$tsConfig.url}/themes/default/images/icons/yes.png" title="Este tema est&aacute; en uso" /></a>
					{else}
						<a href="?act=usar&tid={$tema.tid}&tt={$tema.t_name}"><img src="{$tsConfig.url}/themes/default/images/icons/theme.png" title="Usar este tema" /></a>
						{if $tema.tid != 1}<a href="?act=borrar&tid={$tema.tid}&tt={$tema.t_name}"><img src="{$tsConfig.url}/themes/default/images/icons/close.png" title="Borrar este tema" /></a>{/if}
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
	<div class="botoboc">
		<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/temas?act=nuevo'"value="Instalar nuevo tema" class="boton azul">
	</div>																		
	{elseif $tsAct == 'editar'}
		<form action="" method="post" id="admin_form" autocomplete="off">
			<div class="boxblo">
				<div class="desbox">
					<label for="ai_name">Nombre del tema:</label>				
				</div>		
				<input type="text" id="ai_name" name="name" value="{$tsTema.t_name}" size="30" disabled="disabled"/>
			</div>
			<div class="boxblo">
				<div class="desbox">
					<label for="ai_url">URL completa del tema:</label>				
				</div>		
				<input type="text" id="ai_url" name="url" value="{$tsTema.t_url}" size="30" />			
			</div>
			<div class="boxblo">
				<div class="desbox">
					<label for="ai_path">Carpeta donde esta el tema:</label>				
				</div>		
				<input type="text" id="ai_path" name="path" value="{$tsTema.t_path}" size="30" />			
			</div>										
			<div class="botoboc">
				<input type="submit" value="Guardar tema" name="save" class="boton azul">
			</div>									
		</form>
	{elseif $tsAct == 'usar' || $tsAct == 'borrar'}
		{if $tsAct == 'borrar'}
			<div class="aviso-error" style="margin: 20px 20px 10px 20px;">Te recordamos que debes borrar la carpeta del Tema manualmente en el servidor.</div>
		{/if}
		<form action="" method="post" id="admin_form" autocomplete="off">
			<div class="boxblo">
				<h2 class="mixtu"><center>{$tt}</center></h2>
			</div>											
			<div class="botoboc">
				<input type="submit" name="confirm" value="{if $tsAct == 'usar'}Confirmar el cambio de{else}Continuar borrando este{/if} tema" class="boton azul"/>
			</div>
		</form>
	{elseif $tsAct == 'nuevo'}
		{if $tsError}
			<div class="aviso-error" style="margin: 20px 20px 10px 20px;">{$tsError}</div>
		{/if}
		<form action="" method="post" id="admin_form" autocomplete="off">
			<div class="boxblo">
				<h2 class="mixtu">Nombre de la carpeta donde esta el tema a instalar:</h2>
				<div class="desbox">
					<label for="ai_path">{$tsConfig.url}/themes/:</label>				
				</div>		
				<input type="text" id="ai_path" name="path" size="30" />			
			</div>											
			<div class="botoboc">
				<input type="submit" value="Instalar tema" class="boton azul">
			</div>	
		</form>
	{/if}
</div>