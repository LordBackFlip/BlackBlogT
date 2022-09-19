1:
{foreach from=$tsComments.data item=c}
			<div class="clearfix ufiItem" id="cmt_{$c.cid}">
				<a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorPic">
					<img alt="{$c.user_name}" src="{$tsConfig.url}/files/avatar/{$c.c_user}_50.jpg"/>
				</a>
				<div class="mensaje">				
					<div class="comment-info clearbeta">
					<div class="btoace botonear">
						<a onclick="muro.like_this({$c.cid}, 'com', this); return false;" class="a_blue qtip" title="{$c.like}">
							<span class="i sigusta"></span>
						</a>
						{if $p.p_user == $tsUser->uid || $c.c_user == $tsUser->uid  || $tsUser->is_admod || $tsUser->permisos.moecm}
							<a href="#" onclick="muro.eliminar({$c.cid}, 2); return false" class="qtip" title="Eliminar"><span class="i eliminas"></span></a>
						{/if}						
					</div>					
						<div class="floatL">
							@<a href="{$tsConfig.url}/perfil/{$c.user_name}" class="autorName a_blue">{$c.user_name}</a>
							<span> {$c.c_date|fecha}</span>
							<div class="numbersvotes">
								<div class="overview">
									<span class="positivo {if $c.c_likes == 0}versi{/if}" id="mgus_{$c.cid}">{$c.c_likes}</span>
								</div>
							</div>						
						</div>						
					</div>	
					<div class="comment-content">{$c.c_body|quot}</div>
				</div>
			</div>
{/foreach}
