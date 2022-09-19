{if $tsPost.post_user == $tsUser->uid && $tsUser->is_admod == 0 && $tsUser->permisos.most == false && $tsUser->permisos.moayca == false && $tsUser->permisos.moo == false && $tsUser->permisos.moep ==  false && $tsUser->permisos.moedpo == false}
<div class="boxposts separa">
	<div class="titulaw">
		<h2>Herramientas</h2>
	</div>
	<div class="minisb">
        <a title="Borrar Post" onclick="borrar_post(); return false;" href="" class="bon azul"><span class="toup-trash"></span>Borrar</a>                                
		<a title="Editar Post" onclick="location.href='{$tsConfig.url}/posts/editar/{$tsPost.post_id}'; return false" href="" class="bon azul"><span class="toup-create"></span>Editar</a>
	</div>
</div>	
{elseif ($tsUser->is_admod && $tsPost.post_status == 0) || $tsUser->permisos.most || $tsUser->permisos.moayca || $tsUser->permisos.moop || $tsUser->permisos.moep || $tsUser->permisos.moedpo}
<div class="boxposts separa">
	<div class="titulaw">
		<h2>Herramientas</h2>
	</div>
	<div class="admitool">
		<div class="minisb">
		{if $tsUser->is_admod || $tsUser->permisos.moep || $tsAutor.user_id == $tsUser->uid}
			<a href="#" onclick="{if $tsAutor.user_id != $tsUser->uid}mod.posts.borrar({$tsPost.post_id}, 'posts', null);{else}borrar_post();{/if} return false;" class="bon azul" style="
    margin-right: 10px;
"><span class="toup-trash"></span>Borrar</a>
		{/if}		
		{if $tsUser->is_admod || $tsUser->permisos.moedpo || $tsAutor.user_id == $tsUser->uid}
			<a href="{$tsConfig.url}/posts/editar/{$tsPost.post_id}" class="bon azul"><span class="toup-create"></span>Editar</a>
		{/if}
		</div>	
		{if $tsUser->is_admod || $tsUser->permisos.most}
			<a href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'sticky', false); if($(this).text() == 'Poner Sticky') $(this).text('Quitar Sticky'); else $(this).text('Poner Sticky'); return false;" class="bon verde">{if $tsPost.post_sticky == 1}Quitar{else}Poner{/if} Sticky</a>
		{/if}
		{if $tsUser->is_admod || $tsUser->permisos.moayca}
			<a href="#" onclick="mod.reboot({$tsPost.post_id}, 'posts', 'openclosed', false); if($(this).text() == 'Cerrar Post') $(this).text('Abrir Post'); else $(this).text('Cerrar Post'); return false;" class="bon gris" style="margin-bottom: 0;">{if $tsPost.post_block_comments == 1}Abrir{else}Cerrar{/if} comentarios</a>
		{/if}
	</div>
</div>	
{/if}
							      