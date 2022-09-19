{include file='sections/main_header.tpl'}
{if $tsAction != 'chat'}
<div id="bgproto">
	<div id="protoi">
		{if $tsAction == 'ayuda'}
			<div class="emptyData">Hola <u>{$tsUser->nick}</u>, S&iacute; necesitas ayuda, por favor cont&aacute;ctanos a trav&eacute;s del siguiente <a href="{$tsConfig.url}/pages/contacto/">formulario</a>.</div>
		{elseif $tsAction == 'chat'}
			{include file='modules/m.pages_chat.tpl'}
		{elseif $tsAction == 'protocolo'}
			{include file='modules/m.pages_protocolo.tpl'}
		{elseif $tsAction == 'terminos-y-condiciones'}
			{include file='modules/m.pages_terminos.tpl'}
		{elseif $tsAction == 'privacidad'}
			{include file='modules/m.pages_privacidad.tpl'}
		{elseif $tsAction == 'dmca'}
			{include file='modules/m.pages_dmca.tpl'}
		{/if}
	</div>
	<div id="protod">
		<div class="list">
			<ul>
				<li><a {if $tsAction == 'protocolo'}class="active"{/if} href="/pages/protocolo/">Protocolo</a></li>
				<li><a {if $tsAction == 'terminos-y-condiciones'}class="active"{/if} href="/pages/terminos-y-condiciones/">Términos y condiciones</a></li>		
				<li><a {if $tsAction == 'privacidad'}class="active"{/if} href="/pages/privacidad/">Privacidad de datos</a></li>
			</ul>
		</div>
	</div>	
</div>
{else}
	{include file='modules/m.pages_chat.tpl'}
{/if}
{include file='sections/main_footer.tpl'}