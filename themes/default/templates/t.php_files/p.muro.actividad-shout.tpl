<div class="actiLista">
	{if $tsActividad.likes || $tsActividad.favoritos || $tsActividad.comentarios || $tsActividad.compartir}
		{foreach from=$tsActividad.likes item=c}
			<div class="zebrac">
				<span class="i likeli"></span><img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.user_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/> a @<a href="{$tsConfig.url}/perfil/{$c.user_name}">{$c.user_name}</a> le gust&oacute; {$c.like_fecha|hace}
			</div>	
		{/foreach}
		{foreach from=$tsActividad.favoritos item=c}
			<div class="zebrac">
				<span class="i favori"></span><img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.fuser_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/> @<a href="{$tsConfig.url}/perfil/{$c.user_name}">{$c.user_name}</a> lo agreg&oacute; a favoritos {$c.favo_fecha|hace}
			</div>	
		{/foreach}
		{foreach from=$tsActividad.comentarios item=c}
			<div class="zebrac">
				<span class="i comenta"></span><img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.c_user}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/> @<a href="{$tsConfig.url}/perfil/{$c.user_name}">{$c.user_name}</a> coment&oacute; {$c.c_date|hace}
			</div>	
		{/foreach}	
		{foreach from=$tsActividad.compartir item=c}
			<div class="zebrac">
				<span class="i repost"></span><img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.cuser_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/> @<a href="{$tsConfig.url}/perfil/{$c.user_name}">{$c.user_name}</a> hizo reshout {$c.compa_fecha|hace}
			</div>	
		{/foreach}	
	{else}
		<div class="nada-gris">No hay actividad en este shout</div>
	{/if}		
</div>