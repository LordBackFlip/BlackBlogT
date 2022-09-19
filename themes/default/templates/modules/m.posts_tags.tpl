<div class="tagbox">
	<div class="fortags">
		<div class="letres">Tags:</div>
		{foreach from=$tsPost.post_tags item=tag key=i}											  
			{if $i>0}<span>|</span>{/if}<a rel="tag" href="{$tsConfig.url}/buscar/posts/?q={$tag}&type=tags">{$tag}</a>
		{/foreach}
	</div>							
</div>	

