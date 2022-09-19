1:
<div id="perfil_comunidades" status="activo">
    <div class="widget w-comunidades clearfix">
		<div class="titular">
			<h2>Comunidades en las que participa {$tsUsername}</h2>	
		</div>				
        {if $tsComunidades.data}
			<div id="comuss">
			{foreach from=$tsComunidades.data item=c}
        		<div class="nucimus">	
					<a class="imds" href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">
						<img src="{$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg"/>
					</a>
					<div class="muycom">
						<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre}</a><br />
						<p><span>{$c.categoria}</span> {$c.c_descripcion|truncate:60}</p>				
					</div>
				</div>	
            {/foreach}
			</div>
        {else}
			<div class="nada-gris" style="margin:5px 0 0 0;">{$tsUsername} no participa en ninguna comunidad</div>
        {/if}		
    </div>
</div>