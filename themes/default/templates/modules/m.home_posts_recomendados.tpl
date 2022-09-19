<div class="iebox">
	<div class="boxtes">
		<h2><i class="fas fa-star-half-alt"></i>  Recomendados</h2>
		<div class="mentop">
			<div class="actualtop"><strong id="dcambi">Lo m&aacute;s reciente</strong><span class="toup-chevron-down"></span></div>
			<div class="listop"  id="dctops">
				<a onclick="pestana('dctops','dayer','dtayer','dcambi','despost'), filtrar_post_recomendados('1');" class="dtayer">Creados por usuarios que sigues</a>
				<a onclick="pestana('dctops','dhoy','dthoy','dcambi','despost'), filtrar_post_recomendados('2');" class="dthoy">Seg&uacute;n tus posts leidos</a>				
				<a onclick="pestana('dctops','dsemana','dtsemana','dcambi','despost'), filtrar_post_recomendados('3');" class="dtsemana">Por tu navegaci&oacute;n reciente</a>
				<a onclick="pestana('dctops','dmes','dtmes','dcambi','despost'), filtrar_post_recomendados('0');" class="dtmes listo">Lo m&aacute;s reciente</a>
			</div>	
		</div>		
	</div>	
	<div class="secomo" id="posdestacados">
		{include file='t.php_files/p.posts.posts-recomendados.tpl'}			
	</div>
</div>