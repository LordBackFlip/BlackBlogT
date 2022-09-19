{if $tsCumple.data}
<div class="boxposts separa">
	<div class="titular">
		<h2>Cumplea&ntilde;os</h2>
		<div class="fijoi" style="padding: 0px 0 0px 10px;"><span class="i anos"></span></div>
	</div>		
	<div class="boxreco">
		{foreach from=$tsCumple.data item=u}		
		<div class="cumple">
			<a href="{$tsConfig.url}/perfil/{$u.user_name}">
				<img src="{$tsConfig.url}/files/avatar/{$u.user_id}_50.jpg" alt="{$u.user_name}"/>
			</a>
			<div class="floatR nime">
				<a class="sipe" href="#">{$u.user_name}</a>
				<p class="nope">
					<span class="floatL">{$tsCumple.ano-$u.user_ano} a&ntilde;os</span>
					<a class="floatR" onclick="mensaje.nuevo('{$u.user_name}','','',''); return false">Enviar un mensaje</a>
				</p>
			</div>
		</div>	
		{/foreach}
	</div>	
</div>
{/if}	
