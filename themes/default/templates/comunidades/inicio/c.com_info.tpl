<div class="com_loc_global">
	<ul class="clearfix">
    	<li><a href="{$tsConfig.url}/comunidades/">Comunidades</a></li>
        <li><a href="{$tsConfig.url}/comunidades/home/{$tsCom.cat.c_seo}/">{$tsCom.cat.c_nombre}</a></li>
        {if $tsTema.t_id > 0}
			<li><a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/">{$tsCom.c_nombre}</a></li>
			<li>{$tsTema.t_titulo|limit:30}</li>
        {else}
			<li>{$tsCom.c_nombre}</li>
        {/if}
    </ul>
</div>
{if $tsCom.c_estado == 1}<div class="com_bigmsj_red">La comunidad est&aacute; suspendida, para eliminarla permanentemente ve a la <a href="{$tsConfig.url}/admin/comunidades">administraci&oacute;n</a></div>{/if}
<div class="ver_com_info" style="display: none;">
	<div class="vci_left floatL">
    	<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/" title="Ir a la comunidad">
			<img src="{$tsConfig.url}/files/uploads/c_{$tsCom.c_id}.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" alt="{$tsCom.c_nombre}" width="32" height="32" />
		</a>
    </div>
    <div class="vci_right floatL">
    	<h1><a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/" title="Ir a la comunidad">{$tsCom.c_nombre}</a></h1>
    </div>
    <a href="#" onclick="$('.ver_com_info').toggle();return false;"><i class="com_icon icon_expand"></i></a>
    <div class="clearfix"></div>	
</div>
<div class="ver_com_info">
	<div class="vci_left floatL">
    	<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/" title="Ir a la comunidad">
			<img src="{$tsConfig.url}/files/uploads/c_{$tsCom.c_id}.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" alt="{$tsCom.c_nombre}" width="120" height="120" />
		</a>
    </div>
    <div class="vci_right floatL">
    	<h1><a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/" title="Ir a la comunidad">{$tsCom.c_nombre}</a></h1>
        <div class="vci_desc">{$tsCom.c_descripcion}</div>
        <a href="#" onclick="com.ver_mas();return false;" id="view_more">Ver m&aacute;s</a>
        <div class="vci_detalles" id="show_more">
        	<ul>
        		<li><strong>Categor&iacute;a:</strong> <a href="{$tsConfig.url}/comunidades/home/{$tsCom.cat.c_seo}/">{$tsCom.cat.c_nombre}</a> &raquo; {$tsCom.cat.s_nombre}</li>
                <li><strong>Creado:</strong> por <a href="{$tsConfig.url}/perfil/{$tsCom.user_name}/">{$tsCom.user_name}</a> {$tsCom.c_fecha|hace}</li>
                <li><strong>Tipo:</strong> {if $tsCom.c_acceso == 1}Todos pueden ver la comunidad{else}S&oacute;lo usuarios registrados pueden ver la comunidad.{/if}</li>
                <li><strong>Tipo de validaci&oacute;n:</strong> Los nuevos miembros son aceptados automaticamente<br />
				Con el rango <strong>{if $tsCom.c_permisos == 1}Visitante{elseif $tsCom.c_permisos == 2}Comentador{else}Posteador{/if}</strong></li>
           </ul>
        </div>
        <div class="clearfix vci_bottom">
        	<div class="floatL">
            	{if $tsCom.c_autor == $tsUser->uid || $tsUser->is_admod}
					<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/editar/" class="boto gris"><img alt="Editar" src="{$tsConfig.tema.t_url}/i/editar.png">Editar</a>
				{/if}
                <a onclick="{if $tsUser->is_member}com.unirme(){else}registro_load_form(){/if};" class="action_comunidad boto gris" style="{if $tsCom.es_miembro}display:none;{/if}">Unirme</a>
                {if $tsUser->is_member}
                <a onclick="com.abandonar();" class="action_comunidad boto gris" style="{if !$tsCom.es_miembro}display:none;{/if}">Abandonar</a>
                <a href="#" class="boto gris" id="follow_com" {if $tsCom.es_seguidor}style="display:none"{/if} onclick="com.seguir_com();return false;"><span class="i oji"></span>Seguir</a>
                <a href="#" class="boto verde" id="unfollow_com" style="{if !$tsCom.es_seguidor}display:none{/if}" onclick="com.seguir_com();return false;"><span class="i oji"></span>Siguiendo</a>
                <a href="#" class="boto rojo" id="unfollow_comr" style="display:none" onclick="com.seguir_com();return false;">Dejar de seguir</a>
                {/if}
            </div>
            <ul class="clearfix vci_stats floatR">
            	<li><span>{$tsCom.c_miembros|number_format:0:',':'.'}</span>Miembros</li>
                <li><span>{$tsCom.c_temas|number_format:0:',':'.'}</span>Temas</li>
                <li style="border-right:none;padding-right:0;"><span id="com_seguidores_total">{$tsCom.c_seguidores|number_format:0:',':'.'}</span>Seguidores</li>
            </ul>
        </div>
    </div>
    <a href="#" onclick="$('.ver_com_info').toggle();return false;"><i class="com_icon icon_less"></i></a>
    <div class="clearfix"></div>
</div>