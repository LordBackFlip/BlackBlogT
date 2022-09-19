<div id="preview" class="box_cuerpo">
	{$tsPreview.cuerpo}
</div>
{literal}
<script type="text/javascript">
$(window).bind(
	'resize',
	function(){
		$('#preview').height((document.documentElement.clientHeight - 140) + 'px');
		mydialog.center();
	}
);
$(window).trigger('resize');
</script>
{/literal}