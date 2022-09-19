{include file='sections/main_header.tpl'}
<div class="tposts">
	<div class="izquierda" style="margin-bottom: 15px;">
		{if $tsAction == 'posts'}
			{include file='modules/m.top_posts.tpl'}
		{elseif $tsAction == 'usuarios'}
			{include file='modules/m.top_users.tpl'}
			
			
		{elseif $tsAction == 'comunidades'}
			{include file='modules/m.top_comunidades.tpl'}
		{elseif $tsAction == 'temas'}
			{include file='modules/m.top_temas.tpl'}		
		{/if}
	</div>
	<div class="derecha">
		{include file='modules/m.top_sidebar.tpl'}
	</div>	
</div>	
{include file='sections/main_footer.tpl'}