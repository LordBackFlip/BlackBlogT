<div class="titular">
	<h2>Carpeta {if $tsAction ==''}recibidos{else}{$tsAction}{/if}</h2>
</div>
{if $tsMensajes.data}
	<div class="fumsen">
		{if $tsAction == ''}
			<span>Filtrar:</span><a href="{$tsConfig.url}/mensajes/">Todos</a><a href="{$tsConfig.url}/mensajes/?qt=unread">Sin Leer</a>
		{else}
			<a href="{$tsConfig.url}/mensajes/">Regresar <b>&raquo;</b></a>
		{/if}
	</div>
	{if $tsAction != 'enviados'}
	<div class="timsg">
		<span {if $tsAction != ''}style="margin-left: 10px;"{/if}>Remitente</span>
		<span>Asunto</span>
	</div>
	{/if}
	{if $tsAction == 'enviados'}
	<div class="timsg">
		<span style="margin-left: 10px;">Destinatario</span>
		<span>Asunto</span>
	</div>	
	{/if}
	<ul id="mpList">
		{foreach from=$tsMensajes.data item=mp}
			<li id="mp_{$mp.mp_id}" {if $mp.mp_read_to == 0} class="unread"{/if}>
				{if $tsAction == ''}
				<div class="actims">
					<a href="#" class="qtip read" title="Marcar como le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 0, 1, this); return false;" {if $mp.mp_read_to == 1}style="display:none"{/if}></a>
					<a href="#" class="qtip unread" title="Marcar como no le&iacute;do" onclick="mensaje.marcar('{$mp.mp_id}:{$mp.mp_type}', 1, 1, this); return false;" {if $mp.mp_read_to == 0}style="display:none"{/if}></a>				
				</div>
				{/if}
				<div class="remiss">
					<a class="avgms" href="{$tsConfig.url}/perfil/{$mp.user_name}">
						<img src="{$tsConfig.url}/files/avatar/{$mp.mp_from}_50.jpg" />
					</a>
					<div class="sre">						
						<a href="{$tsConfig.url}/perfil/{$mp.user_name}">{$mp.user_name}</a>
						<span>{$mp.mp_date|fecha:'d_Ms_a'}</span>
					</div>
				</div>
				<div class="ccms">
				<a href="{$tsConfig.url}/mensajes/leer/{$mp.mp_id}">
					<span>{$mp.mp_subject}</span>
					<p>{$mp.mp_preview}</p>
				</a>
				</div>
			</li>
		{/foreach}
	</ul>
	{if $tsMensajes.pages.prev != 0 || $tsMensajes.pages.next != 0}
		<div class="paginador">
			{if $tsMensajes.pages.prev != 0}<div style="text-align:left" class="floatL"><a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.prev}{if $tsQT != ''}&qt=unread{/if}">&laquo; Anterior</a></div>{/if}
			{if $tsMensajes.pages.next != 0}<div style="text-align:right" class="floatR"><a href="{$tsConfig.url}/mensajes/{if $tsAction}{$tsAction}/{/if}?page={$tsMensajes.pages.next}{if $tsQT != ''}&qt=unread{/if}">Siguiente &raquo;</a></div>{/if}
		</div>	
	{/if}
	<div class="fumsen">
		{if $tsAction == ''}
			<span>Filtrar:</span><a href="{$tsConfig.url}/mensajes/">Todos</a><a href="{$tsConfig.url}/mensajes/?qt=unread">Sin Leer</a>
		{else}
			<a href="{$tsConfig.url}/mensajes/">Regresar <b>&raquo;</b></a>
		{/if}
	</div>
{else}
	<div class="nada-gris">No hay mensajes en esta carpeta</div>
{/if}