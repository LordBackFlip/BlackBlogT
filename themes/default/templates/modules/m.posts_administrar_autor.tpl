{if $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
	{if  $tsAutor.user_id != $tsUser->uid}
	<div class="boxposts separa">
		<div class="titulaw">
			<h2>Administrar</h2>
		</div>	
		<div class="admitool">
			<a href="{$tsConfig.url}/moderacion/buscador/1/1/{$tsPost.post_ip}" target="_blank" class="bon verde"  style="margin-top: 5px;"><span class="toup-location-pin"></span>{$tsPost.post_ip}</a>
			{if $tsUser->is_admod == 1}
				<a href="{$tsConfig.url}/admin/users?act=show&amp;uid={$tsAutor.user_id}" class="bon azul"><span class="toup-user"></span>Editar usuario</a>
			{/if}
			{if $tsAutor.user_id != $tsUser->uid}
				<a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'aviso', false); return false;" class="bon azul"><span class="toup-warning"></span>Enviar aviso</a>
			{/if}
			{if $tsAutor.user_id != $tsUser->uid && $tsUser->is_admod || $tsUser->permisos.modu || $tsUser->permisos.mosu}
				{if $tsAutor.user_baneado}
					{if $tsUser->is_admod || $tsUser->permisos.modu}
						<a href="#" onclick="mod.reboot({$tsAutor.user_id}, 'users', 'unban', false); $(this).remove(); return false;" class="bon azul"><span class="toup-blocked"></span>Desuspender usuario</a>
					{/if}
				{else}
					{if $tsUser->is_admod || $tsUser->permisos.mosu}
						<a href="#" onclick="mod.users.action({$tsAutor.user_id}, 'ban', false); $(this).remove(); return false;" class="bon gris"  style="margin-bottom: 0;"><span class="toup-blocked"></span>Suspender usuario</a>
					{/if}
				{/if}
			{/if}
		</div>
	</div>
	{/if}
{/if}