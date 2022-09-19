<main class="boxpc">
	<h1>{$tsPost.post_title}</h1>
	<div class="contenido">{$tsPost.post_body}</div>	
	<div id="boxsocial">
		<a id="cfacebook" onclick="RedSocial('https://www.facebook.com/sharer/sharer.php?u={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html');" title="Compartir en Facebook"><span class="ifacebook">Compartir en Facebook</span></a>
		<a id="ctwitter" onclick="RedSocial('https://twitter.com/intent/tweet?text=&amp;url={$tsConfig.url}/posts/{$tsPost.categoria.c_seo}/{$tsPost.post_id}/{$tsPost.post_title|seo}.html');" title="Compartir en Twitter"><span class="itwitter">Compartir en Twitter</span></a>
	</div>
</main>
{if $tsPost.user_firma}
	<div id="firmas">{$tsPost.user_firma}</div>
{/if}
{include file='modules/m.posts_tags.tpl'}
{include file='modules/m.posts_metadata.tpl'}