<div class="iebox">
	<div class="boxtes">
		<h2><i class="fas fa-trophy"></i>  Top Posts</h2>
		<div class="mentop">
			<div class="actualtop"><strong id="pcambi">Todos</strong><span class="toup-chevron-down"></span></div>
			<div class="listop"  id="mptops">
				<a onclick="pestana('mptops','payer','tayer','pcambi','ptops'), filtrar_top_post('2');" class="tayer">Ayer</a>
				<a onclick="pestana('mptops','phoy','thoy','pcambi','ptops'), filtrar_top_post('1');" class="thoy">Hoy</a>				
				<a onclick="pestana('mptops','psemana','tsemana','pcambi','ptops'), filtrar_top_post('3');" class="tsemana">Semana</a>
				<a onclick="pestana('mptops','pmes','tmes','pcambi','ptops'), filtrar_top_post('4');" class="tmes">Mes</a>
				<a onclick="pestana('mptops','ptodos','ttodos','pcambi','ptops'), filtrar_top_post('5');" class="ttodos listo">Todos</a>
			</div>	
		</div>		
	</div>	
	<div class="secomo" id="postops">
		{include file='t.php_files/p.posts.top-posts.tpl'}
	</div>
	<a id="vemas" href="{$tsConfig.url}/top/">Ver todos</a>
</div>