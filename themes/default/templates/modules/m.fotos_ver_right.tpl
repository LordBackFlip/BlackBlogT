{if $tsFoto.f_user == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moef || $tsUser->permisos.moedfo}
<div class="boxposts separa">
	<div class="titular">
		<h2>Opciones</h2>
	</div>		
	<div class="edtp">
		{if $tsFoto.f_user == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moef || $tsUser->permisos.moedfo}
			{if $tsFoto.f_status != 2 && ($tsUser->is_admod || $tsUser->permisos.moef || $tsFoto.f_user == $tsUser->uid)}
				<a style="margin-right: 10px;" class="boto gris" href="#" onclick="{if $tsUser->uid == $tsFoto.f_user}fotos.borrar({$tsFoto.foto_id}, 'foto'); {else}mod.fotos.borrar({$tsFoto.foto_id}, 'foto');  {/if}return false;">
					<img alt="Borrar" src="{$tsConfig.default}/images/borrar.png"/> Borrar
				</a>
			{/if}
			{if $tsUser->is_admod || $tsUser->permisos.moedfo || $tsFoto.f_user == $tsUser->uid}
				<a class="boto gris" href="#" onclick="location.href='{$tsConfig.url}/fotos/editar.php?id={$tsFoto.foto_id}'; return false">
					<img alt="Editar" src="{$tsConfig.default}/images/editar.png"/> Editar
				</a>
			{/if}
		{/if}
	</div>
</div>
{/if}

<div class="boxposts separa">
	<div class="titular">
		<h2>Fotos</h2>
		<a class="botob" href="{$tsConfig.url}/fotos/{$tsFoto.user_name}">{$tsFoto.user_fotos}</a>
	</div>		
	<div class="ufmor">
		{foreach from=$tsUFotos item=f}
			<a href="{$tsConfig.url}/fotos/{$f.user_name}/{$f.foto_id}/{$f.f_title|seo}.html">
				<img class="loadimg" data-original="{$f.f_url}"/>
			</a>
		{/foreach}	
	</div>
</div>
{if $tsFVisitas}
<div class="boxposts separa">
	<div class="titular">
		<h2>Visitantes</h2>
	</div>		
	{if $tsFVisitas}
	<div class="visee">
		{foreach from=$tsFVisitas item=v}
			<a href="{$tsConfig.url}/perfil/{$v.user_name}">
				<img src="{$tsConfig.url}/files/avatar/{$v.user_id}_50.jpg" class="vctip" title="{$v.date|hace:true}"/>
			</a>
		{/foreach}	
	</div>	
	{else}						
		<div class="nada-gris">No tiene visitas</div>
	{/if}	
</div>
{/if}
<div class="boxposts separa">
	<div class="titular">
		<h2>Medallas</h2>
	</div>			
	{if $tsFMedallas}
		<div class="mda">			
			{foreach from=$tsFMedallas item=m}		
				<img src="{$tsConfig.tema.t_url}/images/icons/med/{$m.m_image}_32.png" class="qtip" title="{$m.m_title} - {$m.m_description}"/>
			{/foreach}
		</div>
	{else}
		<div class="nada-gris">Esta foto no tiene medallas</div>
	{/if}		
</div>