<div class="boxy-title">
	<h3>Administrar Afiliados</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}
		<div style="display: block;" class="mensajes ok">Tus cambios han sido guardados</div>
	{/if}
	{if !$tsAct}
		{if !$tsAfiliados}
			<div class="nada-gris" style="margin: 10px;">No hay afiliados</div>
			<div class="botoboc">
				<input type="button"  onclick="afiliado.nuevo(); return false" value="Agregar nuevo afiliado" class="boton azul"/>
			</div>						
		{else}
			<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" class="admin_table">
				<thead>
					<th>ID</th>
					<th>Afiliado</th>
					<th>Cuando</th>
					<th>Entrada</th>
					<th>Salida</th>
					<th>Estado</th>
					<th>Acciones</th>
				</thead>
				<tbody>
					{foreach from=$tsAfiliados item=af}
						<tr id="few_{$af.aid}">
							<td>{$af.aid}</td>
							<td><a href="{$af.a_url}" id="a_url_{$af.aid}" target="_blank"><span id="a_name_{$af.aid}">{$af.a_titulo}</span></a></td>
							<td>{$af.a_date|hace}</td>
							<td>{$af.a_hits_in}</td>
							<td>{$af.a_hits_out}</td>
							<td id="status_afiliado_{$af.aid}">{if $af.a_active == 0}<font color="purple">Inactivo</font>{else}<font color="green">Activo</font>{/if}</td>
							<td class="admin_actions">
								<a href="afs/editar/{$af.aid}"><img src="{$tsConfig.url}/themes/default/images/icons/editar.png" title="Editar"/></a>
								<a href="#" onclick="ad_afiliado.detalles({$af.aid}); return false;"><img src="{$tsConfig.url}/themes/default/images/icons/details.png" title="Detalles"/></a>
								<a onclick="admin.afs.accion({$af.aid}); return false"><img src="{$tsConfig.default}/images/reactivar.png" title="Activar/Desactivar Afiliado" /></a>
								<a href="#" onclick="admin.afs.borrar({$af.aid}); return false"><img src="{$tsConfig.url}/themes/default/images/icons/close.png" title="Eliminar"/></a>
							</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
			<div class="botoboc">
				<input type="button"  onclick="afiliado.nuevo(); return false" value="Agregar nuevo afiliado" class="boton azul"/>
			</div>									
		{/if}
	{elseif $tsAct == 'editar'}
		<form action="" method="post" autocomplete="off">
			<div class="boxblo">
				<h2 class="mixtu">Editar afiliado</h2>
				<div class="desbox">
					<label for="af_name">T&iacute;tulo del afiliado:</label>
				</div>		
				<input type="text" id="af_name" name="af_title" value="{$tsAf.a_titulo}" />
			</div>	
			<div class="boxblo">
				<div class="desbox">
					<label for="af_url">Direcci&oacute;n:</label>
				</div>		
				<input type="text" id="af_url" name="af_url" value="{$tsAf.a_url}" />
			</div>				
			<div class="boxblo">
				<div class="desbox">
					<label for="af_banner">Banner:</label>
					<span class="foquito" onclick="mydialog.alert('Información','Imagen del afiliado')"></span>
				</div>		
				<input type="text" id="af_banner" name="af_banner" value="{$tsAf.a_banner}" />
			</div>				
			<div class="boxblo">
				<div class="desbox">
					<label for="af_desc">Descripci&oacute;n:</label>
					<div class="nomo">
						<p style="margin: 5px 0 0 0;">Descripci&oacute;n de la comunidad afiliada.</p> 
					</div>
				</div>
				<textarea name="af_desc" id="af_desc" rows="3" cols="40" style="height: 53px;">{$tsAf.a_descripcion}</textarea>
			</div>
			<div class="botoboc">
				<input type="submit" name="edit" value="Guardar Cambios" class="boton azul"/>
			</div>			
		</form>
	{/if}
</div>