{include file='sections/main_header.tpl'}
<div class="tposts">
	<div class="izquierda">
		<div class="fulsx">	
			<div class="titular">
				<h2>Usuarios</h2>
				<a class="botob">{$tsPages.total}</a>
			</div>	
			{if $tsUsers}
			{foreach from=$tsUsers item=u}	
				<div id="boxse">					
					<div class="xoti">
						<h2>{$u.user_name}</h2>
						<div class="estv qtip" title="{$u.status.css}"><span class="esjer s-{$u.status.css}"></span></div>
					</div>
					
					<div class="mite">
						<div class="kilo">
							<p style="color: #{$u.rango.color};font-weight: bold;"><img src="{$tsConfig.tema.t_url}/images/icons/ran/{$u.rango.image}"/>{$u.rango.title}</p>
							<p><img src="{$tsConfig.tema.t_url}/images/flags/{$u.user_pais|lower}.png" style="margin: 3px 10px 0px 0;"/>{$tsPaises[$u.user_pais]}</p>
							<p><img src="{$tsConfig.tema.t_url}/images/icons/{if $u.user_sexo == 0}female{else}male{/if}.png"/> {if $u.user_sexo == 0}Mujer{else}Hombre{/if}</p>
						</div>
						<a class="teava" href="{$tsConfig.url}/perfil/{$u.user_name}">
							<img src="{$tsConfig.url}/files/avatar/{if $u.p_avatar}{$u.user_id}{else}avatar{/if}_50.jpg?{$smarty.now|date_format:"%Y%m%d%H%M%S"}"/>
						</a>
					</div>
					
					<div class="fotus">
						<p><span>{$u.user_puntos}</span>Puntos</p>
						<p class="espp"><span>{$u.user_comentarios}</span>Comentarios</p>
						<p class="esppa"><span>{$u.user_posts}</span>Posts</p>
					</div>
				</div>
			{/foreach}
		{else}
			<div class="nada-gris" style="margin: 5px 10px 0 0;">No se encontraro usuarios con los filtros seleccionados</div>
		{/if}
		</div>
		{if $tsPages.prev != 0 || $tsPages.next != 0}
			<div class="pagin">
				{if $tsPages.prev != 0}
					<div class="floatL">
						<a class="boto gris" href="{$tsConfig.url}/usuarios/?page={$tsPages.prev}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}">Anterior</a>
					</div>
				{else}	
					<div class="floatL nofi">
						<a class="boto gris">Anterior</a>
					</div>				
				{/if}
				{if $tsPages.next != 0}
					<div class="floatR">
						<a class="boto gris" href="{$tsConfig.url}/usuarios/?page={$tsPages.next}{if $tsFiltro.online == 'true'}&online=true{/if}{if $tsFiltro.avatar == 'true'}&avatar=true{/if}{if $tsFiltro.sex}&sex={$tsFiltro.sex }{/if}{if $tsFiltro.pais}&pais={$tsFiltro.pais}{/if}{if $tsFiltro.rango}&rango={$tsFiltro.rango}{/if}">Siguiente</a>
					</div>
				{else}	
					<div class="floatR nofi">
						<a class="boto gris">Siguiente</a>
					</div>					
				{/if}
			</div>	
		{/if}			
	</div>	
	
	
	
	
	<div class="derecha">
		<div class="titular">
			<h2>Filtrar</h2>
		</div>
		<form action="" method="get" class="clee">
			<div class="tifil">
				<h3>Estado</h3>
				<label><input type="checkbox" name="online" value="true" {if $tsFiltro.online == 'true'}checked="true"{/if}/>En linea</label> 
				<label><input type="checkbox" value="true" name="avatar" {if $tsFiltro.avatar == 'true'}checked="true"{/if}/>Con foto</label> 
			</div>
			<div class="tifil">
				<h3>Genero</h3>
				<label><input type="radio" name="sexo" value="m" {if $tsFiltro.sex == 'm'}checked="true"{/if}/>Hombre</label> 
				<label><input type="radio" name="sexo" value="f" {if $tsFiltro.sex == 'f'}checked="true"{/if}/> Mujer</label> 
				<label><input type="radio" name="sexo" value="" {if $tsFiltro.sex == ''}checked="true"{/if}/>Ambos</label>
			</div>
			<div class="tifil">
				<h3>Pa&iacute;s</h3>
				<select name="pais" id="pais"><option value="">Todos los Pa&iacute;ses</option>{foreach from=$tsPaises key=code item=pais}<option value="{$code}" {if $tsFiltro.pais == $code}selected="true"{/if}>{$pais}</option>{/foreach}</select>
			</div>	
			<div class="tifil">
				<h3>Rango</h3>
				<select name="rango" id="rango"><option value="">Todos los Rangos</option>{foreach from=$tsRangos item=r}<option value="{$r.rango_id}" {if $tsFiltro.rango == $r.rango_id}selected="true"{/if}>{$r.r_name}</option>{/foreach}</select>
			</div>			
			<input type="submit" class="boto azul" value="Filtrar"/>	
		</form>		
	</div>
</div>
{include file='sections/main_footer.tpl'}