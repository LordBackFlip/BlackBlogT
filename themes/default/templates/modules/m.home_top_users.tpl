<div class="muys">
	<div class="tuie">
		<h2><span class="shale toup-trophy"></span>Top Usuarios</h2>
		<div class="mentop">
			<div class="actualtop"><strong id="ucambi">Todos</strong><span class="toup-chevron-down"></span></div>
			<div class="listop" id="mutops">
				<a onclick="pestana('mutops','uayer','ttayer','ucambi','utops'), filtrar_top_usuarios('2');" class="ttayer">Ayer</a>				
				<a onclick="pestana('mutops','uhoy','tthoy','ucambi','utops'), filtrar_top_usuarios('1');" class="tthoy">Hoy</a>				
				<a onclick="pestana('mutops','usemana','ttsemana','ucambi','utops'), filtrar_top_usuarios('3');;" class="ttsemana">Semana</a>
				<a onclick="pestana('mutops','umes','ttmes','ucambi','utops'), filtrar_top_usuarios('4');;" class="ttmes">Mes</a>
				<a onclick="pestana('mutops','utodos','tttodos','ucambi','utops'), filtrar_top_usuarios('5');;" class="tttodos listo">Todos</a>
			</div>	
		</div>		
	</div>
	<div id="usutops">
		{include file='t.php_files/p.posts.top-usuarios.tpl'}
	</div>
</div>