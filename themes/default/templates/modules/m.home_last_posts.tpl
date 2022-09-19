<div class="envope">
	{if $tsPostsStickys}
		{foreach from=$tsPostsStickys item=p}
		<div class="boxtema" id="staff">
			<a class="portahome" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
				{if $p.post_portada}
					<img class="loadimg" title="{$p.post_title|limit:20}" data-original="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P90X70.jpg"/>						
				{else}
					<img class="loadimg" title="{$p.post_title|limit:20}" data-original="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
				{/if}				
			</a>
			<h3><span id="notar">Staff</span><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title}</a></h3>
			<div class="contadores">
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/"><span class="toup-{$p.c_seo}"></span>{$p.c_nombre}</a>
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" style="text-transform: lowercase;"><span class="toup-clock"></span>{$p.post_date|hace}</a>
			</div>
		</div>
		{/foreach}	
	{/if}
	
	{if $tsPosts}
		{foreach from=$tsPosts item=p}
			<div class="boxtema">
				<a class="portahome" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
					{if $p.post_portada}
						<img class="loadimg" title="{$p.post_title|limit:20}" data-original="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P90X70.jpg"/>						
					{else}
						<img class="loadimg" title="{$p.post_title|limit:20}" data-original="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
					{/if}				
				</a>
				<h3><a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{if !$p.visto}<span id="pnuevo">NUEVO</span>{/if}{$p.post_title}</a></h3>
				<div class="contadores2">
                    <a href="{$tsConfig.url}/perfil/{$p.user_name}">{$p.user_name}</a>
<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html" style="text-transform: lowercase;font-weight: 100;color: #acacac;"><span class="toup-clock"></span>{$p.post_date|hace}</a>
				</div>
				<div class="contadores">
					<a href="{$tsConfig.url}/posts/{$p.c_seo}/"><span class="toup-{$p.c_seo}"></span>{$p.c_nombre}</a>
					<a href="{$tsConfig.url}/posts/{$c.c_seo}/{$c.post_id}/{$c.post_title|seo}.html#comentarios-abajo"><span class="toup-comment2"></span>{$p.post_comments}</a>
				</div>
			</div>
		{/foreach}
	{else}
		{if !$tsPostsStickys}<div class="nada-gris">No hay posts {if $tsCat}en esta categor&iacute;a{/if}</div>{/if}
	{/if}
	
	{include file='modules/m.home_posts_paginas.tpl'}
	
	{*
	{if $tsPages.pages > 1}
		<div class="paginar">
			{if $tsPages.prev > 0 && $tsPages.max == false}<a href="pagina{$tsPages.prev}">Anterior</a>{/if}
			{if $tsPages.next <= $tsPages.pages}<a href="pagina{$tsPages.next}">Siguiente</a>{/if}
		</div>
	{/if}
	*}
</div>

{*
{if $tsUser->is_member && $tsUser->is_admod}
<script type="text/javascript" src="{$tsConfig.default}/js/admin.js"></script>
{/if}
*}

















{*
<div class="boxposts">
	<div class="titular">
		<h2>Recientes</h2>
	</div>
	<section class="listados">
		{if $tsPostsStickys}
			{foreach from=$tsPostsStickys item=p}
			<article {if $p.post_sponsored == 1}class="patroci"{/if} id="post_{$p.post_id}">
				<span class="i nota"></span>
				<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}"/>				
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:40}</a>
				{if $tsUser->is_member && $tsUser->is_admod}
					<span onclick="admin.posts.borrar('{$p.post_id}','1'); return false" class="peli"></span>
				{/if}
				{if $p.post_private}
				<span class="privado"></span>
				{/if}				
			</article>
			{/foreach}
		{/if}
		{if $tsPosts}
			{foreach from=$tsPosts item=p}
			<article id="post_{$p.post_id}">
				<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}" />
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:40}</a>
				{if $tsUser->is_member && $tsUser->is_admod}
					<span onclick="admin.posts.borrar('{$p.post_id}','1'); return false" class="peli"></span>
				{/if}
				{if $p.post_private}
				<span class="privado"></span>
				{/if}
			</article>
			{/foreach}
		{else}
			{if !$tsPostsStickys}<div class="nada-gris">No hay posts {if $tsCat}en esta categor&iacute;a{/if}</div>{/if}
		{/if}
	</section>
	{if $tsPages.pages > 1}
		<div class="paginar">
			{if $tsPages.prev > 0 && $tsPages.max == false}<a href="pagina{$tsPages.prev}">Anterior</a>{/if}
			{if $tsPages.next <= $tsPages.pages}<a href="pagina{$tsPages.next}">Siguiente</a>{/if}
		</div>
	{/if}	
</div>
*}


{*
<!--				
{if $p.post_status == 3}
	El post est&aacute; en revisi&oacute;n
{elseif $p.post_status == 1}
	El post se encuentra en revisi&oacute;n por acumulaci&oacute;n de denuncias
{elseif $p.post_status == 2}
	El post est&aacute; eliminado
{elseif $p.user_activo == 0}
	La cuenta del usuario est&aacute; desactivada
{/if}  				
				<div class="admod">
					<span class="ad "></span>
				</div>
-->		
*}		