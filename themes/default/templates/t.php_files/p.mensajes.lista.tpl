{if $tsMensajes.data}
    {foreach from=$tsMensajes.data item=mp}
		<div id="notu">			
			<a href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}" title="{$mp.mp_subject}" {if $mp.mp_read_to == 0 || $mp.mp_read_mon_to == 0}id="kill"{/if}>
				<span id="lies"></span>
				<img src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_50.jpg?{$smarty.now}" alt="{$mp.user_name}"/>
				<h3>{$mp.user_name}</h3>
				<p>{$mp.mp_subject}</p>
			</a>			
		</div>	
    {/foreach}
{else}
	<div class="errr">No tienes mensajes</div>
	{*No tienes mensajes? Prueba escribiendo a tus amigos!*}
{/if}