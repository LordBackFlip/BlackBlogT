{if $tsComments.num > 0}
	<div id="respnuevas">
	{foreach from=$tsComments.data item=c key=i}
		<div id="div_cmnt_{$c.cid}" class="{if $tsPost.autor == $c.c_user}especial1{elseif $c.c_user == $tsUser->uid}especial3{/if}">
			<span id="citar_comm_{$c.cid}" style="display:none">{$c.c_body}</span>            
			<div class="comentario-post clearbeta" {if $i==0}style="border-top:0;"{/if}>
				<div class="avatar-box" style="z-index: 99;">
					<a href="{$tsConfig.url}/perfil/{$c.user_name}">
						<img width="48" height="48" title="Avatar de {$c.user_name} en {$tsConfig.titulo}" src="{$tsConfig.url}/files/avatar/{$c.c_user}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" class="avatar-48 lazy" style="position: relative; z-index: 1; display: inline;"/>
					</a>
                </div>                                    
				<div class="comment-box" id="pp_{$c.cid}" {if $c.c_status == 1 || !$c.user_activo && $tsUser->is_admod}style="opacity:0.5"{/if} >
					<div class="comment-info clearbeta">
						<div class="floatL">
							<div class="floatL"><a href="{$tsConfig.url}/perfil/{$c.user_name}">{$c.user_name}</a><span> {$c.c_date|hace}</span></div>
							<div class="numbersvotes">
								<div class="overview">
									<span class="{if $c.c_votos >= 0}positivo{else}negativo{/if}" id="votos_total_{$c.cid}">{if $c.c_votos != 0}{if $c.c_votos >= 0}+{/if}{$c.c_votos}{/if}</span>
								</div>
							</div>
							<!--
							{if $tsUser->is_admod} <span style="color:red;">IP:</span> <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$c.c_ip}" class="geoip" target="_blank">{$c.c_ip}</a>{/if}
							-->
						</div>
						{if $tsUser->is_member}
							<div class="floatR answerOptions" id="opt_{$c.cid}">
								<div id="ul_cmt_{$c.cid}" class="botonear">
									<!--{*if $tsUser->info.user_rango || $tsUser->info.user_rango_post != 3*}-->
                                    {if $tsUser->uid != $c.c_user && $c.votado == 0 && ($tsUser->permisos.govpp || $tsUser->permisos.govpn || $tsUser->is_admod)}
										{if $tsUser->permisos.govpp || $tsUser->is_admod}
                                            <a class="icon-thumb-up qtip" onclick="comentario.votar({$c.cid},1)" title="Me gusta"><span class="toup-thumb_up"></span></a>
										{/if}
										{if $tsUser->permisos.govpn || $tsUser->is_admod}
											<a class="icon-thumb-down qtip" onclick="comentario.votar({$c.cid},-1)" title="No me gusta"><span class="toup-thumb_down"></span></a>
										{/if}
									{/if}
                                    <!--{*/if*}-->									
									<a class="qtip" onclick="comentario.resp({$c.cid})" title="Responder"><span class="toup-reply"></span></a>
<!--ORIGINAL									
									<a class="qtip" onclick="citar_comment({$c.cid}, '{$c.user_name}')" title="Responder"><span class="i citare"></span></a>
-->									
									{if ($c.c_user == $tsUser->uid && $tsUser->permisos.goepc) || $tsUser->is_admod || $tsUser->permisos.moedcopo}
										<a class="qtip" onclick="comentario.editar({$c.cid}, 'show')" title="Editar"><span class="toup-edit2"></span></a>
									{/if}
									{if ($c.c_user == $tsUser->uid && $tsUser->permisos.godpc) || $tsUser->is_admod || $tsUser->permisos.moecp}
										<a class="qtip" onclick="borrar_com({$c.cid}, {$c.c_user}, {$c.c_post_id})" title="Eliminar"><span class="toup-x"></span></a>
										{if $tsUser->is_admod || $tsUser->permisos.moaydcp}
											<a class="qtip" onclick="ocultar_com({$c.cid}, {$c.c_user});" title="{if $c.c_status == 1}Mostrar/Ocultar{else}Ocultar/Mostrar{/if}"><span class="toup-eye"></span></a>
										{/if}
									{/if}
									{if $tsUser->is_member && $tsUser->info.user_id != $c.c_user}
										<!--<a class="qtip" href="#" onclick="mensaje.nuevo('{$c.user_name}','','',''); return false" title="Enviar Mensaje"><span class="i mens"></span></a>-->
										<a class="qtip" href="javascript:bloquear({$c.c_user}, {if $tsComments.block}false{else}true{/if}, 'comentarios')" title="{if $tsComments.block}Desbloquear{else}Bloquear{/if}"><span class="toup-ban"></span></a>
									{/if}
									
								</div>
							</div>
						{/if}
					</div>
					<div id="comment-body-{$c.cid}" class="comment-content">
						{if $c.c_votos <= -3 || $c.c_status == 1 || !$c.user_activo || $c.user_baneado}<div>Escondido {if $c.c_status == 1}por un moderador{elseif $c.c_votos <= -3}por un puntaje bajo{elseif $c.user_activo == 0}por pertener a una cuenta desactivada{else}por pertenecer a una cuenta baneada{/if}. <a href="#" onclick="$('#hdn_{$c.cid}').slideDown(); $(this).parent().slideUp(); return false;">Click para verlo</a>.</div>
                        <div id="hdn_{$c.cid}" style="display:none">{/if}
						{$c.c_html}
                        {if $c.c_votos <= -3 || $c.c_status == 1 || !$c.user_activo}</div>{/if}
					</div>
				</div>
			</div>
			{include file='modules/m.posts_respuestas_comments.tpl'}
			{include file='modules/m.posts_agregar_respuesta.tpl'}
		</div>				
	{/foreach}
	</div>
{/if}                            
<div id="nuevos"></div>
{literal}
<script type="text/javascript">
$(function(){
	var zIndexNumber = 99;
	$('div.avatar-box').each(function(){
    $(this).css('zIndex', zIndexNumber);
	zIndexNumber -= 1;
	});
});
</script>
{/literal}