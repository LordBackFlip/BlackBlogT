<div id="post-comentarios">
	<div class="titular">
		<h3><span id="ncomments">{$tsPost.post_comments}</span> comentarios - {$tsPost.post_title}</h3>
		<img src="{$tsConfig.tema.t_url}/i/min-carga.gif" id="com_gif"/>
	</div>
	{if $tsPost.post_comments > $tsConfig.c_max_com}
		<div class="comentarios-title"><div class="paginadorCom"></div></div>
	{/if}
	<div id="comentarios">
		<script type="text/javascript">		
			// {literal}
			$(document).ready(function(){
				/*
				top_cmt = $("#offset_cmts").offset().top;
				//
				function check_load(){
					if (!comentario.cargado && $(window).scrollTop() + $(window).height() > top_cmt ) {
						// {/literal} 
						*/
						comentario.cargar({$tsPages.post_id}, 1, {$tsPages.autor});
						/*
						// {literal}
						comentario.cargado = true;
					}
				}
				$(window).scroll(check_load);
				check_load();*/
			});
			// {/literal}
		</script>
		<div id="no-comments" class="nada-nada">Cargando comentarios espera un momento...</div>
	</div>
	{if $tsPost.post_comments > $tsConfig.c_max_com}
		<div class="comentarios-title"><div class="paginadorCom"></div></div>
	{/if}					
</div>	
{include file='modules/m.posts_avisos.tpl'}