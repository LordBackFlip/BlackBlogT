<div id="nuevoss_{$c.cid}"></div>
<div class="resp" id="{$c.cid}" style="display: none;">
	<div id="restoup">
		<div class="answerInfo">
			<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg"/>
		</div>

			<div class="Container">
				<div class="error"></div>
				<textarea id="bodys_comm_{$c.cid}" class="onblur_effect autogrow" tabindex="1" title="Escribir una respuesta..." onfocus="onfocus_input(this)" onblur="onblur_input(this)"></textarea>
				<div class="buttons">
					<div class="floatR">
						<input type="hidden" id="ausers_post" value="{$tsPost.post_user}"/>
						<input type="hidden" id="respuesta_{$c.cid}" name="respuesta" value="{$c.cid}"/>
						<input type="hidden" id="comm_user_{$c.cid}" name="comm_user" value="{$c.c_user}"/>
						<input type="button" onclick="comentario.nuevos('true', '', {$c.cid})" class="boton azul" value="Responder" tabindex="3" id="btnssComment"/>
					</div>
				</div>
			</div>
	</div>						
</div>