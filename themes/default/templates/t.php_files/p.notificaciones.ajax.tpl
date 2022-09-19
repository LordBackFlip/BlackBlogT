{if $tsData}
	{foreach from=$tsData item=noti}
		<div id="notu">			
			<a href="{$noti.link}" title="{$noti.ltit}" {if $noti.unread > 0}id="kill"{/if}>			
				{if $noti.style == 'medal'}
					<img title="{$noti.user}" src="{$tsConfig.tema.t_url}/i/notificacion_medalla.jpg"/>			
				{else}			
					<img title="{$noti.user}" src="{$tsConfig.url}/files/avatar/{$noti.avatar}?{$smarty.now}"/>
				{/if}
				<span id="aces" class="toup-{$noti.style}"></span>
				<h2>{if $noti.total == 1}<strong>{$noti.user} </strong>{/if}{$noti.text} <strong>{$noti.ltext}</strong></h2>
			</a>			
		</div>	
	{/foreach}
{else}
    <div class="errr">No hay notificaciones</div>
{/if}