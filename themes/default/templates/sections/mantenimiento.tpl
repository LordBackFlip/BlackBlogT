{include file='sections/main_header.tpl'}
<script type="text/javascript" src="{$tsConfig.tema.t_url}/js/login.js"></script>
<div id="mantenimiento">
<div id="login_box">
	<div class="melogi">
		<h2>Bienvenido a {$tsConfig.titulo}!</h2>
		<p>Te damos la bienvenida nuevamente a nuestra gran familia</p>
	</div>
	<div class="tiide"><span>Identificarme</span></div>
	<div class="login_cuerpo">
		<span id="login_carga"></span>
		<div id="login_error"></div>
		<form action="javascript:login_ajax()" method="post">
			<div id="log">
				<label>Nombre de usuario</label>
				<input type="text" id="nickname" name="nick" onblur="demoo('nickname');" onfocus="demo('nickname');" maxlength="64">
				<div id="vernickname"><span></span><p>Ingresa tu nombre de usuario</p></div>
			</div>
			<div id="log">
				<label>T&uacute; Contraseña</label>
				<input type="password" id="password" name="pass" onblur="demoo('password');" onfocus="demo('password');" maxlength="64">
				<div id="verpassword"><span></span><p>Ingresa tu contase&ntilde;a</p></div>
			</div>
			<input type="checkbox" id="rem" name="rem" value="true" checked="checked" style="display:none;"/>
			<div class="bolo"> <input type="submit" value="Iniciar Sesi&oacute;n"></div>
		</form>						
	</div>
</div>
<div class="fulr" style="padding: 0;background: #fff;height: 423px;width: 395px;color:#000;">
	<div style="text-align:center">	
		<h3>{$tsConfig.offline_message}</h3>
		<img src="{$tsConfig.tema.t_url}/i/mantenimiento.png" width="250" height="324" />
	</div>
</div>	
</div>	
{include file='sections/main_footer.tpl'}                                    