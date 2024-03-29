<div class="boxy-title">
	<h3>Centro de Administraci&oacute;n</h3>
</div>
<div id="res" class="boxy-content">
	<div class="boes">
	<b>Bienvenido, {$tsUser->nick}!</b>Aqu&iacute; puedes configurar tu sitio web, modificar usuarios, modificar posts, y muchas otras cosas.
	</div>	
	<div  class="box-ver">
		<h2>Informaci&oacute;n del sitio</h2>
		<div class="muvx">
			<p>Versi&oacute;n instalada: <b>{$tsConfig.version}</b></p>
			<p>Fundaci&oacute;n: <b>{$tsInst.0|fecha}</b></p>
			<p>Actualizado: <b>{$tsInst.1|fecha}</b></p>
		</div>
	</div>
	<div  class="box-ver">
		<h2>Administradores</h2>
		<div class="muvx">
			{foreach from=$tsAdmins item=admin}
				<div class="usadm">
					<a href="{$tsConfig.url}/perfil/{$admin.user_name}" class="hovercard" uid="{$admin.user_id}">
						<img alt="Avatar del Usuario" src="{$tsConfig.url}/files/avatar/{$admin.user_id}_50.jpg?{$smarty.now|date_format:'%Y%m%d%H%M%S'}"/>
					</a>
					<a href="{$tsConfig.url}/perfil/{$admin.user_name}" class="hovercard" uid="{$admin.user_id}">{$admin.user_name}</a>
				</div>                                  				
			{/foreach}		
		</div>
	</div>		
	
	


<!--	
	<div class="phpost version">
		<h1>PHPost Risus</h1>
		<ul id="version_pp" class="pp_list">
			<li>
				<div class="title">Versi&oacute;n instalada</div>
				<div class="body"><b>{$tsConfig.version}</b></div>
			</li>
		</ul>
		<h1>Administradores</h1>
		<ul class="pp_list">                                    
			{foreach from=$tsAdmins item=admin}
				<li><div class="title"><a href="{$tsConfig.url}/perfil/{$admin.user_name}" class="hovercard" uid="{$admin.user_id}">{$admin.user_name}</a></div></li>                                    
			{/foreach}
		</ul>
		<div class="estadisticasList" style="border: 1px solid #ddd;padding: 10px 10px 0 10px;">
			<h6 style="font-size: 12px;margin: 0;">Instalaciones</h6>
			<ul>
				<li class="clearfix">
					<span class="floatL">&nbsp; Fundaci&oacute;n</span>
					<span class="floatR number" title="{$tsInst.0|fecha}">{$tsInst.0|hace:true} &nbsp;</span>
				</li>
				<li class="clearfix">
					<span class="floatL">&nbsp; Actualizado</span>
					<span class="floatR number" title="{$tsInst.1|fecha}">{$tsInst.1|hace:true} &nbsp;</span>
				</li>
			</ul>
		</div>                                    
	</div>
-->
</div>
{*
{literal}
<script type="text/javascript">
$(document).ready(function(){
    $.ajax({
        type: "GET",
        url: global_data.url + "/feed-support.php",
        dataType: "json",
        success: function(r) {
            $('#news_pp').html('');
            for(var i = 0; i < r.length; i++){
                //
                var html = '<li>';
                html += '<div class="title"><a href="' + r[i].link + '" target="_blank">' + r[i].title +'</a></div>';
                html += '<div class="body">' + r[i].info +'</div>';
                html += '</li>';
                //
                $('#news_pp').append(html);
            }
    	}
    });
    $.ajax({
        type: "GET",
        url: global_data.url + "/feed-version.php?v=risus",
        dataType: "json",
        success: function(r) {
            for(var i = 0; i < r.length; i++){
                //
                var html = '<li>';
                html += '<div class="title">' + r[i].title +'</div>';
                html += '<div class="body">' + r[i].text +'</div>';
                html += '</li>';
                //
                $('#version_pp').append(html);
            }
    	}
    });
});
</script>
{/literal}
*}