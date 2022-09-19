{if $tsPostsDestacados}
	{foreach from=$tsPostsDestacados key=i item=p}
		<a class="topes" {if $i+1 == 1}style="border-top: 0;"{/if} href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
			{if $p.post_portada}
				<img title="{$p.post_title|limit:20}" src="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P90X70.jpg"/>						
			{else}
				<img title="{$p.post_title|limit:20}" src="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
			{/if}
			<h3>{$p.post_title}</h3>
			<p><span class="toup-user"></span>{$tsUser->getUserName($p.post_user)}</p>
		</a>
	{/foreach}
{else}
	<div class="nada-blanco">No hay posts recomendados</div>
{/if}





















	{*
{if $tsPostsDestacados}
	{foreach from=$tsPostsDestacados key=i item=p}
			<div class="clerela">
				<a class="cates" title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
					{if $p.post_portada}
						<img class="loadimg" data-original="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P90X70.jpg"/>						
					{else}
						<img class="loadimg" data-original="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
					{/if}
				</a>
				<div class="ditip">
					<span>{$p.c_nombre}</span>
					<a title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:55}</a>
				</div>
			</div>
	{/foreach}
{/if}
	*}

{*
{if $tsPage != 'home'}
<script type="text/javascript">
//{literal}
$(document).ready(function(){
	$("img.loadimg").lazyload({
		effect : "fadeIn"
	});
});
//{/literal}
</script>
{/if}
{if $tsPostsDestacados}
	{foreach from=$tsPostsDestacados key=i item=p}
			<div class="clerela">
				<a class="cates" title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
					{if $p.post_portada}
						<img class="loadimg" data-original="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P90X70.jpg"/>						
					{else}
						<img class="loadimg" data-original="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
					{/if}
				</a>
				<div class="ditip">
					<span>{$p.c_nombre}</span>
					<a title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:55}</a>
				</div>
			</div>
	{/foreach}
{else}
	<div class="nada-gris" style="margin-bottom: 10px;">Sin destacados en este periodo</div>
{/if}
*}