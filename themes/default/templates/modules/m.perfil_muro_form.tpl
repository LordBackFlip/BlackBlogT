<div class="frameForm">
	<div class="muroava">
		<a href="{$tsConfig.url}/perfil/{$tsUser->info.user_name}">
			<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
		</a>	
	</div>		
	<div class="attaFrame">		
		<!--FORMULARIO SECUNDARIO-->		
		<div class="attaDesc">
			<div class="wrap">
				<textarea class="autogrow" id="attaDesc" onfocus="onfocus_input(this)" onblur="onblur_input(this)" title="Haz un comentario sobre esta foto..."></textarea>
			</div>
		</div>			
		<!--FIN-->
		<div id="barca">
			<div id="loadingProgressG"><div id="loadingProgressG_1" class="loadingProgressG"></div></div>
		</div>
		<div id="attaContent">
			<!--FORMULARIO PRIMARIO-->
			<div id="statusFrame" style="display:block">
				<textarea class="autogrow" id="wall" placeholder="{if $tsInfo.uid == $tsUser->uid}Comparte algo...{else}Escribe algo....{/if}"></textarea>
			</div>
			<!--FIN-->
			<div id="ajuFull"></div>
			<div id="fotoFrame">
				<span>URL</span>
				<input type="text" class="itext" name="ifoto" value="" placeholder="URL de la foto"/>
				<a href="#" class="adj" onclick="muro.stream.adjuntar(); return false;">Agregar</a>
				<span class="i xcerrar" onclick="muro.stream.load('status', this); return false;"></span>
			</div>
			<div id="enlaceFrame">
				<span>URL</span>
				<input type="text" class="itext" name="ienlace" value="" placeholder="URL del enlace"/>
				<a href="#" class="adj" onclick="muro.stream.adjuntar(); return false;">Agregar</a>
				<span class="i xcerrar" onclick="muro.stream.load('status', this); return false;"></span>
			</div>
			<div id="videoFrame">
				<span>URL</span>
				<input type="text" class="itext" name="ivideo" value="" placeholder="URL del video"/>
				<a href="#" class="adj" onclick="muro.stream.adjuntar(); return false;">Agregar</a>
				<span class="i xcerrar" onclick="muro.stream.load('status', this); return false;"></span>
			</div>
		</div>
	</div>	
	<div class="bsho">
		<span class="boto gris vctip" title="Compartir una foto" onclick="muro.stream.load('foto', this); return false;"><div><span class="ii image"></span></div></span>
		<span class="boto gris vctip" title="Compartir un video" onclick="muro.stream.load('video', this); return false;"><div><span class="ii video"></span></div></span>
		<span class="boto gris vctip" title="Compartir un enlace" onclick="muro.stream.load('enlace', this); return false;"><div><span class="ii linke"></span></div></span>				
		<span class="boto azul" onclick="muro.stream.compartir();">Compartir</span>	
		<span id="fulls" class="i priva vctip" title="Opciones de privacidad"></span>
		<div id="privami">
			<a data-value="0">Todos pueden comentar</a>
			<a data-value="1">Solo quien sigo puede comentar</a>
			<a data-value="2">Nadie puede comentar</a>
		</div>
	</div>
	<div id="toup"></div>	
</div>