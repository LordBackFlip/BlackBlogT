{if $tsTags}
	{foreach from=$tsTags item=t key=i}
		{if $i < 15}
			<a class="tag-size{$t.size}" href="{$tsConfig.url}/buscar/posts/?q={$t.name}&type=tags">{$t.name}</a>
		{/if}
	{/foreach}
{else}
	<div class="nada-gris">No hay tags</div>
{/if}			