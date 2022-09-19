1: 
<div class="item" id="div_cmnt_{$tsComment.0}">
	<a class="nsi" href="{$tsConfig.url}/perfil/{$tsUser->nick}">
		<img src="{$tsConfig.url}/files/avatar/{$tsUser->info.user_id}_50.jpg"/>
	</a>
	<div class="firma">
		<div class="options">
			{if $tsComment.3 == $tsUser->uid}
				<a href="#" onclick="fotos.borrar({$tsComment.0}, 'com'); return false" class="floatR">
					<img title="Borrar Comentario" alt="borrar" src="{$tsConfig.default}/images/borrar.png"/>
				</a>
			{/if}
		</div>
		<div class="info">@<a href="{$tsConfig.url}/fotos/{$tsUser->nick}">{$tsUser->nick}</a><span class="dsee">{$tsComment.2|hace}</span></div>
		<p>{$tsComment.1|nl2br}</p>
	</div>
</div>