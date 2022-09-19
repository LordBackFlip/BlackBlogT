<div class="perfil-main clearfix {$tsGeneral.stats.user_rango.1}">
	<div class="perfil-content general">
	<div id="info" pid="{$tsInfo.uid}"></div>
	<div id="perfil_content">
		{if $tsPrivacidad.m.v == false}
			<div id="perfil_wall" status="activo" class="widget">
				<div class="nada-amarillo" style="margin: 10px;">{$tsPrivacidad.m.m}</div>
				<script type="text/javascript">
					perfil.load_tab('info', $('#informacion'));
					$('#toupnet').addClass('viendo');	
				</script>
			</div>
		{elseif $tsType == 'story'}
			{include file='modules/m.perfil_story.tpl'}
		{elseif $tsType == 'news'}
			{include file='modules/m.perfil_noticias.tpl'}
		{else}
			{include file='modules/m.perfil_muro.tpl'}
		{/if}
	</div>
	<div id="perfil_load">
		<img src="{$tsConfig.tema.t_url}/i/spinner.gif" />
	</div>
	</div>
</div>