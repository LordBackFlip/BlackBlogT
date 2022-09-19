{if $c.respuestas.num > 0}
	<div id="respuestas">
	{foreach from=$c.respuestas.data item=r}
		<div id="div_cmnt_{$r.cid}" class="{if $tsPost.autor == $r.c_user}especial1{elseif $r.c_user == $tsUser->uid}especial3{/if}">
			<span id="citar_comm_{$r.cid}" style="display:none">{$r.c_body}</span>
            <div class="comentario-post clearbeta">
				<div class="avatar-box" style="z-index: 99;">
					<a href="{$tsConfig.url}/perfil/{$r.user_name}">
						<img width="32" height="32" title="Avatar de {$r.user_name} en {$tsConfig.titulo}" src="{$tsConfig.url}/files/avatar/{$r.c_user}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" class="avatar-48 lazy" style="position: relative; z-index: 1; display: inline;"/>
					</a>
                </div>                                    
				<div class="comment-box" id="pp_{$r.cid}" {if $r.c_status == 1 || !$r.user_activo && $tsUser->is_admod}style="opacity:0.5"{/if} >
					<div class="comment-info clearbeta">
						<div class="floatL">
							<div class="floatL"><a href="{$tsConfig.url}/perfil/{$r.user_name}">{$r.user_name}</a><span> {$r.c_date|hace}</span></div>
							<div class="numbersvotes">
								<div class="overview">
									<span class="{if $r.c_votos >= 0}positivo{else}negativo{/if}" id="votos_total_{$r.cid}">{if $r.c_votos != 0}{if $r.c_votos >= 0}+{/if}{$r.c_votos}{/if}</span>
								</div>
							</div>
						</div>
						{if $tsUser->is_member}
							<div class="floatR answerOptions" id="opt_{$r.cid}">
								<div id="ul_cmt_{$r.cid}" class="botonear">
                                    {if $tsUser->uid != $r.c_user && $r.votado == 0 && ($tsUser->permisos.govpp || $tsUser->permisos.govpn || $tsUser->is_admod)}
										{if $tsUser->permisos.govpp || $tsUser->is_admod}
                                            <a class="icon-thumb-up qtip" onclick="comentario.votar({$r.cid},1)" title="Me gusta"><span class="toup-thumb_up"></span></a>
										{/if}
										{if $tsUser->permisos.govpn || $tsUser->is_admod}
											<a class="icon-thumb-down qtip" onclick="comentario.votar({$r.cid},-1)" title="No me gusta"><span class="toup-thumb_down"></span></a>
										{/if}
									{/if}
									<!--
									<a class="qtip" onclick="citar_comment({$r.cid}, '{$r.user_name}')" title="Citar"><span class="i citare"></span></a>
									-->								
									{if $tsUser->uid != $r.c_user && ($tsUser->permisos.govpp || $tsUser->permisos.govpn || $tsUser->is_admod)}
										<a class="qtip" onclick="comentario.resp({$c.cid}), $('#bodys_comm_{$c.cid}').val('@{$r.user_name} ').focus()" title="Responder"><span class="toup-reply"></span></a>									
									{/if}
									{if ($r.c_user == $tsUser->uid && $tsUser->permisos.goepc) || $tsUser->is_admod || $tsUser->permisos.moedcopo}
										<a class="qtip" onclick="comentario.editar({$r.cid}, 'show')" title="Editar"><span class="toup-edit2"></span></a>
									{/if}
									{if ($r.c_user == $tsUser->uid && $tsUser->permisos.godpc) || $tsUser->is_admod || $tsUser->permisos.moecp}
										<a class="qtip" onclick="borrar_respuesta({$r.cid}, {$r.c_user}, {$r.c_post_id})" title="Eliminar"><span class="toup-x"></span></a>
										{if $tsUser->is_admod || $tsUser->permisos.moaydcp}
											<a class="qtip" onclick="ocultar_com({$r.cid}, {$r.c_user});" title="{if $r.c_status == 1}Mostrar/Ocultar{else}Ocultar/Mostrar{/if}"><span class="toup-eye"></span></a>
										{/if}
									{/if}
									{if $tsUser->is_member && $tsUser->info.user_id != $r.c_user}
										<a class="qtip" href="javascript:bloquear({$r.c_user}, {if $tsComments.block}false{else}true{/if}, 'comentarios')" title="{if $tsComments.block}Desbloquear{else}Bloquear{/if}"><span class="toup-ban"></span></a>
									{/if}
									
								</div>
							</div>
						{/if}
					</div>
					<div id="comment-body-{$r.cid}" class="comment-content">
						{if $r.c_votos <= -3 || $r.c_status == 1 || !$r.user_activo || $r.user_baneado}<div>Escondido {if $r.c_status == 1}por un moderador{elseif $r.c_votos <= -3}por un puntaje bajo{elseif $r.user_activo == 0}por pertener a una cuenta desactivada{else}por pertenecer a una cuenta baneada{/if}. <a href="#" onclick="$('#hdn_{$r.cid}').slideDown(); $(this).parent().slideUp(); return false;">Click para verlo</a>.</div>
                        <div id="hdn_{$r.cid}" style="display:none">{/if}
						{$r.c_html}
                        {if $r.c_votos <= -3 || $r.c_status == 1 || !$r.user_activo}</div>{/if}
					</div>
				</div>
			</div>
		</div>
	{/foreach}
	</div>
{/if}