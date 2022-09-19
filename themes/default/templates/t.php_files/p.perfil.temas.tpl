1:
<div id="perfil_temas" status="activo">
    <div class="widget w-comunidades clearfix">
		<div class="titular">
			<h2>&Uacute;ltimos temas creados</h2>	
		</div>				
        {if $tsTemas.data}
			<div id="comuss">
			{foreach from=$tsTemas.data item=c}
				<div class="nurmus">
					<i class="com_icon {$c.c_seo}"></i>
					<div class="sumyes">						
						<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|limit:30} &raquo; </a><a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/{$c.t_id}/{$c.t_titulo|seo}.html"><strong>{$c.t_titulo|limit:40}</strong></a>
						<p>{$c.c_html|limit:70}</p>
					</div>
					<div class="ultuses"><strong>{$c.t_respuestas|number_format:0:",":"."}</strong> Respuestas</div>
				</div>
            {/foreach}
			</div>
        {else}
			<div class="nada-gris" style="margin:5px 0 0 0;">{$tsUsername} no a creado temas en ninguna comunidad</div>
        {/if}		
    </div>
</div>