{foreach from=$tsMuro.data item=p}
	<div class="Story">
		<div class="boxreshout">
			<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="Story_Pic">
				<img alt="{$p.user_name}" src="{$tsConfig.url}/files/avatar/{$p.post_user}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
			</a>		
		</div>	
		<div class="Story_Content">
			<span class="pushot"></span>
			<div class="Story_Head">
				<div class="quiendi"> 
					@<a href="{$tsConfig.url}/perfil/{$p.user_name}" class="a_blue">{$p.user_name}</a> cre&oacute; un nuevo post
				</div>
				<div id="bodypost">
				<a href="{$tsConfig.url}/posts/{$p.c_seo}/{$p.post_id}/{$p.post_title|seo}.html">{$p.post_title|limit:60}</a>				
				<p>{if $p.c_html}{$p.c_html|limit:400}{else}...{/if}</p>
				</div>
			</div>
			<div class="Story_Foot">
				<div class="lefsho">
					<img src="{$tsConfig.tema.t_url}/images/icons/cat/{$p.c_img}"/>
					<a>{$p.post_date|fecha}</a>
				</div>
				<div class="shofo">
					<a class="abrir" href="#">{$p.post_comments} comentarios</a>					
				</div>
			</div>	
		</div>
	</div>		
{/foreach}