1:
{if $tsMuro.total}<div id="total_pubs" val="{$tsMuro.total}"></div>{/if}
{if $tsFiltro == 3 && $tsType == news}
	{include file='modules/m.perfil_muro_story_posts.tpl'}
{else}
	{include file='modules/m.perfil_muro_story.tpl'}
{/if}