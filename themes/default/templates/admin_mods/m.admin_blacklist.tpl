<div class="boxy-title">
	<h3>Administrar Lista Negra</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}
		<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados</div>
	{/if}
	{if $tsError}
		<div class="aviso-error" style="margin: 20px;">{$tsError}</div>
	{/if}
	{if !$tsAct}
		{if !$tsBlackList.data}
			<div class="nada-gris" style="margin: 10px;">No hay nada en tu lista negra</div>
			<div class="botoboc">
				<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/blacklist?act=nuevo'" value="Agregar nuevo bloqueo" class="boton azul"/>
			</div>			
		{else}
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" class="admin_table">
                                    	<thead>
                                        	<th>ID</th>
                                            <th>Tipo</th>
                                            <th>Texto</th>
											<th>Raz&oacute;n</th>
                                            <th>Autor</th>
                                            <th>Fecha</th>
                                            <th>Acciones</th>
                                        </thead>
                                        <tbody>{foreach from=$tsBlackList.data item=b}
                                        	<tr id="block_{$b.id}">
                                                <td>{$b.id}</td>
                                                <td>{if $b.type == 1}IP{elseif $b.type == 2}Email{elseif $b.type == 3}Proveedor{elseif $b.type == 4}Nombre{else}Indefinido{/if}</td>
                                                <td>{$b.value}</td>
                                                <td>{$b.reason}</td>
                                                <td><a href="{$tsConfig.url}/perfil/{$b.user_name}" class="hovercard" uid="{$b.user_id}">{$b.user_name}</a></td>
                                                <td>{$b.date|hace}</td>
												<td class="admin_actions">
                                                    <a href="{$tsConfig.url}/admin/blacklist?act=editar&id={$b.id}"><img src="{$tsConfig.default}/images/icons/editar.png" title="Editar" /></a>
                                                    <a href="#" onclick="admin.blacklist.borrar({$b.id}); return false"><img src="{$tsConfig.url}/themes/default/images/icons/close.png" title="Eliminar"/></a>
                                                </td>
                                            </tr>{/foreach}
                                        </tbody>
                                        <tfoot>
										<td colspan="7">P&aacute;ginas: {$tsBlackList.pages}</td>
										</tfoot>
                                    </table>
			<div class="botoboc">	
				<input type="button" onclick="location.href = '{$tsConfig.url}/admin/blacklist?act=nuevo'" value="Agregar nuevo bloqueo" class="boton azul"/>
			</div>					
		{/if}
	{elseif $tsAct == 'editar' || $tsAct == 'nuevo'}
		<div class="boxblo">
			<h2 class="mixtu">{if $tsAct == 'editar'}Editar{else}Agregar{/if} Bloqueo</h2>
			<div class="boes" style="margin: 0;">Para bloquear correos masivos como ejemplo@yopmail.com, seleccione "proveedor de correo" e introduzca yopmail.com en el valor.</div>				
		</div>	
		<form action="" method="post" autocomplete="off">
			<div class="boxblo" style="border-top: 1px solid #eaedf1;">
				<div class="desbox">				
					<label>Tipo:</label>
				</div>
				<select name="type" id="b_type">
					<option value="1" {if $tsBL.type == 1}selected{/if}>IP</option>
					<option value="2" {if $tsBL.type == 2}selected{/if}>Email concreto</option>
					<option value="3" {if $tsBL.type == 3}selected{/if}>Proveedor de correo</option>
					<option value="4" {if $tsBL.type == 4}selected{/if}>Nombre</option>
				</select>				
			</div>
			<div class="boxblo">
				<div class="desbox">
					<label for="b_value">Valor:</label>				
				</div>			
				<input type="text" id="b_value" name="value" value="{$tsBL.value}"/>
			</div>			
			{if $tsAct == 'nuevo'}			
			<div class="boxblo">
				<div class="desbox">
					<label for="b_reason">Raz&oacute;n:</label>
					<span id="desc_message_welcome"> 
						<div class="nomo">
							<p style="margin: 5px 0 0 0;">Indica el motivo por el cual quiere agregarlo a la lista negra.</p> 
						</div>
					</span>				
				</div>
				<textarea name="reason" id="b_reason" rows="3" cols="40"  style="height: 69px;">{$tsBL.reason}</textarea>
			</div>	
			{/if}			
			<div class="botoboc">			
				<input type="submit" name="{if $tsAct == 'editar'}edit{else}new{/if}" value="{if $tsAct == 'editar'}Guardar{else}Agregar{/if}" class="boton azul"/>
			</div>
		</form>
	{/if}
</div>