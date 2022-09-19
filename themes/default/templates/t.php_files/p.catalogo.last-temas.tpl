<div class="cont" id="recargar">
{if $tsLastTemas.data}
	{foreach from=$tsLastTemas.data item=p}
	<div class="list" id="post_{$p.post_id}">
		{if $tsUser->info.user_rango == 1 || $tsUser->info.user_rango == 2}
			<div class="elipost"><a onclick="{if !$p.post_status == 2}mod.posts.borrar({$p.post_id}, 'posts', null);{else}admin.posts.borrar({$p.post_id});{/if} return false;"><span class="i xx"></span></a></div>
		{/if}
		<div class="ifau">	
			<a href="{$tsConfig.url}/perfil/{$p.user_name}"><img alt="autor" src="{$tsConfig.url}/files/avatar/{$p.post_user}_50.jpg"></a>
			<p><a href="{$tsConfig.url}/perfil/{$p.user_name}">@{$p.user_name|truncate:13}</a><span style="color:#{$p.r_color};">{$p.r_name}</span></p>
		</div>
		<div class="lode">		
			{if $p.post_status == 3}<span class="e revision qtip" title="Post en Revision"></span>{elseif $p.post_status == 1}<span class="e denuncias qtip" title="En Revision por Denuncias"></span>{elseif $p.post_status == 2}<span class="e eliminado qtip" title="Post Eliminado"></span>{elseif $p.user_activo == 0}<span class="e desactivado qtip" title="Cuenta Desactivada"></span>{elseif $p.user_baneado == 1}<span class="e desactivado qtip" title="Cuenta Baneada"></span>{elseif $p.post_private}<span class="e privado qtip" title="Post Privado"></span>{/if}
			<a href="{$tsConfig.url}/posts/{$p.c_seo}/" class="k c{$p.post_category}">{$p.c_nombre}</a>
			<h1>{if $p.post_solucionado == -1}<span title="Solucionado" class="ya qtip"></span>{else}<span title="Esperando Solucion" class="noya qtip"></span>{/if}<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|truncate:45}</a></h1>
			<p>
				<span class="i vis"></span><b>Visitas: {$p.post_hits|number_format}</b><span class="i com"></span><b>Comentarios: {$p.post_comments|number_format}</b>
				<strong class="ee s{if $p.post_comments > 10}10{else}{if $p.post_comments == 0}0{elseif $p.post_comments > 0}{$p.post_comments}{/if}{/if}"></strong>
			</p>
		</div>	
	</div>	
	{/foreach}	
{else}
	<div class="nada">No hay ningun temas de soporte publicado</div>
{/if}

{if $tsPages.pages > 0}
	<div class="bosop">
		{if $tsPages.prev > 0 && $tsPages.max == false}
			<a href="#" onclick="last_files('{$tsPages.prev}'); return false" class="floatL ant">Anterior</a>
		{else}	
			<a class="floatL antoff">Anterior</a>
		{/if}
		<span class="contador">
			<b id="c_soporte">Pagina {$tsPages.prev+1} de {$tsPages.pages}</b>
			<img src="{$tsConfig.images}/min-carga.gif" style="margin: 3px 0; display:none" class="floatR" id="com_gif"/>
		</span>
		{if $tsPages.next <= $tsPages.pages }
			<a href="#" onclick="last_files('{$tsPages.next}'); return false" class="floatR sig">Siguiente</a>
		{else}
			<a class="floatR sigoff">Siguiente</a>		
		{/if}
	</div>
{/if}
</div>
