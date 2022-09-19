{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.js}/admin.js"></script>
{*
{if $tsUser->uid == 1}
*}
<div id="borradores" class="bgadm">
	<div class="clearfix">
		<div class="left">
			<div class="boxy">
				<div class="boxy-title">
					<h3>Men&uacute;</h3>
					<span></span>
				</div>
				<div class="boxy-content" id="admin_menu">
					{include file='admin_mods/m.admin_sidemenu.tpl'}
				</div>
			</div>
		</div>
		<div class="right">
			<div class="boxy" id="admin_panel">
				{if $tsAction == ''}
					{include file='admin_mods/m.admin_welcome.tpl'}
				{elseif $tsAction == 'creditos'}
					{include file='admin_mods/m.admin_creditos.tpl'}
				{elseif $tsAction == 'configs'}								
					{include file='admin_mods/m.admin_configs.tpl'}
				{elseif $tsAction == 'temas'}
					{include file='admin_mods/m.admin_temas.tpl'}
				{elseif $tsAction == 'news'}
					{include file='admin_mods/m.admin_noticias.tpl'}
				{elseif $tsAction == 'ads'}
					{include file='admin_mods/m.admin_publicidad.tpl'}
				{elseif $tsAction == 'medals'}
					{include file='admin_mods/m.admin_medallas.tpl'}
				{elseif $tsAction == 'stats'}
					{include file='admin_mods/m.admin_stats.tpl'}
				{elseif $tsAction == 'posts'}
					{include file='admin_mods/m.admin_posts.tpl'}
				{elseif $tsAction == 'comunidades'}
					{include file='admin_mods/m.admin_comunidades.tpl'}					
				{elseif $tsAction == 'fotos'}
					{include file='admin_mods/m.admin_fotos.tpl'}
				{elseif $tsAction == 'afs'}
					{include file='admin_mods/m.admin_afiliados.tpl'}
				{elseif $tsAction == 'pconfigs'}
					{include file='admin_mods/m.admin_posts_configs.tpl'}
				{elseif $tsAction == 'cats'}
					{include file='admin_mods/m.admin_cats.tpl'}
				{elseif $tsAction == 'users'}
					{include file='admin_mods/m.admin_users.tpl'}
				{elseif $tsAction == 'sesiones'}
					{include file='admin_mods/m.admin_sesiones.tpl'}
				{elseif $tsAction == 'nicks'}
					{include file='admin_mods/m.admin_nicks.tpl'}
				{elseif $tsAction == 'blacklist'}
					{include file='admin_mods/m.admin_blacklist.tpl'}
				{elseif $tsAction == 'badwords'}
					{include file='admin_mods/m.admin_badwords.tpl'}
				{elseif $tsAction == 'rangos'}
					{include file='admin_mods/m.admin_rangos.tpl'}
				{elseif $tsAction == 'emoticones'}
                    {include file='admin_mods/m.admin_emoticones.tpl'}
				{/if}
			</div>
		</div>
	</div>
</div>
{*
{else}
	<div class="nada-gris" style="margin: 10px;">Ve a joder a la perra de tu madre</div>
{/if}
*}
<div style="clear:both"></div>
{include file='sections/main_footer.tpl'}