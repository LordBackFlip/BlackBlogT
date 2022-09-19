<div id="procesando"><div id="post"></div></div>
<div class="creul">
	<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" class="avese"/>
	<div id="gif_cargando" style="display: none;margin:10px 3px 0 3px;">
		<img src="{$tsConfig.tema.t_url}/i/min-carga.gif"/>
	</div>
</div>
<div class="Container">
{include file='modules/m.global_emoticons.tpl'}
	<div class="error"></div>
	<textarea id="body_comm" class="onblur_effect autogrow" tabindex="1" title="Escribir un comentario..." style="resize:none;" onfocus="onfocus_input(this)" onblur="onblur_input(this)">Escribir un comentario...</textarea>
	<div class="buttons">
		<div class="floatR">
			<a class="boton azul" onclick="comentario.nuevo('true')">Comentar</a>
			{*<a onclick="comentario.preview('body_comm','new')" class="boto gris" style="padding: 6px 8px;"><span class="i oji"></span></a>*}				
		</div>
	</div>
</div>
