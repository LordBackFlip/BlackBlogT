{if $tsUser->is_member}
	{foreach from=$tsMuro.data item=p}
		{if $tsType == 'story'}
			{if $p.p_user == $tsUser->uid || $p.p_user_pub == $tsUser->uid || $tsUser->is_admod || $tsUser->permisos.moepm}
			<div class="boxposts separa">
				<div class="titular">
					<h2>Opciones</h2>
				</div>
				<div class="opcsh">
					<a class="boto gris" onclick="muro.eliminar_abierto('{$p.pub_id}','1','{if $p.p_user == $p.p_user_pub}{$p.user_name}{else}{$tsInfo.nick}{/if}'); return false;">{*<img alt="Borrar" src="{$tsConfig.tema.t_url}/i/borrar.png"/>*}Eliminar Shout</a>
					<!--<a class="boto gris"><img alt="Editar" src="{$tsConfig.tema.t_url}/i/editar.png">Editar</a>-->
				</div>			
			</div>
			{/if}			
		{/if}	
	{/foreach}
{/if}