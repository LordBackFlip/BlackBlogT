<div id="perfil_wall" status="activo">
	<script type="text/javascript">
		muro.stream.total = {$tsMuro.total};
	</script>
	<div id="perfil-form" class="widget">
		{if $tsPrivacidad.mf.v == true}
			{include file='modules/m.perfil_muro_form.tpl'}
		{else}
			<div class="nada-rojo" style="margin: 10px;">{$tsPrivacidad.mf.m}</div>
		{/if}
	</div>
	<div class="widget clearfix" id="perfil-wall">
		<div id="wall-content">
			{include file='modules/m.perfil_muro_story.tpl'}
		</div>
		{if $tsMuro.total >= 10}
			<div class="more-pubs">
				<div class="content">
					<a href="#" onclick="muro.stream.loadMore('wall'); return false;" class="a_blue">Publicaciones m&aacute;s antiguas</a>
					<span><img alt="Cargando..." src="{$tsConfig.tema.t_url}/i/min-carga.gif"/></span>
				</div>
			</div>
		{elseif $tsMuro.total == 0 && $tsUser->is_member && $tsPrivacidad.mf.v == true}
			<div class="nada-amarillo" id="solouno" style="margin: 10px;">Este usuario no tiene comentarios en su muro, se el primero!</div>
		{/if}
	</div>
</div>