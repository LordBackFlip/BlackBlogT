<script type="text/javascript" src="{$tsConfig.js}/jquery.tablednd.js"></script>
<script type="text/javascript">
									// {literal}
									$(function(){
										// {/literal} {if $tsAct == ''} {literal}
										$('#cats_orden').tableDnD({
											onDrop: function(table, row) {
												$.ajax({
													   type: 'post', 
													   url: global_data.url + '/admin/cats?ajax=true&ordenar=true', 
													   cache: false, 
													   data: $.tableDnD.serialize()
												});
											}
										});
										// {/literal} {/if} {literal}
										$('#cats_orden').tableDnD({
											onDrop: function(table, row) {
												$.ajax({
													   type: 'post', 
													   url: global_data.url + '/admin/cats?ajax=true&ordenar=true&t=cat', 
													   cache: false, 
													   data: $.tableDnD.serialize()
												});
											}
										});
										//
										$('#cat_img').change(function(){
											var cssi = $("#cat_img option:selected").css('background');
											$('#c_icon').css({"background" : cssi});
										});
										//
									});
									//{/literal}
</script>
<div class="boxy-title">
	<h3>Administrar Categor&iacute;as</h3>
</div>
<div id="res" class="boxgris">
	{if $tsSave}<div class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
	{if $tsAct == ''}
		{if !$tsSave}
			<div class="mensajes ok">Puedes cambiar el orden de las categor&iacute;as tan s&oacute;lo con arrastrarlas con el puntero</div>
		{/if}
		<table cellpadding="0" cellspacing="0" border="0" width="500" align="center" class="admin_table" id="cats_orden">
			<thead>
				<th colspan="3" style="text-align:left; padding-left:7px;">Categor&iacute;as</th>
			</thead>
			<tbody>
				{foreach from=$tsConfig.categorias item=c}
					<tr id="{$c.cid}">
						<td width="30">{$c.c_orden}</td>
						<td style="text-align:left; padding-left:20px; background:url({$tsConfig.url}/themes/default/images/icons/cat/{$c.c_img}) no-repeat 2px center;"><b><u>{$c.c_nombre}</u></b></td>
						<td class="admin_actions" width="100">
							<a href="?act=editar&cid={$c.cid}&t=cat"><img src="{$tsConfig.url}/themes/default/images/icons/editar.png" title="Editar Categor&iacute;a"/></a>
							<a href="?act=borrar&cid={$c.cid}&t=cat"><img src="{$tsConfig.url}/themes/default/images/icons/close.png" title="Borrar Categor&iacute;a"/></a>
						</td>
					</tr>
				{/foreach}
			</tbody>
		</table>			
		<div class="botoboc">
			<input type="button"  onclick="location.href = '{$tsConfig.url}/admin/cats?act=nueva&t=cat'" value="Nueva Categor&iacute;a" class="boton azul" style="float: right;width: 49%;"/>
			<input type="button" onclick="location.href = '/admin/cats?act=change'" value="Mover Posts" class="boton azul" style="float: left;width: 49%;">	
		</div>	
	{elseif $tsAct == 'editar'}
		<form action="" method="post" autocomplete="off">		
			<div class="boxblo">
				<h2 class="mixtu">Editar</h2>
				<div class="desbox">
					<label for="cat_name">Nombre de la categor&iacute;a:</label>				
				</div>			
				<input type="text" id="cat_name"name="c_nombre" value="{$tsCat.c_nombre}" />
			</div>				
			<div class="boxblo">
				<div class="desbox">
					<label for="cat_img">Icono de la categor&iacute;a:</label>
					<img src="{$tsConfig.images}/space.gif" style="background:url({$tsConfig.url}/themes/default/images/icons/cat/{$tsCat.c_img}) no-repeat left center;" width="16" height="16" id="c_icon"/>
				</div>
				<select name="c_img" id="cat_img">
					{foreach from=$tsIcons key=i item=img}
						<option value="{$img}" style="background: url({$tsConfig.url}/themes/default/images/icons/cat/{$img}) no-repeat left center;" {if $tsCat.c_img == $img}selected="selected"{/if}>{$img}</option>
					{/foreach}				
				</select>
			</div>
			<div class="botoboc">
				<input type="submit" name="save" value="Guardar cambios" class="boton azul"/>
			</div>							
		</form>
	{elseif $tsAct == 'nueva'}
		<form action="" method="post" autocomplete="off">
			<div class="boxblo">
				<h2 class="mixtu">Nueva</h2>
				<div class="boes" style="margin: 0;">Si deseas m&aacute;s iconos para las categor&iacute;as debes subirlos al directorio: /themes/default/images/icons/cat/</div>				
			</div>	
			<div class="boxblo">
				<div class="desbox">
					<label for="cat_name">Nombre de la categor&iacute;a:</label>				
				</div>			
				<input type="text" id="cat_name"name="c_nombre" value="" />
			</div>		
			<div class="boxblo">
				<div class="desbox">				
					<label for="cat_img">Icono de la categor&iacute;a:</label>
					<img src="{$tsConfig.images}/space.gif" width="16" height="16" id="c_icon"/>
				</div>
				<select name="c_img" id="cat_img">
					{foreach from=$tsIcons key=i item=img}
						<option value="{$img}" style="background:url({$tsConfig.url}/themes/default/images/icons/cat/{$img}) no-repeat left center;">{$img}</option>
					{/foreach}
				</select>
			</div>
			<div class="botoboc">			
				<input type="submit" name="save" value="Crear Categor&iacute;a" class="boton azul">
			</div>		
		</form>
	{elseif $tsAct == 'borrar'}
		{if $tsError}
			<div class="aviso-error" style="margin: 20px;">{$tsError}</div>
		{/if}
		{if $tsType == 'cat'}
			<form action="" method="post" id="admin_form">
				<div class="boxblo">
					<h2 class="mixtu">Borrar categor&iacute;a</h2>
					<div class="boes" style="margin: 0;">Para borrar esta categor&iacute;a debes mover los posts que existan con esta categor&iacute;a a otra diferente.</div>				
				</div>		
				<div class="boxblo">
					<div class="desbox">				
						<label for="h_mov">Mover todos a:</label>
					</div>
					<select name="ncid" id="h_mov">
						<option value="-1">Categor&iacute;as</option>
						{foreach from=$tsConfig.categorias item=c}
							{if $c.cid != $tsCID}
								<option value="{$c.cid}">{$c.c_nombre}</option>
							{/if}
						{/foreach}
					</select>
				</div>
				<div class="botoboc">			
					<input type="submit" name="save" value="Guardar cambios" class="boton azul">
				</div>				
			</form>	                                        
		{/if}
	{elseif $tsAct == 'change'}
		{if $tsError}
			<div class="aviso-error" style="margin: 20px;">{$tsError}</div>
		{/if}
		<form action="" method="post" id="admin_form">
			<div class="boxblo">
					<h2 class="mixtu">Mover todos los posts de la categor&iacute;a:</h2>
					<div id="filps" style="margin: 0;">
						<select name="oldcid" style="margin: 0;">
							<option value="-1">Categor&iacute;as</option>
							{foreach from=$tsConfig.categorias item=c}
								{if $c.cid != $tsCID}<option value="{$c.cid}">{$c.c_nombre}</option>{/if}
							{/foreach}
						</select>
						<b style="float: left;margin: 10px 10px 10px 20px;">a</b>
						<select name="newcid">
							<option value="-1">Categor&iacute;as</option>
							{foreach from=$tsConfig.categorias item=c}
								{if $c.cid != $tsCID}<option value="{$c.cid}">{$c.c_nombre}</option>{/if}
							{/foreach}
						</select>
					</div>
				</div>			
			<div class="botoboc">
				<input type="submit" name="save" value="Guardar cambios" class="boton azul">
			</div>	
		</form>	                                        
	{/if}
</div>