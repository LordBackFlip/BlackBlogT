<div class="fullhi">
	<div class="titular" style="margin-bottom: 10px;">
		<h2>Historial de moderaci&oacute;n</h2>
	</div>
{if $tsModHistory}
<div class="com_box_body">
    <table cellpadding="0" cellspacing="0" border="0" align="center" class="com_history">
        <thead>
            <tr>
                <th align="left">Tema</th>
                <th align="center">Acci&oacute;n</th>
                <th align="center">Moderador</th>
                <th align="left">Causa</th>
            </tr>
        </thead>
        <tbody>
			{foreach from=$tsModHistory item=h}
            <tr>
            	<td align="left">
                    {if $h.h_type != 2}
                        <a href="{$tsConfig.url}/comunidades/{$h.c_nombre_corto}/{$h.t_id}/{$h.t_titulo|seo}.html">{$h.t_titulo}</a>
                    {else}
                        {$h.t_titulo}
                    {/if}
                </td>
                <td align="center">{if $h.h_type == 1}Tema Editado{elseif $h.h_type == 2}<font color="red">Tema Eliminado</font>{elseif $h.h_type == 3}<font color="green">Tema Reactivado</font>{/if}</td>
                <td align="center"><a href="{$tsConfig.url}/perfil/{$h.user_name}/" class="hovercard" uid="{$h.user_id}">{$h.user_name}</a></td>
                <td align="left">{$h.h_razon}</td>
            </tr>
            {/foreach}
		</tbody>
    </table>    
</div>
{else}
	<div class="nada-gris">No hay historial de moderaci&oacute;n en la comunidad</div>
{/if}
</div>