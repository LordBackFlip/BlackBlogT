<div class="boxxd">
	<div class="titular">
		<h2>&Uacute;ltimas notificaciones</h2>
		<a class="botob">{$tsData.total}</a>
	</div>
	{if $tsData.data}
	{foreach from=$tsData.data item=noti}
		<div class="fidss {if $noti.unread > 0}unread{/if}">
			<div class="navf">
				<a href="{$tsConfig.url}/perfil/{$noti.user}">					
					{if $noti.avatar != 0}
						<img height="32" width="32" src="{$tsConfig.url}/files/avatar/{$noti.avatar}?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
					{else}
						<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
					{/if}
				</a>
			</div>
			<div class="notification-info">
				<span class="noses">
					{if $noti.total == 1}
						{if $noti.user}
							@<a href="{$tsConfig.url}/perfil/{$noti.user}">{$noti.user}</a>
						{else}
							<a href="{$tsConfig.url}">Staff</a>
						{/if}
					{/if} 
					<span title="{$noti.date|fecha}" class="time">{$noti.date|fecha}</span>
				</span>
				<span class="action">
					<span class="monac_icons ma_{$noti.style}"></span>{$noti.text}
					<a href="{$noti.link}">{$noti.ltext}</a>
				</span>
			</div>
		</div>
	{/foreach}
	{else}
		<div class="nada-gris">No tienes notificaciones</div>
	{/if}
</div>