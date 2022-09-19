{if $tsAutor.user_id == $tsUser->uid || $tsCom.mi_rango >= 4 || $tsUser->is_admod}
<div class="boxposts separa">
	<div class="titular">
		<h2>Opciones</h2>
	</div>
	<div class="normab">
        {if $tsTema.t_estado == 1}
        	<a onclick="com.reactivar_tema();" class="boto azul" style="width: 256px;margin: 0;"></i>Reactivar</a>
        {else}            
            {if $tsAutor.user_id == $tsUser->uid}
				<a onclick="com.del_tema();" class="boto rojo">Eliminar</a>
            {else}
				<a onclick="com.del_mod_tema();" class="boto rojo">Eliminar</a>
            {/if}
			<a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/editar-tema/{$tsTema.t_id}/" class="boto gris">Editar</a>
        {/if}	
	</div>
</div>	
{/if}