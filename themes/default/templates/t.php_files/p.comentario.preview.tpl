1:
{if $tsType == 'new'} 
<div id="div_cmnt_{$tsComment.0}" class="{if $tsComment.4 == $tsUser->uid}especial1{else}especial3{/if}">
    <span id="citar_comm_{$tsComment.0}" style="display:none">{$tsComment.2}</span>
    <div class="comentario-post clearbeta">
        <div class="avatar-box" style="z-index: 99;">
            <a href="{$tsConfig.url}/perfil/{$tsUser->info.user_name}">
                <img width="48" height="48" title="{$tsUser->info.user_name}" src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}" class="avatar-48 lazy" style="position: relative; z-index: 1; display: inline;"/>
            </a>
        </div>
        <div class="comment-box">
            <div class="comment-info clearbeta">
                <div class="floatL">
                    @<a href="{$tsConfig.url}/perfil/{$tsUser->nick}">{$tsUser->nick}</a>  
					<!--{if $tsUser->is_admod}(<span style="color:red;">IP:</span> <a href="{$tsConfig.url}/moderacion/buscador/1/1/{$tsComment.6}" class="geoip" target="_blank">{$tsComment.6}</a>){/if} dijo-->
                    <span>{$tsComment.3|hace}</span>
                </div>
                <div class="floatR answerOptions">
					<div class="botonear">
                    {if $tsComment.0 > 0}
                    	<!--
						{if $tsUser->is_member}
							<a class="qtip" onclick="citar_comment({$tsComment.0}, '{$tsUser->nick}')" title="Citar"><span class="i citare"></span></a>
                        {/if}
						-->
						{if $tsUser->is_admod || $tsUser->permisos.goepc}
							<a class="qtip" onclick="comentario.editar({$tsComment.0}, 'show')" title="Editar"><span class="i edita"></span></a>
						{/if}
						{if $tsUser->is_admod || $tsUser->permisos.godpc}
							<a class="qtip" onclick="borrar_com({$tsComment.0}, {$tsUser->uid})" title="Eliminar"><span class="i eliminas"></span></a>
						{/if}
						{if $tsUser->is_admod || $tsUser->permisos.moaydcp}
							<a class="qtip" onclick="ocultar_com({$tsComment.0}, {$tsUser->uid});" title="Mostrar/Ocultar"><span class="i oculta"></span></a>
						{/if}
                        {else}
                        {/if}
					</div>
                </div>
            </div>
            <div id="comment-body-{$tsComment.0}" class="comment-content" style="text-align:left;">
                {$tsComment.1|nl2br}
            </div>
        </div>
    </div>
</div>
{elseif $tsType == 'edit'}
<div id="preview" class="box_cuerpo" style=" font-size:13px;  min-width:300px;max-width: 760px; padding: 10px; overflow-y: auto; text-align: left;">
    <div id="new-com-html">{$tsComment.1|nl2br}</div>
    <div id="new-com-bbcode" style="display:none">{$tsComment.5}</div>
</div>
{/if}