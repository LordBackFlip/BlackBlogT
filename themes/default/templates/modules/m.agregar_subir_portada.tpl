<script type="text/javascript" src="{$tsConfig.js}/portada.js"></script>
<li class="special-right clearbeta">
<label>Imagen en miniatura</label>
<div id="BoxPortada">
	<input type="hidden" name="portada" value="{$tsDraft.b_portada}"/>	
	<div class="sidebar-tabs clearbeta">
		<div class="avatar-big-cont">
			<div style="display: none" class="avatar-loading"></div>
			<div id="ImgPo">
				<img src="{if $tsDraft.b_portada}{$tsConfig.url}/files/portadas/toup{$tsDraft.b_portada}P240X180.jpg{/if}" class="portada-big" id="portada-img"/>
				<p>Haz clic aqui para subir una imagen</p>
			</div>	
			<div class="menu-subir">
				<div class="imagen-pc">Desde mi computadora</div>
				<div class="imagen-url">Desde internet (URL)</div>
				{*<div class="imagen-url">Desde el post</div>*}
			</div>
			
		</div>		
	</div>			
</div>	
<p class="ilepo"><b>Resolución mínima 50 x 50, peso máximo 5Mb</b>. Esta imagen servirá de vista previa de tu posteo en los listados de posts, en redes sociales y en la versión móvil de Taringa! <a>Ver ejemplo</a></p>				
</li>