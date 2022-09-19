<div class="boxposts separa">
	<div class="titular">
		<h2>Estad&iacute;sticas</h2>
	</div>
	<div class="estabox">
		<div class="lin">
			<span class="floatL"><a href="{$tsConfig.url}/usuarios/?online=true"><b>{$tsStats.stats_online|number_format:0:',':'.'}</b> usuarios online</a></span>
			<span class="floatR"><a href="{$tsConfig.url}/comunidades/dir/"><b>{$tsStats.stats_comunidades|number_format:0:',':'.'}</b> comunidades</a></span>
		</div>	
		<div class="lin">
			<span class="floatL"><b>{$tsStats.stats_temas|number_format:0:',':'.'}</b> temas</span>
			<span class="floatR"><b>{$tsStats.stats_respuestas|number_format:0:',':'.'}</b> respuestas</span>
		</div>		
	</div>
	<div class="paginar"><a href="{$tsConfig.url}/envivo/">{$tsConfig.titulo}! en vivo</a></div>
</div>