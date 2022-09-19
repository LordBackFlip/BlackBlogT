<div class="bgagrecom">
{include file='modules/m.agregar_sidebar.tpl'}
	<form action="" method="post" id="add_new_tema">
	<div class="izquierdas">
		<div class="com_add_tema">
			{*<div class="cat_info"><a href="{$tsConfig.url}/pages/protocolo/" title="Protocolo">Importante: antes de crear un tema lee el protocolo.</a></div>*}
			<div class="cat_item clearfix">
				<label>T&iacute;tulo</label>
				<input type="text" name="titulo" class="input_text required" tabindex="1" maxlength="60" value="{$tsTema.t_titulo}" />
			</div>
			<div class="cat_item clearfix">
				<label>Contenido del Tema</label>
				<div id="tema">
					<textarea type="text" name="cuerpo" id="markItUp" tabindex="2" class="input_text required">{$tsTema.t_cuerpo}</textarea>
				</div>	
			</div>
			{if $tsTema.t_autor && $tsTema.t_autor != $tsUser->uid}
				<div class="cat_item clearfix">
					<label>Causa de la moderac&oacute;n</label>
					<input type="text" name="razon"  tabindex="3" class="input_text required" style="width: 582px;padding: 8px;" maxlength="80" />
				</div>
			{/if}
			<div class="cat_item clearfix">
				<input type="hidden" name="temaid" value="{$tsTema.t_id}" />
				
				<input type="button" class="boto azul floatR" value="Continuar" onclick="com.crear_tema()" />
				<input type="button" class="boto gris floatR" value="Guardar en borradores" onclick="com.save_borrador()" />
				
				<input type="hidden" name="bid" value="{$tsTema.b_id}" />
				<i id="msj_borrador"></i>
			</div>
		</div>
	</div>
	<div class="derecha">
		<div id="opciopo">								
			<li class="special-right clearbeta">
				<b>Opciones</b>
				<div class="option clearbeta">  
					<input type="checkbox" name="cerrado" tabindex="4" class="floatL" id="cerrado"  {if $tsTema.t_cerrado == 1}checked="checked"{/if} />						
					<p class="floatL"><label for="cerrado">Cerrar resuestas</label>Nadie podr&aacute; responder en este tema</p>				
				</div>
				{if $tsCom.mi_rango >= 4 || $tsUser->is_admod}
					<div class="option clearbeta"> 						
						<input type="checkbox" name="sticky" id="sticky" class="floatL" {if $tsTema.t_sticky == 1}checked="checked"{/if} />
						<p class="floatL"><label for="sticky"> Sticky</label>El tema quedar&aacute; destacado en la pagina de incio de la comunidad</p>
					</div>
				{/if}
			</li>
		</div>		
	</div>
	</form>
</div>