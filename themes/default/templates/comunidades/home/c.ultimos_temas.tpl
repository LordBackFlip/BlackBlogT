<div class="boxposts">
	<div class="titular">
		<h2>&Uacute;ltimos temas</h2>
		{include file='comunidades/home/c.head_categorias.tpl'}
	</div>
	<section class="listados">
		{if $tsLastTemas.data}
			{foreach from=$tsLastTemas.data item=t}
			<article id="post_{$p.post_id}">
				<i class="com_icon {$t.sub_cat.c_seo}"></i>
				<a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|limit:55}</a>
				<p>En <a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/">{$t.c_nombre}</a> por <a href="{$tsConfig.url}/perfil/{$t.user_name}/">{$t.user_name}</a></p>
			</article>
			{/foreach}
		{else}		
			<div class="nada-gris">No se han creado temas {if $tsAct}en esta categor&iacute;a{else}a&uacute;n{/if}</div>
		{/if}
	</section>
	{if $tsPages.pages > 1}
		<div class="paginar">
			{if $tsPages.prev > 0 && $tsPages.max == false}<a href="pagina.{$tsPages.prev}">Anterior</a>{/if}
			{if $tsPages.next <= $tsPages.pages}<a href="pagina.{$tsPages.next}">Siguiente</a>{/if}
		</div>
	{/if}	
</div>




















{*
<div class="com_home_left">
    {if $tsLastTemas.data}
    <div class="com_list_temas">
        {foreach from=$tsLastTemas.data item=t}
        <div class="com_list_element clearfix" {if $c.c_estado == 1 || $t.t_estado == 1}style="opacity: 0.5;background: #000;" title="La tema ha sido eliminado"{/if}>
        	<i class="com_icon {$t.sub_cat.c_seo}"></i>
            <a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/{$t.t_id}/{$t.t_titulo|seo}.html">{$t.t_titulo|truncate:45}</a>
            <div class="cli_info">En <a href="{$tsConfig.url}/comunidades/{$t.c_nombre_corto}/">{$t.c_nombre}</a> Por <a href="{$tsConfig.url}/perfil/{$t.user_name}/">{$t.user_name}</a></div>
        </div>
        {/foreach}
    </div>
    <div class="com_temas_footer">
    	{if $tsPages.next <= $tsPages.pages || $tsPages.prev > 0}
    	<div class="com_msj_blue clearfix">
        	{if $tsPages.prev > 0 && $tsPages.max == false}<a href="pagina.{$tsPages.prev}" class="floatL">&laquo; Anterior</a>{/if}
            {if $tsPages.next <= $tsPages.pages}<a href="pagina.{$tsPages.next}" class="floatR">Siguiente &raquo;</a>
            {elseif $tsPages.max == true}<a href="pagina.2">Siguiente &raquo;</a>{/if}
        </div>
        {/if}
    </div>
    {else}
    	<div class="com_bigmsj_blue" style="margin-top: 5px;">No se han creado temas {if $tsAct}para esta categor&iacute;a{else}a&uacute;n{/if}</div>
    {/if}
</div>
*}