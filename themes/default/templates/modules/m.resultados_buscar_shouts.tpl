<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/perfil.js"></script>
<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/portal.js"></script>
<link href="{$tsConfig.tema.t_url}/css/perfil.css" rel="stylesheet" type="text/css"/>
<div class="tposts">
	<div class="izquierda">
		<div class="dimencion">
			<form name="buscador" action="" method="GET">
				<input class="busk" name="q" type="text" value="{$tsPalabra}"/>
				<input type="submit" title="Buscar" value="Buscar" class="boto verde"/>
			</form>
		</div>
	<!--RESULTADOS ENCONTRADOS EN LOS SHOUTS-->
	<div class="sepre">
	<div class="titular" style="margin-bottom: 10px;">
		<h2>Shouts</h2><span class="cuto">({$tsResults.pages.total})</span>
	</div>
	{if $tsResults.data}
		{foreach from=$tsResults.data item=p}
		<div class="Story" id="pub_{$p.pub_id}">
			<div class="boxreshout">
				{if $p.p_compa == 1}
					<a href="{$tsConfig.url}/perfil/{$tsUser->getUserName($p.p_user_shared)}" class="Story_Pic"><img alt="{$p.user_name}" src="{$tsConfig.url}/files/avatar/{$p.p_user_shared}_50.jpg"/></a>
					<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="non"><img alt="{$p.user_name}" src="{$tsConfig.url}/files/avatar/{$p.p_user_pub}_50.jpg"/></a>		
				{else}
					<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="Story_Pic"><img alt="{$p.user_name}" src="{$tsConfig.url}/files/avatar/{$p.p_user_pub}_50.jpg"/></a>		
				{/if}
			</div>	
			<div class="Story_Content">
				<span class="pushot"></span>
				<div class="Story_Head">
					{if $tsType == 'story'}
					{else}
					{if $p.p_user == $tsUser->uid || $p.p_user_pub == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moepm}
						{if $tsUser->is_admod}
							<span onclick="muro.eliminar({$p.pub_id},1); return false;" class="i elimina"></span>
						{else}
							<span onclick="muro.del_pub({$p.pub_id},1); return false;" class="i elimina"></span>
						{/if}
					{/if}
					{/if}
					<div class="quiendi"> 
						@<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="a_blue">{$p.user_name}</a> {if $p.p_type == 1}dijo{else}comparti&oacute;{/if}
						{if $p.p_compa == 1}v&iacute;a @<a href="{$tsConfig.url}/perfil/{$tsUser->getUserName($p.p_user_shared)}" class="a_blue">{$tsUser->getUserName($p.p_user_shared)}</a>{/if}
					</div>
					<div class="shoutbody">{$p.p_body|quot}</div>				
					{if $p.p_type == 2}
					<div class="tfoto">
						<img src="{$p.a_img}"/>
					</div>
					{elseif $p.p_type == 3}
					<div class="tlink">
						<h2><a href="{$p.a_url}" target="_blank">{$p.a_title}</a></h2>
						<div class="folink">
							<img class="icon" src="http://www.google.com/s2/favicons?domain={$p.a_url}">
							<a href="{$p.a_url}" target="_blank" class="a_blue">{$p.a_url}</a>
						</div>
					</div>
					{elseif $p.p_type == 4}
						<div class="tvideo">
							<iframe width="574" height="315" src="https://www.youtube.com/embed/{$p.a_url}" frameborder="0" allowfullscreen></iframe>
						</div>
					{/if}
				</div>
				<div class="Story_Foot">
					<div class="lefsho">
						{if $p.p_type == 1}<span class="i tipot"></span>{/if}
						{if $p.p_type == 2}<span class="i tipoi"></span>{/if}
						{if $p.p_type == 3}<span class="i tipol"></span>{/if}
						{if $p.p_type == 4}<span class="i tipov"></span>{/if}
						<a>{$p.p_date|fecha}</a>
					</div>
					<div class="shofo">
						<a class="vctip" title="Ver actividad" onclick="ver_actividad('{$p.pub_id}'); return false;"><span class="i actividades"></span></a>
						<a class="abrir" href="{$tsConfig.url}/perfil/{if $p.p_user == $p.p_user_pub}{$p.user_name}{else}{$tsUser->getUserName($p.p_user)}{/if}/{$p.pub_id}">{if $p.p_user == $p.p_user_pub}Abrir{else}Comentar{/if}</a>					
						<a class="vctip" title="Comentarios" onclick="muro.show_comment_box('{$p.pub_id}'); return false;"><span class="i comenta"></span><div class="acnu" id="sunc_{$p.pub_id}"><b id="datine">{$p.p_comments}</b></div></a>
						<a class="vctip" title="Favoritos" onclick="favorito_shout('{$p.pub_id}'); return false;" id="sunf_{$p.pub_id}"><span class="i {if $p.favorito.si ==1}favoriAmarillo{else}favori{/if}"></span><div class="acnu">{$p.p_favoritos}</div></a>
						<a class="vctip" title="Me gusta" onclick="muro.like_this('{$p.pub_id}', 'pub'); return false;" id="sunl_{$p.pub_id}"><span class="i {if $p.likes.ami ==1}likeliVerde{else}likeli{/if}"></span><div class="acnu">{$p.p_likes}</div></a>
						<a class="vctip" title="Compartir" onclick="compartir_shout('{$p.pub_id}'); return false;" id="suns_{$p.pub_id}"><span class="i  {if $p.compartir.si ==1}repostVerde{else}repost{/if}"></span><div class="acnu">{$p.p_shared}</div></a>
					</div>
				</div>
				<div class="espera" id="carga_{$p.pub_id}"></div>
				<div id="activida{$p.pub_id}" style="display:none;"></div>
				{if $tsType == 'story'}{else}
					{if $tsPrivacidad.mf.v == true && $tsUser->is_member || $tsAction == 'mi'}			
						<div class="adres" id="cb_{$p.pub_id}">
							<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" width="32" height="32"/>
							<textarea class="autogrow" title="Escribe un comentario..." id="cf_{$p.pub_id}" pid="{$p.pub_id}" name="add_wall_comment" onfocus="onfocus_input(this)" onblur="onblur_input(this)"></textarea>
							<span class="boto gris" onclick="muro.comentar('{$p.pub_id}');">Comentar</span>
						</div>
					{/if}
				{/if}			
			</div>
		</div>	
		{/foreach}
		{if $tsResults.pages.total > 12}
			<div class="pagin">
				{if $tsResults.pages.prev != 0}
					<div class="floatL">
						<a class="boto gris" href="{$tsConfig.url}/buscar/{$tsAction}/{if $tsPalabra}?q={$tsPalabra}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.prev}">Anterior</a>
					</div>	
				{else}
					<div class="floatL nofi">
						<a class="boto gris">Anterior</a>
					</div>				
				{/if}	
				{if $tsResults.pages.next != 0}
					<div class="floatR">
						<a class="boto gris" href="{$tsConfig.url}/buscar/{$tsAction}/{if $tsPalabra}?q={$tsPalabra}{/if}{if $tsTipo}&type={$tsTipo}{/if}{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&page={$tsResults.pages.next}">Siguiente</a>
					</div>
				{else}	
					<div class="floatR nofi">
						<a class="boto gris">Siguiente</a>
					</div>					
				{/if}		
			</div>		
		{/if}
	{else}
		{if $tsPalabra}
			<div class="aviso">
				<span>Oops... Nada por aquí</span>
				<p>No hay resultados para <b>"{$tsPalabra}"</b> intenta usando alguno de los filtros</p>
			</div>
		{/if}
	{/if}
	</div>	
	</div>
	<div class="derecha">
		<!--FILTROS PARA LA BUSQUEDA-->
		<div class="boxposts separa">
			<div class="titular">
				<h2>Filtros</h2>
			</div>	
			<div class="fil">
				<p>Tipo</p>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}&type=0{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == '0' || $tsTipo == ''}class="aqui"{/if}>Todos</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}&type=2{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == '2'}class="aqui"{/if}>Im&aacute;genes</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}&type=4{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == '4'}class="aqui"{/if}>Videos</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}&type=3{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == '3'}class="aqui"{/if}>Links</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}&type=1{if $tsTiempo}&interval={$tsTiempo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}" {if $tsTipo == '1'}class="aqui"{/if}>Texto</a>
			</div>									
			<div class="fil">
				<p>Creado</p>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=recent" {if $tsTiempo == 'recent'}class="aqui"{/if}>&Uacute;ltimas 24 horas</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-week" {if $tsTiempo == 'last-week'}class="aqui"{/if}>&Uacute;ltima semana</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-month" {if $tsTiempo == 'last-month'}class="aqui"{/if}>&Uacute;ltimo mes</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=last-year" {if $tsTiempo == 'last-year'}class="aqui"{/if}>&Uacute;ltimo a&ntilde;o</a>
				<a href="{$tsConfig.url}/buscar/mi/?q={$tsPalabra}{if $tsTipo}&type={$tsTipo}{/if}{if $tsAutor}&autor={$tsAutor}{/if}&interval=all-time" {if $tsTiempo == 'all-time' || $tsTiempo == ''}class="aqui"{/if}>Hist&oacute;rico</a>
			</div>
			<div class="fil">
				<p>Autor</p>
				<div class="autob">				
				<form name="buscador" action="" method="GET">
					<input name="q" type="text" value="{$tsPalabra}" style="display:none;"/>
					<input class="buska" type="text" name="autor" value="{$tsAutor}"/>
					<input type="submit" title="Buscar" value="Ir" class="botos"/>
				</form>	
				</div>
			</div>		
		</div>
		{include file='modules/m.portal_hashtags.tpl'}
	</div>
</div>