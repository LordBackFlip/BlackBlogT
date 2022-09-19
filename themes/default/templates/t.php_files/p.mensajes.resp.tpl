1:
<div class="limps">
	<a href="{$tsConfig.url}/perfil/{$tsUser->nick}" class="remispe">
		<img src="{$tsConfig.url}/files/avatar/{$tsUser->uid}_50.jpg" />
	</a>
	<div class="rbody">
		<div class="smere">
			@<a href="{$tsConfig.url}/perfil/{$tsUser->nick}">{$tsUser->nick}</a> 
			<span class="mp-date">{$mp.mp_date|hace:true}</span>
		</div>
		<p>{$mp.mp_body|nl2br}</p>
	</div>
</div>