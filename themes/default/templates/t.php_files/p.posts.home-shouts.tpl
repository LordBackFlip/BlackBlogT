{if $tsMuroHome.data}	
	{foreach from=$tsMuroHome.data item=p key=i}
	<div class="Story" id="pub_{$p.pub_id}" {if $i+1 == 1}style="border-top: 0;"{/if}>	
		<div class="Story_Content">
			<div class="Story_Head">
				<div id="boxship">					
					<div class="nonames">
						<span class="toup-user"></span><a href="{$tsConfig.url}/perfil/{$p.user_name}">{$p.user_name}</a> {if $p.p_type == 1}dijo{else}comparti&oacute;{/if}						
						{if $p.p_user == $tsUser->uid || $p.p_user_pub == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moepm}
						{if $tsUser->is_admod}
							<a onclick="muro.eliminar({$p.pub_id},1); return false;" class="floatR">Eliminar</a>
						{else}
							<a onclick="muro.del_pub({$p.pub_id},1); return false;">Eliminar</a>
						{/if}
						{/if}
					</div>
					<div class="shoutbody">{$p.p_body|quot}</div>		
					{if $p.p_type == 2}
						<div class="tfoto">
							<a onclick="ModalFoto('{$p.a_img}');"><img src="{$p.a_img}"/></a>
						</div>
					{elseif $p.p_type == 3}
						<div class="tlink">
							<h2><a href="{$p.a_url}" target="_blank">{$p.a_title|limit:50}</a></h2>
							<div class="folink">
								<img class="icon" src="http://www.google.com/s2/favicons?domain={$p.a_url}">
								<a href="{$p.a_url}" target="_blank" class="a_blue">{$p.a_url|replace:'http://':''|limit:40}</a>
							</div>
						</div>
					{elseif $p.p_type == 4}
					<div class="tvideo">
						<a id="youtube" onclick="ModalVideo('{$p.a_url}');">
							<h1>{$p.a_title|limit:30}</h1>
							<img src="http://img.youtube.com/vi/{$p.a_url}/0.jpg"/>
							<span></span>
						</a>
					</div>
					{/if}
				</div>
			</div>
			<div class="Story_Foot">
				<!--
				{if $tsType == 'story'}
				<div class="shoL">
					<a class="vctip" title="Denunciar" onclick="denuncia.nueva('tema',{$tsTema.t_id}, '{$tsTema.t_titulo}', '{$tsAutor.user_name}'); return false;"><span class="i denuncias"></span></a>
				</div>
				{/if}
				-->
				<div class="lefsho">
					{if $p.p_type == 1}<span class="i tipot"></span>{/if}
					{if $p.p_type == 2}<span class="i tipoi"></span>{/if}
					{if $p.p_type == 3}<span class="i tipol"></span>{/if}
					{if $p.p_type == 4}<span class="i tipov"></span>{/if}
					<a>{$p.p_date|fecha}</a>
				</div>
				<div class="shofo">					
			<a class="gis" onclick="muro.like_this('{$p.pub_id}', 'pub'); return false;" id="sunl_{$p.pub_id}">
				<span class="toup-thumb_up {if $p.likes.ami ==1}mgris{else}mazul{/if}"></span>
				<div class="acnu {if $p.likes.ami ==1}gri{else}azu{/if}">{$p.p_likes}</div>				
			</a>
			<a class="vrma" href="{$tsConfig.url}/perfil/{if $p.p_user == $p.p_user_pub}{$p.user_name}{else}{$tsUser->getUserName($p.p_user)}{/if}/{$p.pub_id}">Ver shout</a>
				</div>
			</div>
		</div>
	</div>		
	{/foreach}
{else}
	<div class="nada-gris">No hay shouts con este filtro</div>
{/if}	