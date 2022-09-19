<div class="com_tema_comentarios clearfix">
	<div class="com_box_title clearfix">
		<h2><span id="cbt_val">{$tsTema.t_respuestas|number_format:0:',':'.'}</span> comentarios</h2>
	</div>
    
	<div id="result_answers">
		{include file='t.comus_ajax/c.pages_respuestas.tpl'}		
	</div> 
    {if $tsUser->is_member && $tsCom.es_miembro || $tsCom.mi_rango >= 3 || $tsUser->is_admod}		
		{if $tsTema.t_cerrado == 1 && $tsUser->uid != $tsTema.t_autor}
			<div class="nada-amarillo" style="margin-top: 10px;">El tema est&aacute; cerrado y no se permiten comentarios</div>
		{else}
			{if !$tsTema.t_respuestas && $tsTema.t_cerrado == 0}
				<div class="nada-azul" style="margin-top: 5px;" id="novos">No hay comentarios. ¡S&eacute; el primero!</div>
			{elseif $tsTema.t_cerrado == 1 && $tsUser->uid == $tsTema.t_autor}
				<div class="nada-verde" style="margin-top: 10px;">El tema est&aacute; cerrado pero tu lo creaste y puedes comentar</div>	
			{/if}		
			<div class="ctc_form clearfix">
				<div class="com_bigmsj_red" style="display:none;"></div>
				<div id="procesando"></div>
				<div class="ctcf_avatar">
					<a href="{$tsConfig.url}/perfil/{$tsUser->nick}">
						<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" width="48" height="48" />
					</a>
				</div>
				<div class="ctcf_add_coment floatL clearfix">
					<textarea id="markit_resp" class="autogrow markItUpEditor onblur_effect" placeholder="Escribe un comentario..."></textarea>
					<input type="button" class="boto gris floatR" id="btn_newcom" value="Comentar" onclick="com.add_respuesta({$tsTema.t_id});" />
					<div id="markit_emoticon" class="floatL" style="display:none;margin-left: 5px;margin-top: 8px;">
						{include file='modules/m.global_emoticons.tpl'}
					</div>
				</div>
			</div>
		{/if}
    {elseif !$tsCom.es_miembro || !$tsUser->is_member}
		<div class="nada-amarillo">Tienes que ser miembro para responder en este tema</div>
	{elseif $tsCom.mi_rango < 3}
		<div class="nada-amarillo">Tu rango no te permite realizar comentarios en esta comunidad</div>
    {/if}
</div>