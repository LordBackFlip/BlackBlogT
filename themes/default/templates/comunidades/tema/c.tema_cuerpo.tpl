<div class="com_tema_cuerpo clearfix">
    <h1 class="ctc_h1">{$tsTema.t_titulo}</h1>
	<div class="ctc_share">
        <span class="ctc_date floatL qtip" title="{$tsTema.t_fecha_all}">{$tsTema.t_fecha|hace}</span>
    </div>    
    <div class="ctc_body">{$tsTema.t_cuerpo}</div>
</div>
<div class="com_tema_options clearfix">
	{if $tsUser->is_member}
	{if $tsTema.t_autor != $tsUser->uid}
	<a onclick="com.votar_tema('pos');" class="boto gris"><i class="com_icon icon_like"></i> Me gusta</a>
	
    <a onclick="com.votar_tema('neg');" class="boto gris"><i class="com_icon icon_dislike"></i></a>
    <a onclick="com.seguir_tema();" class="boto gris" id="follow_tema" {if $tsTema.es_seguidor}style="display:none"{/if}><i class="com_icon icon_eye"></i>Seguir</a>
	
    <a onclick="com.seguir_tema();" class="boto verde" id="unfollow_tema" style="{if !$tsTema.es_seguidor}display:none{/if}"><i class="com_icon icon_eye"></i>Siguiendo</a>
    <a onclick="com.seguir_tema();" class="boto rojo" id="unfollow_temar" style="display:none;">Dejar de seguir</a>
    <a onclick="com.add_favorito();" class="boto gris add_favorito" {if $tsTema.mi_fav}style="display:none;"{/if} title="A&ntilde;adir a mis favoritos"><i class="com_icon icon_favs"></i> A favoritos</a>
    <a onclick="void(0);" class="boto verde ibg add_favorito" {if !$tsTema.mi_fav}style="display:none;"{/if} title="Lo tienes en tus favoritos"><i class="com_icon icon_favs"></i>Favorito</a>
    {/if}
    {else}
		<p class="ilea"><a href="{$tsConfig.url}/login?redirect=%2F">Reg&iacute;strate</a> para acceder a las opciones del tema</p>
    {/if}
    <ul class="cts_stats clearfix floatR">
    	<li>
        	<span id="favs_total">{$tsTema.t_favoritos|number_format:0:',':'.'}</span><i class="com_icon icon_favs"></i>
            <div>Favoritos</div>
        </li>
        <li>
        	<span>{$tsTema.t_visitas|number_format:0:',':'.'}</span><i class="com_icon icon_visitas"></i>
            <div>Visitas</div>
        </li>
        <li>
        	<span id="segs_total">{$tsTema.t_seguidores|number_format:0:',':'.'}</span><i class="com_icon icon_eye"></i>
            <div>Seguidores</div>
        </li>
        <li>
        	<span id="votos_total" style="color:{if $tsTema.t_votos_pos-$tsTema.t_votos_neg > 0}green{elseif $tsTema.t_votos_pos-$tsTema.t_votos_neg < 0}red{else}#222{/if}">{$tsTema.t_votos_pos-$tsTema.t_votos_neg|number_format:0:',':'.'}</span><i class="com_icon icon_like"></i>
            <div>Calificaci&oacute;n</div>
        </li>
    </ul>
</div>
