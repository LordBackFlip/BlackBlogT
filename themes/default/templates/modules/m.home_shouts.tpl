<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/perfil.js"></script>
<link href="{$tsConfig.tema.t_url}/css/perfil.css" rel="stylesheet" type="text/css" />
<div class="muys">
	<div class="tuie">
		<h2><i class="fas fa-edit"></i>  Estados</h2>
		<div class="mentop">
			<div class="actualtop"><strong id="scambi">P&uacute;blicos</strong><span class="toup-chevron-down"></span></div>
			<div class="listop"  id="sutops">
				<a onclick="pestanas('sutops','sayer','hdestacados','scambi','stops'), filtrar_shout('1');" class="hdestacados">Destacados</a>
				<a onclick="pestanas('sutops','shoy','hpopulares','scambi','stops'), filtrar_shout('2');" class="hpopulares">Populares</a>	
				<a onclick="pestanas('sutops','ssemana','hpublicos','scambi','stops'), filtrar_shout('3');" class="hpublicos listo">P&uacute;blicos</a>
			</div>	
		</div>		
	</div>
	<div id="filshout">
		{include file='t.php_files/p.posts.home-shouts.tpl'}
	</div>
</div>