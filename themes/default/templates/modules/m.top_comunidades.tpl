<div class="futopbox">
	<div class="htops">
		<h2>Comunidades m&aacute;s populares</h2>
	</div>
	<div class="boxtops">
	{if $tsTops.miembros}
		{foreach from=$tsTops.miembros item=c key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<i class="com_icon {$c.c_seo}"></i>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|truncate:35}</a>
				<span>{$c.c_miembros}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Comunidades con m&aacute;s temas</h2>
	</div>
	<div class="boxtops">
	{if $tsTops.temas}
		{foreach from=$tsTops.temas item=c key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<i class="com_icon {$c.c_seo}"></i>				
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|truncate:35}</a>
				<span>{$c.c_temas}</span>								
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Comunidades con m&aacute;s seguidores</h2>
	</div>
	<div class="boxtops">
	{if $tsTops.seguidores}
		{foreach from=$tsTops.seguidores item=c key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<i class="com_icon {$c.c_seo}"></i>
				<a href="{$tsConfig.url}/comunidades/{$c.c_nombre_corto}/">{$c.c_nombre|truncate:35}</a>
				<span>{$c.c_seguidores}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>