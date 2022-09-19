{if $tsAction == ''}
	{if $tsUser->is_member}
	<div id="selec">
		<div class="boline activo"><a href="#recientes" onclick="shout_recientes('0','news','recientes');" id="GloSho">Shouts {if $Shouts}<b id="NubeShout" class="nusho">{$Shouts}</b>{/if}</a></div>
		<div class="boline"><a href="#noticias"  onclick="shout_recientes('3','news','recientes');" id="GloNoti">Notificaciones {if $Posts}<b id="NubeNotifi" class="nusho">{$Posts}</b>{/if}</a></div>
		<div class="boline"><a href="#favoritos" onclick="shout_recientes('1','news','recientes');">Favoritos</a></div>
		<div class="boline"><a href="#{$tsUser->info.user_name}" onclick="shout_recientes('2','news','recientes');">@{$tsUser->info.user_name}</a></div>
	</div>
	{/if}
{elseif $tsAction == 'destacados'}
	<div id="selec">
		<div class="boline activo"><a href="#15minutos" onclick="shout_recientes('0','destacados','destacados');">15 minutos</a></div>
		<div class="boline"><a href="#1hora" onclick="shout_recientes('1','destacados','destacados');">1 hora</a></div>
		<div class="boline"><a href="#3horas" onclick="shout_recientes('2','destacados','destacados');">3 horas</a></div>
		<div class="boline"><a href="#6horas" onclick="shout_recientes('3','destacados','destacados');">6 horas</a></div>
	</div>
{elseif $tsAction == 'populares'}	
	<div id="selec">		
		<div class="boline"><a href="#comentarios" onclick="shout_populares('0','populares','populares','1','0');">Comentarios</a></div>
		<div class="boline activo"><a href="#megusta" onclick="shout_populares('0','populares','populares','0','0');">Me gusta</a></div>
		<div class="boline"><a href="#compartido" onclick="shout_populares('0','populares','populares','2','0');">Compartido</a></div>
		<div class="boline"><a href="#favoritos" onclick="shout_populares('0','populares','populares','3','0');">Favoritos</a></div>
		<div id="tamaTipo" class="boline">
			<a id="filTipo">Todo<span class="puti"></span></a>
			<div id="tmenu">
				<span class="tiup"></span>
				<div class="todmi">
					<a class="acti" href="#Todo" onclick="shout_populares('0','populares','populares','0','0');">Todo</a>
					<a href="#Texto" onclick="shout_populares('1','populares','populares','0','0');">Texto</a>
					<a href="#Imagen" onclick="shout_populares('2','populares','populares','0','0');">Imagen</a>
					<a href="#Video" onclick="shout_populares('3','populares','populares','0','0');">Video</a>
					<a href="#Link" onclick="shout_populares('4','populares','populares','0','0');">Link</a>				
				</div>
			</div>
		</div>
		<div id="tamaFecha" class="boline">
			<a id="filTipo">Hoy<span class="puti"></span></a>
			<div id="tmenu">
				<span class="tiup"></span>
				<div class="todmi">
					<a href="#Texto" onclick="shout_populares('0','populares','populares','0','6');">Hist&oacute;rico</a>
					<a class="acti" href="#Todo" onclick="shout_populares('0','populares','populares','0','0');">Hoy</a>
					<a href="#Texto" onclick="shout_populares('0','populares','populares','0','1');">Ayer</a>
					<a href="#Imagen" onclick="shout_populares('0','populares','populares','0','2');">&Uacute;ltimos 7 d&iacute;as</a>
					<a href="#Video" onclick="shout_populares('0','populares','populares','0','3');">Del mes</a>
					<a href="#Link" onclick="shout_populares('0','populares','populares','0','4');">Mes anterior</a>
					<a href="#Link" onclick="shout_populares('0','populares','populares','0','5');">Del a&ntilde;o</a>					
				</div>
			</div>
		</div>		
	</div>
{/if}