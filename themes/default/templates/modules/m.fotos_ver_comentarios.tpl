<div class="bajo">
	<div class="comments">
		<div class="titular">
			<h2><span id="ncomments">{$tsFoto.f_comments}</span> Comentarios</h2>
		</div>
		<div id="mensajes">
			{if $tsFComments}
				{foreach from=$tsFComments item=c}
					<div class="item" id="div_cmnt_{$c.cid}">
						<a class="nsi" href="{$tsConfig.url}/perfil/{$c.user_name}">
							<img src="{$tsConfig.url}/files/avatar/{$c.c_user}_50.jpg?{$smarty.now|date_format:"%Y%m%d%H%M%S"}"/>
						</a>
						<div class="firma">
							<div class="options">
								{if $tsFoto.f_user == $tsUser->info.user_id || $tsUser->is_admod || $tsUser->permisos.moecf}
									<a href="#" onclick="fotos.borrar({$c.cid}, 'com'); return false" class="floatR">
										<img title="Borrar Comentario" alt="borrar" src="{$tsConfig.default}/images/borrar.png"/>
									</a>
								{/if}
							</div>
							<div class="info">@<a href="{$tsConfig.url}/fotos/{$c.user_name}">{$c.user_name}</a><span class="dsee">{$c.c_date|hace}</span></div>
							<p>{$c.c_body|nl2br}</p>
						</div>
					</div>
				{/foreach}
			{elseif $tsFoto.f_closed == 0 && ($tsUser->is_admod || $tsUser->permisos.gopcf)}
				<div id="nccom" class="nada-amarillo" style="margin-bottom: 10px;">Esta foto no tiene comentarios, Se el primero!</div>
			{/if}
		</div>
		{if $tsUser->is_admod == 0 && $tsUser->permisos.gopcf == false}
			<div class="nada-amarillo">No tienes permiso para comentar.</div>
		{elseif $tsFoto.f_closed == 1}
			<div class="nada-amarillo">La foto se encuentra cerrada y no se permiten comentarios.</div>
		{elseif $tsUser->is_member}
			<div id="messs"></div>
			<div class="form">
				<div class="avatar-box">
					<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" width="46" height="46"/>
				</div>
				<form method="post" action="" name="firmar">
					<div class="error"></div>
					<textarea name="mensaje" id="mensaje" class="onblur_effect autorow" title="Escribe un comentario" onblur="onblur_input(this)" onfocus="onfocus_input(this)">Escribe un comentario</textarea>
					<input type="hidden" name="auser_post" value="{$tsFoto.f_user}" />
					<input type="button" id="btnComment" class="boto gris floatR" value="Comentar" onclick="fotos.comentar()" />
				</form>
			</div>
		{else}
			<div class="nada-amarillo">Para poder comentar necesitas estar <a onclick="registro_load_form(); return false" href="">Registrado.</a> O.. ya tienes usuario? <a onclick="open_login_box('open')" href="#">Logueate!</a></div>
		{/if}
	</div>
</div>