{if $tsComments}	
	{foreach from=$tsComments item=c key=i}
		<div class="ccom" {if $i+1 == 1}style="border-top: 0;"{/if}>			
			<a class="hulk" href="{$tsConfig.url}/posts/{$c.c_seo}/{$c.post_id}/{$c.post_title|seo}.html#comentarios-abajo">
				<img title="{$c.post_title|limit:20}" src="{$tsConfig.url}/files/avatar/{$tsUser->getUserID($c.user_name)}_50.jpg?{$smarty.now}"/>				
				<h3>{$c.post_title}</h3>
			</a>
		</div>
	{/foreach}
{else}
	<div class="nada-blanco">No hay comentarios</div>
{/if}