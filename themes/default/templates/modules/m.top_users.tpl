<div class="futopbox">
	<div class="htops">
		<h2>Top usuario con m&aacute;s puntos</h2>
		<span class="i moneda"></span>
	</div>
	<div class="boxtops">
	{if $tsTops.puntos}
		{foreach from=$tsTops.puntos item=u key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<img width="16" height="16" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/>
				<a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a>
				<span>{$u.total}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

<div class="futopbox">
	<div class="htops">
		<h2>Top usuario con m&aacute;s seguidores</h2>
		<span class="i issgu"></span>
	</div>
	<div class="boxtops">
	{if $tsTops.seguidores}
		{foreach from=$tsTops.seguidores item=u key=i}
			<div class="zetops">
				<b>{$i+1}</b>
				<img width="16" height="16" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/>
				<a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a>
				<span>{$u.total}</span>
			</div>
		{/foreach}
	{else}
		<div class="nada-gris">Nada por aqui</div>
	{/if}					
	</div>
</div>

{*

				<div style="float: left; margin-left: 10px; width: 775px;" class="right">
					<!--MEDALLAS-->
                	<div class="boxy xtralarge" style="height: 440px">
                    	<div class="boxy-title">
                            <h3>Top usuario con m&aacute;s medallas</h3>
                            <span class="icon-noti medallas-n"></span>
                        </div>
                        <div class="boxy-content">
                        	{if !$tsTops.medallas}<div class="emptyData">Nada por aqui</div>
                            {else}
                        	<ol>
                            	{foreach from=$tsTops.medallas item=u}
                            	<li class="categoriaUsuario clearfix">
                                    <img width="16" height="16" src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg"/>
                                    <a href="{$tsConfig.url}/perfil/{$u.user_name}">{$u.user_name}</a> <span>{$u.total}</span>
                                </li>
                                {/foreach}
                            </ol>
                            {/if}
                        </div>
                    </div>
                    <div class="clearBoth"></div>         
                </div>
*}