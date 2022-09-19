    </section>
	<div id="limpiador"></div>
	<footer id="footer">
		<div class="seccion">
			<div class="inpie">
				{include file='modules/m.global_search_abajo.tpl'}
				<a class="ircielo" onclick="$('body').scrollTo(0)" class="irCielo">Ir al cielo</a>
			</div>
		</div>	
		<div id="pp_copyright">
			<a href="{$tsConfig.url}/pages/chat/">Chat</a>
			<a href="{$tsConfig.url}/pages/protocolo/">Protocolo</a>
			<a href="{$tsConfig.url}/pages/terminos-y-condiciones/">T&eacute;rminos y condiciones</a>
			<a href="{$tsConfig.url}/pages/privacidad/">Privacidad de datos</a>
			<!--<a href="{$tsConfig.url}/pages/dmca/">Reportar Abuso DMCA</a>-->
			<a href="#">Designer by to-up</a><!--Designer by-->
			<a href="{$tsConfig.url}"><strong>{$tsConfig.titulo}</strong></a> &copy; {$smarty.now|date_format:"%Y"}Powered by <a href="http://www.phpost.net/" target="_blank"><strong>PHPost</strong></a>
		</div>
	</footer>
</div>
			<script src="{$tsConfig.js}/jquery.dropotron.min.js"></script>
			<script src="{$tsConfig.js}/browser.min.js"></script>
			<script src="{$tsConfig.js}/breakpoints.min.js"></script>
			<script src="{$tsConfig.js}/util.js"></script>
			<script src="{$tsConfig.js}/main.js"></script>
</body>
</html>		