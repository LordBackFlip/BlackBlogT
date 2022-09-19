<div class="boxposts separa">
	<div class="titular" style="margin-bottom: 0;">
		<h2>Staff de la Comunidad</h2>
	</div>
	<div class="boxposts">
		<div class="lss">
			{foreach from=$tsStaff item=a}
				<a href="{$tsConfig.url}/perfil/{$a.user_name}" uid="{$a.m_user}" class="floatL hovercard com_staff_avatar {if $a.m_permisos == 5}admin{/if}">
					<img src="{$tsConfig.url}/files/avatar/{$a.m_user}_120.jpg"/>
					<span class="csa_status {if $a.is_on}online{/if}" title="{if $a.is_on}Online{else}Offline{/if}"></span>
				</a>				
			{/foreach}
		</div>		        
	</div>
</div>