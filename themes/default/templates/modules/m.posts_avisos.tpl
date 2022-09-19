{if $tsUser->is_member}
	{if $tsPost.block > 0}
		<div class="nada-amarillo" style="margin: 10px 0;">
			&iquest;Te has portado mal? {$tsPost.user_name} te ha bloqueado y no podr&aacute;s comentar sus post.
		</div>
	{else}
		{if $tsPost.post_block_comments == 1}
			{if $tsUser->is_admod}
				<div id="no-comments" class="nada-verde" style="margin: 10px 0;">El post se encuentra cerrado, pero puedes comentar ya que formas parte del staff.</div>
				<div class="miComentario">
					{include file='modules/m.posts_comments_form.tpl'}
				</div>
			{else}
				<div id="no-comments" class="nada-amarillo" style="margin: 10px 0;">El post se encuentra cerrado y no se permiten comentarios.</div>
			{/if}
		{else}
			{if !$tsPost.post_comments}
				<div id="no-comments" class="nada-amarillo" style="margin: 10px 0;">Este post no tiene comentarios, S&eacute; el primero!</div>
			{/if}
			<div class="miComentario">
				{include file='modules/m.posts_comments_form.tpl'}
			</div>		
			<!--Eres usuario y no estas bloqueado por el autor del posts ni los comentarios estan cerrados-->
		{/if}
		
		
	{/if}
{else}
	<div class="nada-amarillo" style="margin: 10px 0;">
		Para poder comentar necesitas estar <a href="{$tsConfig.url}/registro/">Registrado.</a> O.. ya tienes usuario? <a href="{$tsConfig.url}/login?redirect=%2F">Logueate!</a>
	</div>
{/if}
<div id="avicome" class="nada-amarillo">Tu comentario fue agreado correctamente</div>