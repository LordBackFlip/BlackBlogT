<div class="futopbox">
	<div class="htops">
		<h2>Temas m&aacute;s votados</h2>
	</div>
	<div class="boxtops">
	{if $tsTops.votos}
		{foreach from=$tsTops.votos item=c key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<i class="com_icon {$c.c_seo}"></i>
				<!--<img src="{$tsConfig.url}/files/uploads/c_{$c.c_id}.jpg"/>-->
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/{$c.t_id}/{$c.t_titulo|seo}.html">{$c.t_titulo|truncate:35}</a>
				<span>{$c.total}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Temas con m&aacute;s respuestas</h2>
	</div>
	<div class="boxtops">
	{if $tsTops.respuestas}
		{foreach from=$tsTops.respuestas item=c key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<i class="com_icon {$c.c_seo}"></i>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/{$c.t_id}/{$c.t_titulo|seo}.html">{$c.t_titulo|truncate:35}</a>
				<span>{$c.total}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Temas con m&aacute;s visitas</h2>
	</div>
	<div class="boxtops">
	{if $tsTops.visitas}
		{foreach from=$tsTops.visitas item=c key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<i class="com_icon {$c.c_seo}"></i>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/{$c.t_id}/{$c.t_titulo|seo}.html">{$c.t_titulo|truncate:35}</a>
				<span>{$c.total}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Temas con m&aacute;s seguidores</h2>
	</div>
	<div class="boxtops">
	{if $tsTops.seguidores}
		{foreach from=$tsTops.seguidores item=c key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<i class="com_icon {$c.c_seo}"></i>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/{$c.t_id}/{$c.t_titulo|seo}.html">{$c.t_titulo|truncate:35}</a>
				<span>{$c.total}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>