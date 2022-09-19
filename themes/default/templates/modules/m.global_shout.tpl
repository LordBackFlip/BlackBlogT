<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/shout.js"></script>
<link href="{$tsConfig.tema.t_url}/css/shout.css" rel="stylesheet" type="text/css"/>
<div id="jrtoup" pid="{$tsUser->uid}"></div>
<div class="yafue">El shout fue enviado</div>
<div class="fframeForm">
	<div class="attaSFrameS">		
		<!--FORMULARIO SECUNDARIO-->		
		<div class="SattaDesc">
			<div class="wrap">
				<textarea class="autogrow" id="SattaDesc" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="Haz un comentario sobre esta foto..."></textarea>
			</div>
		</div>			
		<!--FIN-->
		<div id="barcaB">
			<div id="loadingProgressGG"><div id="loadingProgressGG_1" class="loadingProgressGG"></div></div>
		</div>
		<div id="BattaContent">
			<!--FORMULARIO PRIMARIO-->
			<div id="statusSFrameS" style="display:block">
				<textarea class="autogrow" id="welle" placeholder="Comparte algo..."></textarea>
			</div>
			<!--FIN-->
			<div id="FajuFull"></div>
			<div id="fotoSFrameS">
				<span>URL</span>
				<input type="text" class="itext" name="ufoto" value="" placeholder="URL de la foto"/>
				<a href="#" class="adj" onclick="publico.stream.adjuntar(); return false;">Agregar</a>
				<span class="i xcerrarr" onclick="publico.stream.load('status', this); return false;"></span>
			</div>
			<div id="enlaceSFrameS">
				<span>URL</span>
				<input type="text" class="itext" name="uenlace" value="" placeholder="URL del enlace"/>
				<a href="#" class="adj" onclick="publico.stream.adjuntar(); return false;">Agregar</a>
				<span class="i xcerrarr" onclick="publico.stream.load('status', this); return false;"></span>
			</div>
			<div id="videoSFrameS">
				<span>URL</span>
				<input type="text" class="itext" name="uvideo" value="" placeholder="URL del video"/>
				<a href="#" class="adj" onclick="publico.stream.adjuntar(); return false;">Agregar</a>
				<span class="i xcerrarr" onclick="publico.stream.load('status', this); return false;"></span>
			</div>
		</div>
	</div>	
	<div class="bbsho">
		<span class="boton gris c" title="Compartir una foto" onclick="publico.stream.load('foto', this); return false;"><i class="fas fa-camera-alt"></i></span>
		<span class="boton gris y" title="Compartir un video" onclick="publico.stream.load('video', this); return false;"><i class="fab fa-youtube"></i></span>
		<span class="boton gris l" title="Compartir un enlace" onclick="publico.stream.load('enlace', this); return false;" style="line-height: 16px;"><i class="fas fa-link"></i></span>				
		<span class="boton azul" onclick="publico.stream.compartir();">Publicar</span>	
		<span id="ffulls" class="fas fa-lock-alt" title="Opciones de privacidad"></span>
		<div id="pprivami">
			<a data-value="0">Todos pueden comentar</a>
			<a data-value="1">Solo quien sigo puede comentar</a>
			<a data-value="2">Nadie puede comentar</a>
		</div>
	</div>
	<div id="toup"></div>	
</div>