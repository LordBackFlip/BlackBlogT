		<div class="titular">
			<h2>En vivo</h2>
		</div>	
		<div class="hvivo">
			<span class="huno">USUARIO</span>
			<span class="hdos">ACCI&Oacute;N</span>
			<span class="htres">T&Iacute;TULO</span>
		</div>
		{foreach from=$tsData.data item=n}
			<div class="hbox">
				<!--{$n.user_id}-{$n.user_name}-{$n.ac_type}-->
				<div class="huno">
					<a href="/perfil/{$n.user_name}">{$n.user_name}</a>
				</div>
				<div class="hdos" style="{if $n.ac_type == 1 || $n.ac_type == 2 || $n.ac_type == 3 || $n.ac_type == 4 || $n.ac_type == 5 || $n.ac_type == 6 || $n.ac_type == 7}color:#004a95;{/if}{if $n.ac_type == 8}color:#ed145b;{/if}{if $n.ac_type == 9}color:#7cc576;{/if}{if $n.ac_type == 10 || $n.ac_type == 11}color:#77AABC;{/if}">
					{if $n.ac_type == 1}Creó un nuevo post{/if}		
					{if $n.ac_type == 2}Agregó un post a favoritos{/if}
					{if $n.ac_type == 3}Votó un post{/if}
					{if $n.ac_type == 4}Recomend&oacute; un post{/if}
					{if $n.ac_type == 5}Nuevo comentario en el post{/if}
					{if $n.ac_type == 6}Votó un comentario en el post{/if}
					{if $n.ac_type == 7}Est&aacute; siguiendo un post{/if}
					<!---->					
					{if $n.ac_type == 8}Está siguiendo a un usuario{/if}
					{if $n.ac_type == 9}Subió una nueva foto{/if}
					<!--Actividad Shout-->
					{if $n.ac_type == 10}
						{if $n.obj_dos == 0}Creó un nuevo shout{/if}
						{if $n.obj_dos == 1}Coment&oacute; su shout{/if}
						<!---->
						{if $n.obj_dos == 2}Cre&oacute; un shout en un muro{/if}
						{if $n.obj_dos == 3}Coment&oacute; en un shout{/if}
					{/if}
					<!--Actividad Me gusta-->
					{if $n.ac_type == 11}
						{if $n.obj_dos == 0}Le gusto su shout{/if}
						{if $n.obj_dos == 1}Le gusto un comentario en su shout{/if}
						<!---->
						{if $n.obj_dos == 2}Le gusto un shout{/if}
						{if $n.obj_dos == 3}Le gusto un comentario en un shout{/if}		
					{/if}
				</div>
				<div class="htres">
					{if $n.ac_type == 10 || $n.ac_type == 11}
						<a>Shout</a>
					{/if}
					{if $n.ac_type == 9}
						<a>Foto</a>
					{/if}
					{if $n.ac_type == 8}
						<a href="/perfil/{$tsUser->getUserName($n.obj_uno)}">{$tsUser->getUserName($n.obj_uno)}</a>
					{/if}	
					{if $n.ac_type == 1 || $n.ac_type == 2 || $n.ac_type == 3 || $n.ac_type == 4 || $n.ac_type == 5 || $n.ac_type == 6 || $n.ac_type == 7}
						<a href="#">{$n.post_title|limit:50}</a>
					{/if}					
				</div>
			</div>
		{/foreach}