<div class="boxy-title">
	<h3>Censurar palabras</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}
		<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados</div>
	{/if}
	{if $tsError}
		<div class="aviso-error" style="margin: 20px 20px 5px 20px;">{$tsError}</div>
	{/if}
	{if !$tsAct}
		{if !$tsBadWords.data}
			<div class="nada-gris" style="margin: 10px;">No hay filtros de palabras</div>
		{else}
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" class="admin_table">
                                    	<thead>
                                        	<th>ID</th>
                                            <th>M&eacute;todo</th>
                                            <th>Tipo</th>
                                            <th>Antes</th>
											<th>Despu&eacute;s</th>
                                            <th>Raz&oacute;n</th>
                                            <th>Autor</th>
                                            <th>Fecha</th>
                                            <th>Acciones</th>
                                        </thead>
                                        <tbody>{foreach from=$tsBadWords.data item=b}
                                        	<tr id="wid_{$b.wid}">
                                                <td>{$b.wid}</td>
                                                <td>{if $b.method == 1}Exacto{else}Parcial{/if}</td>
                                                <td>{if $b.type == 1}Smiley{else}Texto{/if}</td>
                                                <td>{$b.word}</td>
                                                <td>{if $b.type == 1}<img src="{$b.swop}" style="max-width:32px; max-height:32px;"/>{else}{$b.swop}{/if}</td>
                                                <td>{$b.reason}</td>
                                                <td><a href="{$tsConfig.url}/perfil/{$b.user_name}" class="hovercard" uid="{$b.user_id}">{$b.user_name}</a></td>
                                                <td>{$b.date|hace}</td>
												<td class="admin_actions">
                                                    <a href="{$tsConfig.url}/admin/badwords?act=editar&id={$b.wid}"><img src="{$tsConfig.default}/images/icons/editar.png" title="Editar" /></a>
                                                    <a href="#" onclick="admin.badwords.borrar({$b.wid}); return false"><img src="{$tsConfig.url}/themes/default/images/icons/close.png" title="Eliminar"/></a>
                                                </td>
                                            </tr>{/foreach}
                                        </tbody>
                                        <tfoot>
										<td colspan="9">P&aacute;ginas: {$tsBadWords.pages}</td>
										</tfoot>
                                    </table>
		{/if}
		<div class="botoboc">			
			<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/badwords?act=nuevo'" value="Agregar nuevo filtro"  class="boton azul">
		</div>
	{elseif $tsAct == 'editar' || $tsAct == 'nuevo'}	
		<form action="" method="post" autocomplete="off">
			<div class="boxblo">
				<h2 class="mixtu">{if $tsAct == 'editar'}Editar{else}Agregar{/if} filtro de palabra</h2>
				<div class="boes" style="margin: 0;">El m&eacute;todo exacto filtra s&oacute;lo palabras completas, mientras que el parcial filtra todas las coincidencias, aunque forme parte de una palabra. Si opta por usar un smiley, introduzca el enlace directo hacia la imagen.</div>				
			</div>		
			<div class="boxblo">
				<div class="desbox">
					<label for="bw_before">Antes:</label>				
				</div>			
				<input type="text" id="bw_before" name="before" value="{$tsBW.word}"/>
			</div>		
			<div class="boxblo">
				<div class="desbox">
					<label for="bw_after">Despu&eacute;s:</label>				
				</div>			
				<input type="text" id="bw_after" name="after" value="{$tsBW.swop}"/>
			</div>		
			<div class="boxblo">
				<div class="desbox">				
					<label for="bw_method">M&eacute;todo:</label>
				</div>
				<select name="method" id="bw_method">
					<option value="0" {if $tsBW.method == 0}selected{/if}>Parcial</option>
					<option value="1" {if $tsBW.method == 1}selected{/if}>Exacto</option>
				</select>				
			</div>
			<div class="boxblo">
				<div class="desbox">				
					<label for="bw_type">Tipo:</label>
				</div>
				<select name="type" id="bw_type">
					<option value="0" {if $tsBW.type == 0}selected{/if}>Texto</option>
					<option value="1" {if $tsBW.type == 1}selected{/if}>Smiley</option>
				</select>				
			</div>			
			{if $tsAct == 'nuevo'}
			<div class="boxblo">
				<div class="desbox">
					<label for="bw_reason">Razón:</label>
					<span id="desc_message_welcome"> 
						<div class="nomo">
							<p style="margin: 5px 0 0 0;">Indica el motivo por el cual quiere agregar este filtro.</p> 
						</div>
					</span>				
				</div>
				<textarea name="reason" id="bw_reason" rows="3" cols="40" style="height: 53px;">{$tsBW.reason}</textarea>
			</div>
			{/if}
			<div class="botoboc">			
				<input type="submit" name="{if $tsAct == 'editar'}edit{else}new{/if}" value="{if $tsAct == 'editar'}Guardar{else}Agregar{/if}" class="boton azul">
			</div>			
		</form>
	{/if}
</div>