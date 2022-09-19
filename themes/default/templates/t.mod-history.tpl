{include file='sections/main_header.tpl'}

	<div class="titular" style="margin: 10px;">
		<h2>Historial de moderaci&oacute;n</h2>
	</div>
{if !$tsAction || $tsAction == 'posts'}
	{if $tsHistory}
		<div class="tihisto">
			<span class="alpha">Post</span>
			<span>Acci&oacute;n</span>
			<span>Moderador</span>
			<span class="etha">Causa</span>
		</div>
		<div class="boxhi">
			{foreach from=$tsHistory item=h}
				<div class="mihid">
					<div class="unoh">
						<b>{$h.post_title}</b>
						<p>Por <a href="{$tsConfig.url}/perfil/{$h.user_name}">{$h.user_name}</a></p>
					</div>
					<div class="dosh">
						{if $h.action == 1}
							<span class="verde">Editado</span>
						{elseif $h.action == 2}
							<span class="rojo">Eliminado</span>
						{else}
							<span class="morado">Revisi&oacute;n</span>
						{/if}
					</div>
					<div class="tresh"><a href="{$tsConfig.url}/perfil/{$h.mod_name}">{$h.mod_name}</a></div>
					<div class="cuatroh"><span>{if $h.reason == 'undefined'}Indefinida{else}{$h.reason|limit:40}{/if}</span></div>
				</div>					
			{/foreach}
		</div>
	{else}
		<div class="nada-gris" style="margin: 10px;">No hay historial de moderaci&oacute;n de posts</div>
	{/if}
{elseif $tsAction == 'fotos'}
	{if $tsHistory}
		<div class="tihisto">
			<span class="alpha">Post</span>
			<span>Acci&oacute;n</span>
			<span>Moderador</span>
			<span class="etha">Causa</span>
		</div>
		<div class="boxhi">
			{foreach from=$tsHistory item=h}
				<div class="mihid">
					<div class="unoh">
						<b>{$h.post_title}</b>
						<p>Por <a href="{$tsConfig.url}/perfil/{$h.user_name}">{$h.user_name}</a></p>
					</div>
					<div class="dosh">
						{if $h.action == 1}
							<span class="verde">Editado</span>
						{elseif $h.action == 2}
							<span class="rojo">Eliminado</span>
						{else}
							<span class="morado">Revisi&oacute;n</span>
						{/if}
					</div>
					<div class="tresh"><a href="{$tsConfig.url}/perfil/{$h.mod_name}">{$h.mod_name}</a></div>
					<div class="cuatroh"><span>{if $h.reason == 'undefined'}Indefinida{else}{$h.reason|limit:40}{/if}</span></div>
				</div>					
			{/foreach}
		</div>
	{else}
		<div class="nada-gris" style="margin: 10px;">No hay historial de moderaci&oacute;n de fotos</div>
	{/if}
{/if}
{include file='sections/main_footer.tpl'}