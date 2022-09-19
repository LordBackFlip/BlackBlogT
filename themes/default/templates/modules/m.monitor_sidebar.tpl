<div class="titular">
	<h2>Filtrar actividad</h2>
</div>
<div class="dsw">
	<ul>
		<h2 style="margin: 0;">Mis Posts</h2>
		<li><label><span class="monac_icons ma_star"></span><input type="checkbox" {if $tsData.filtro.f1 != true}checked="checked"{/if} onclick="notifica.filter('1', this)"/> Favoritos</label></li>
		<li><label><span class="monac_icons ma_comment_post"></span><input type="checkbox" {if $tsData.filtro.f2 != true}checked="checked"{/if}onclick="notifica.filter('2', this)"/> Comentarios</label></li>
		<li><label><span class="monac_icons ma_points"></span><input type="checkbox" {if $tsData.filtro.f3 != true}checked="checked"{/if}onclick="notifica.filter('3', this)"/> Puntos Recibidos</label></li>
		<h2>Mis Comentarios</h2>
		<li><label><span class="monac_icons ma_voto"></span><input type="checkbox" {if $tsData.filtro.f8 != true}checked="checked"{/if}onclick="notifica.filter('8', this)"/> Votos</label></li>
		<li><label><span class="monac_icons ma_comment_resp"></span><input type="checkbox" {if $tsData.filtro.f9 != true}checked="checked"{/if}onclick="notifica.filter('9', this)"/> Respuestas</label></li>
		<li><label><span class="monac_icons ma_blue_ball"></span><input type="checkbox" {if $tsData.filtro.f18 != true}checked="checked"{/if}onclick="notifica.filter('18', this)"/> Menciones</label></li>		
		<h2>Usuarios que sigo</h2>
		<li><label><span class="monac_icons ma_follow"></span><input type="checkbox" {if $tsData.filtro.f4 != true}checked="checked"{/if}onclick="notifica.filter('4', this)"/> Nuevos</label></li>
		<li><label><span class="monac_icons ma_post"></span><input type="checkbox" {if $tsData.filtro.f5 != true}checked="checked"{/if}onclick="notifica.filter('5', this)"/> Posts</label></li>
		<li><label><span class="monac_icons ma_photo"></span><input type="checkbox" {if $tsData.filtro.f10 != true}checked="checked"{/if}onclick="notifica.filter('10', this)"/> Fotos</label></li>
		<li><label><span class="monac_icons ma_share"></span><input type="checkbox" {if $tsData.filtro.f6 != true}checked="checked"{/if}onclick="notifica.filter('6', this)"/> Recomendaciones</label></li>
		<h2>Posts que sigo</h2>
		<li><label><span class="monac_icons ma_blue_ball"></span><input type="checkbox" {if $tsData.filtro.f7 != true}checked="checked"{/if}onclick="notifica.filter('7', this)"/> Comentarios</label></li>
		<li><h2>Mis Fotos</h2></li>
		<li><label><span class="monac_icons ma_comment_post"></span><input type="checkbox" {if $tsData.filtro.f11 != true}checked="checked"{/if}onclick="notifica.filter('11', this)"/> Comentarios</label></li>
		<h2>Perfil</h2>
		<li><label><span class="monac_icons ma_status"></span><input type="checkbox" {if $tsData.filtro.f12 != true}checked="checked"{/if}onclick="notifica.filter('12', this)"/> Publicaciones</label></li>
		<li><label><span class="monac_icons ma_w_comment"></span><input type="checkbox" {if $tsData.filtro.f13 != true}checked="checked"{/if}onclick="notifica.filter('13', this)"/> Comentarios</label></li>
		<li><label><span class="monac_icons ma_w_like"></span><input type="checkbox" {if $tsData.filtro.f14 != true}checked="checked"{/if}onclick="notifica.filter('14', this)"/> Likes</label></li>
		{if $tsConfig.c_allow_live == 1}
		<h2>Notificaciones Live</h2>
		<li><label><input type="checkbox" {if $tsStatus.live_nots == 'ON'}checked="checked"{/if} onclick="live.ch_status('nots');"/>Mostrar notificaciones</label></li>
		<li><label><input type="checkbox" {if $tsStatus.live_mps == 'ON'}checked="checked"{/if} onclick="live.ch_status('mps');"/>Mostrar mensajes nuevos</label></li>
		<li><label><input type="checkbox" {if $tsStatus.live_sound == 'ON'}checked="checked"{/if} onclick="live.ch_status('sound');"/>Reproducir sonidos</label></li>
		{/if}		
	</ul>
</div>
<div class="boxposts separa">
	<div class="titular">
		<h2>Siguiendo</h2>
	</div>		
	<div class="boxreco">	
		<div class="sigoo">
			<a href="{$tsConfig.url}/monitor/seguidores">Seguidores<span>{$tsData.stats.seguidores}</span></a>
			<a href="{$tsConfig.url}/monitor/siguiendo">Siguiendo<span>{$tsData.stats.siguiendo}</span></a>		
			<a href="{$tsConfig.url}/monitor/posts">Posts<span>{$tsData.stats.posts}</span></a>
		</div>
	</div>
</div>