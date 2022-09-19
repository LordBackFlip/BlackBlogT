1:
{literal}
<script type="text/javascript">
$(document).ready(function(){
	$("img.loadimg").lazyload({
		effect : "fadeIn"
	});
});
</script>
{/literal}
<div id="perfil_posts" status="activo">
    <div class="widget w-posts clearfix">
		<div class="titular">
			<h2>&Uacute;ltimos posts creados</h2>	
		</div>	
        {if $tsGeneral.posts}
        <ul class="ultimos">
            {foreach from=$tsGeneral.posts item=p key=i}
			<div class="linpo" {if $i==14}style="border-bottom:0;"{/if}>
				<a class="imgporta" title="{$p.post_title}" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
					{if $p.post_portada}
						<img class="loadimg" data-original="{$tsConfig.url}/files/portadas/toup{$p.post_portada}P90X70.jpg"/>
					{else}	
						<img class="loadimg" data-original="{$tsConfig.tema.t_url}/i/cat/{$p.c_seo}.jpg"/>
					{/if}				
				</a>
				<a class="datopo" title="{$p.post_title}" target="_self" href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">
					<h2>{$p.post_title|limit:45}</h2><span>{$p.post_puntos|number_format:0:",":"."}</span>
					<p>{$p.contenido|limit:230}</p>
				</a>
			</div>			
            {/foreach}
            {if $tsGeneral.total >= 15}
			<h3 id="last-activity-view-more">
                <a href="{$tsConfig.url}/buscar/posts/?autor={$tsGeneral.username}">Ver m&aacute;s</a>
            </h3>
            {/if}
        </ul>
        {else}
			<div class="nada-gris" style="margin:5px 0 0 0;">No hay posts</div>
        {/if}
    </div>
</div>