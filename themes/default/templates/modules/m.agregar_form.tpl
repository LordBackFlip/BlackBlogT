<script src="{$tsConfig.js}/formita.js" type="text/javascript" ></script>
{literal}
<script type="text/javascript">
	$(function() {
		$('#tagnew').tagsInput({
			width: 'auto',
		});
	});	
</script>
{/literal}
{if $tsUser->is_admod || $tsUser->permisos.gopp}
<div class="form-add-post">
	<form action="{$tsConfig.url}/agregar.php{if $tsAction == 'editar'}?action=editar&pid={$tsPid}{/if}" method="post" name="newpost" autocomplete="off">	
		<div class="izquierda">
			<div class="oblig">
				Todos los campos con <span></span> son obligatorios
			</div>
			<input type="hidden" value="{$tsDraft.bid}" name="borrador_id"/>
			<ul class="clearbeta">				
				<li>
					<label><span></span>T&iacute;tulo</label>
					<span style="display: none;" class="errormsg"></span>
					<input type="text" tabindex="1" name="titulo" maxlength="60" size="60" class="text-inp required" value="{$tsDraft.b_title}" placeholder="Escribe aquí el título del post"/>
					<div id="repost"></div>
				</li>
				<li>
					<a name="post"></a>
					<label><span></span>Cuerpo</label>
					<span style="display: none;" class="errormsg"></span>
					<textarea id="markItUp" name="cuerpo" tabindex="2" style="min-height:300px;" class="required">{$tsDraft.b_body}</textarea>
				</li>				
				{if ($tsUser->is_admod > 0 || $tsUser->permisos.moedpo) && $tsDraft.b_title && $tsDraft.b_user != $tsUser->uid}
					<li style="clear:both;">
						<label>Raz&oacute;n</label>
						<span style="display: none;" class="errormsg"></span>
						<input type="text" tabindex="8" name="razon" maxlength="150" size="60" class="text-inp" value="" style="width: 326px;"/>
						<p class="razonpor">Si has modificado el contenido de este post ingresa la raz&oacute;n por la cual lo modificaste</p>
					</li>
				{/if}			
				<span id="previs" class="boto verde">Previsualizar</span>
			</ul>
		</div>
		<div class="derecha">	
			<li class="special-right clearbeta">
				<label><span></span>Categor&iacute;a</label>
				<span style="display: none;" class="errormsg"></span>
				<select class="incube required" tabindex="3" name="categoria">
					<option value="" selected="selected">Seleccionar categor&iacute;a</option>
					{foreach from=$tsConfig.categorias item=c}
						<option value="{$c.cid}" {if $tsDraft.b_category == $c.cid}selected="selected"{/if}>{$c.c_nombre}</option>
					{/foreach}
				</select>					
			</li>	
			<li id="tagsfox">
				<label><span></span>Etiquetas</label>
				<span style="display: none;" id="tagerror" class="errormsg"></span>
				<input id='tagnew' type="text" tabindex="4" name="tags" maxlength="128" class="text-inp required" value="{$tsDraft.b_tags}"/>
				<p>Ingresa <b>al menos 4 etiquetas</b> distintas separadas por comas que describan el contenido de tu post.</p>								
			</li>
			{include file='modules/m.agregar_subir_portada.tpl'}				


			<li class="special-right clearbeta">
				<label>Qui&eacute;nes pueden comentar?</label>
				<select class="incube" tabindex="5" name="sin_comentarios">
					<option value="0" {if $tsDraft.b_block_comments == 0}selected="selected"{/if}>Todos pueden comentar</option>
					<option value="1" {if $tsDraft.b_block_comments == 1}selected="selected"{/if}>Nadie puede comentar</option>
				</select>					
			</li>					
			<div class="end-form clearbeta">				
				<span id="previ" class="boto azul" style="width: 75px;text-align: center;">{if $tsDraft}Guardar{else}Publicar{/if}</span>
				<span onclick="save_borrador()" id="borrador-save" class="boto gris" style="margin-left: 0;">Guardar en borradores</span>								
				<div id="borrador-guardado"></div>
			</div>								
						
			<label>Otras opciones</label>			
			<div class="ijus">
				<div class="option clearbeta">  
					<input type="checkbox" tabindex="6" name="privado" id="privado" class="floatL" {if $tsDraft.b_private == 1}checked="checked"{/if} />						
					<p class="floatL">
						<label for="privado">Post privado</label>
						Podr&aacute;n verlo s&oacute;lo usuarios registrados
					</p>
				</div>	
				<div class="option clearbeta">  
					<input type="checkbox" tabindex="7" name="visitantes" id="visitantes" class="floatL" {if $tsDraft.b_visitantes == 1}checked="checked"{/if} />
					<p class="floatL">
						<label for="visitantes">Visitas recientes</label>
						Se veran los &uacute;ltimos visitantes
					</p>
				</div>
					<div class="option clearbeta">  
						<input type="checkbox" tabindex="8" name="smileys" id="smileys" class="floatL" {if $tsDraft.b_smileys == 1}checked={/if}>
						<p class="floatL">
							<label for="smileys">Sin smileys</label>
							Si tu post no necesita smileys
						</p>
					</div>
					{if $tsUser->is_admod == 1}
						<div class="option clearbeta">  
							<input type="checkbox" tabindex="9" name="patrocinado" id="patrocinado" class="floatL" {if $tsDraft.b_sponsored == 1}checked="checked"{/if} >
							<p class="floatL">
								<label for="patrocinado">Patrocinado</label>
								Resalta este post entre los dem&aacute;s
							</p>
						</div>
					{/if}
					{if $tsUser->is_admod || $tsUser->permisos.most}
						<div class="option clearbeta">  
							<input type="checkbox" tabindex="10" name="sticky" id="sticky" class="floatL" {if $tsDraft.b_sticky == 1}checked="checked"{/if} >
							<p class="floatL">
								<label for="sticky">Sticky</label>
								Colocar a este post fijo en la home
							</p>
						</div>
					{/if}			
			</div>			
						{*
			<div id="opciopo">							
				<li class="special-right clearbeta">
					<b>Otras Opciones</b>
					<div class="option clearbeta">  
						<input type="checkbox" tabindex="7" name="visitantes" id="visitantes" class="floatL" {if $tsDraft.b_visitantes == 1}checked="checked"{/if} />
						<p class="floatL">
							<label for="visitantes">Visitas recientes</label>
							Se veran los &uacute;ltimos visitantes
						</p>
					</div>
					<div class="option clearbeta">  
						<input type="checkbox" tabindex="8" name="smileys" id="smileys" class="floatL" {if $tsDraft.b_smileys == 1}checked={/if}>
						<p class="floatL">
							<label for="smileys">Sin smileys</label>
							Si tu post no necesita smileys
						</p>
					</div>
					{if $tsUser->is_admod == 1}
						<div class="option clearbeta">  
							<input type="checkbox" tabindex="9" name="patrocinado" id="patrocinado" class="floatL" {if $tsDraft.b_sponsored == 1}checked="checked"{/if} >
							<p class="floatL">
								<label for="patrocinado">Patrocinado</label>
								Resalta este post entre los dem&aacute;s
							</p>
						</div>
					{/if}
					{if $tsUser->is_admod || $tsUser->permisos.most}
						<div class="option clearbeta">  
							<input type="checkbox" tabindex="10" name="sticky" id="sticky" class="floatL" {if $tsDraft.b_sticky == 1}checked="checked"{/if} >
							<p class="floatL">
								<label for="sticky">Sticky</label>
								Colocar a este post fijo en la home
							</p>
						</div>
					{/if}
				</li>
			</div>
						*}
		</div>
	</form>
</div>
{else}
	<div class="nada-gris">Lo sentimos, pero no puedes publicar un nuevo post</div>
{/if}