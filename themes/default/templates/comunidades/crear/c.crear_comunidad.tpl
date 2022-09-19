{literal}
<script type='text/javascript'>
//FUNCION PARA SUSTITUIR IMAGENES CAIDAS BY TO-UP.NET
function ImagenOk(img) {
if (!img.complete) return false;
if (typeof img.naturalWidth != "undefined" && img.naturalWidth == 0) return false;
return true;
}
function RevisarImagenesRotas() {
var replacementImg = global_data.img + 'i/nofoto.png';
for (var i = 0; i < document.images.length; i++) {
if (!ImagenOk(document.images[i])) {
document.images[i].src = replacementImg;
}}}
window.onload=RevisarImagenesRotas;
</script>
{/literal}
<div class="bgagrecom">			
	<form action="" method="post" id="add_new_com" enctype="multipart/form-data">
		<div class="izquierdas">
			{include file='comunidades/crear/c.crear_left.tpl'}
		</div>
		<div class="derecha">
			{include file='comunidades/crear/c.crear_right.tpl'}
		</div>
	</form>
</div>	
		
