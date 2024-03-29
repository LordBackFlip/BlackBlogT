{include file='sections/main_header.tpl'}
{if $tsConfig.c_reg_active == 1}
<div id="login_box">
	<div id="ocumile">
		<div class="melogi">
			<h2>Bienvenido a {$tsConfig.titulo}!</h2>
			<p>Crear tu cuenta en {$tsConfig.titulo}! solo te tomará algunos segundos y te permitirá acceder al mejor contenido creado por usuarios como tu</p>
		</div>
		<div class="tiide" style="margin: 10px 0 20px 0;"><span>Registrar</span></div>
	</div>
	<div id="nopw">1:</div>
	<div id="boxms"></div>
	<div id="RegistroForm">
		<div class="pasoUno pasoDos">
			<div class="form-line">
				<label for="nick">Nombre de usuario</label>
				<input name="nick" type="text" id="nick" tabindex="1" title="Ingresa un nombre de usuario &uacute;nico" onfocus="registro.focus(this)" onblur="registro.blur(this)" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>
			<div class="form-line">
				<label for="password">Contrase&ntilde;a deseada</label>
				<input name="password" type="password" id="password" tabindex="2" title="Ingresa una contrase&ntilde;a segura" onfocus="registro.focus(this)" onblur="registro.blur(this)" autocomplete="off" /> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>
			{*
			<div class="form-line">
				<label for="password2">Confirmar contrase&ntilde;a</label>
				<input name="password2" type="password" id="password2" tabindex="3" title="Vuelve a ingresar la contrase&ntilde;a" onfocus="registro.focus(this)" onblur="registro.blur(this)" autocomplete="off" /> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>
			*}
			<div class="form-line">
				<label for="email">E-mail</label>
				<input name="email" type="text" id="email" tabindex="4" title="Ingresa tu direcci&oacute;n de email" onfocus="registro.focus(this)" onblur="registro.blur(this)" onkeydown="registro.clear_time(this.name)" onkeyup="registro.set_time(this.name)" autocomplete="off" /> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>
			<div class="form-line">
				<label>Fecha de nacimiento</label>
				<select id="dia" name="dia" tabindex="5" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese d&iacute;a de nacimiento">
					<option value="">D&iacute;a</option>
					{section name=dias start=1 loop=32}
						<option value="{$smarty.section.dias.index}">{$smarty.section.dias.index}</option>
					{/section}
				</select>
				<select id="mes" name="mes" tabindex="6" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese mes de nacimiento">
					<option value="">Mes</option>
					{foreach from=$tsMeces key=mid item=mes}
						<option value="{$mid}">{$mes}</option>
					{/foreach}	
				</select>
				<select id="anio" name="anio" tabindex="7" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese a&ntilde;o de nacimiento" style="margin-right: 0;">
					<option value="">A&ntilde;o</option>
					{section name=year start=$tsEndY loop=$tsEndY step=-1 max=$tsMax}
						<option value="{$smarty.section.year.index}">{$smarty.section.year.index}</option>
					{/section}
				</select> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>			
			
			
			<!--
			<div class="form-line" id="genero">				
				<label for="sexo">Sexo</label>
				<input class="radio" type="radio" id="sexo_m" tabindex="8" name="sexo" value="1" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero" /> 
				<label class="list-label" for="sexo_m">Masculino</label>
				<input class="radio" type="radio" id="sexo_f" tabindex="8" name="sexo" value="0" onblur="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero" /> 
				<label class="list-label" for="sexo_f">Femenino</label>
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>
			-->

			<div class="form-line">
				<label for="sexo">G&eacute;nero</label>
				<select id="genero" name="sexo" tabindex="8" onblur="registro.blur(this)" onchange="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Selecciona tu g&eacute;nero">
					<option value="">Seleccionar g&eacute;nero</option>
					<option value="1" id="sexo_m">Masculino</option>
					<option value="0" id="sexo_f">Femenino</option>
				</select> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>			
			
			
			
			<div class="form-line">
				<label for="pais">Pa&iacute;s de origen</label>
				<select id="pais" name="pais" tabindex="9" onblur="registro.blur(this)" onchange="registro.blur(this)" onfocus="registro.focus(this)" autocomplete="off" title="Ingrese su pa&iacute;s">
					<option value="">Pa&iacute;s de origen</option>
					{foreach from=$tsPaises key=code item=pais}
						<option value="{$code}">{$pais}</option>
					{/foreach}
				</select> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>        
			<div class="form-line">
				<label for="estado">Estado o regi&oacute;n</label>
				<select title="Ingrese su estado" autocomplete="off" onfocus="registro.focus(this)" onchange="registro.blur(this)" onblur="registro.blur(this)" tabindex="10" name="estado" id="estado">
					<option value="">Regi&oacute;n</option>
				</select> 
				<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
			</div>
			<div class="form-line">
               <label>Confirme humanidad:</label>
               <div class="g-recaptcha" data-sitekey="{$tsConfig.pkey}" style="margin-left: 45px;"></div>
               <div class="help"><span><em></em></span></div>
            </div>
			<div class="footerReg">
				<div class="form-line">
					<input type="checkbox" class="checkbox" id="terminos" name="terminos" tabindex="14" onblur="registro.blur(this)" onfocus="registro.focus(this)" title="Acepta los T&eacute;rminos y Condiciones?" /> 
					<label class="list-label" for="terminos">Acepto los <a href="/pages/terminos-y-condiciones/" target="_blank">T&eacute;rminos y Condiciones de uso</a></label> 
					<div class="help" id="nubex"><span id="puy"></span><span><em></em></span></div>
				</div>
			</div>
		</div>	
		<div class="bolo">
			<a onclick="registro.submit();">Registrar</a>
		</div>	
	</div>
</div>

<div class="fulr">
	<div class="tiide"><span>¿Ya tienes una cuenta?</span></div>
	<a class="boto azul" href="/login?redirect=%2F">Identificarme</a>
	<div class="tiide"><span>Registrate para</span></div>
	<div class="olvi">
		<li>Empezar a interactuar con la comunidad.</li>
		<li>Crear y compartir tu contenido favorito.</li>
		<li>Votar lo que más te gusta del sitio.</li>
		<li>Buscar y seguir amigos.</li>
		<li>Promocionar e incrementar el tráfico a tu sitio.</li>
		<li>Ser parte de la <b>Inteligencia Colectiva!</b></li>
		<span>¡Empieza a participar ahora, es gratis!</span>
	</div>
</div>

<script type="text/javascript">
//
$.getScript("{$tsConfig.js}/registro.js{literal}", function(){
    //Seteo el pais seleccionado
    //registro.datos['pais']='MX';
    //registro.datos_status['pais']='ok';
    //registro.datos_text['pais']='OK';
    //
    registro.change_paso(1);
    
    //Genero el autocomplete de la ciudad
    /*$('#RegistroForm .pasoDos #ciudad').autocomplete('/registro-geo.php', {
        minChars: 2,
        width: 298
    }).result(function(event, data, formatted){
        registro.datos['ciudad_id'] = (data) ? data[1] : '';
        registro.datos['ciudad_text'] = (data) ? data[0].toLowerCase() : '';
        if(data)
            $('#RegistroForm .pasoDos #terminos').focus();
    });*/
    mydialog.procesando_fin();
});
</script>   

<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">
$.getScript("{$tsConfig.js}/registro.js{literal}", function(){
    registro.change_paso(1);
    mydialog.procesando_fin();
});
</script> 
{/literal}
{else}
	<div style="margin: 100px 0;text-align: center;">
		<div id="ocumile">
			<div class="melogi">
				<h2>Bienvenido a {$tsConfig.titulo}!</h2>
				<p>Temporalmente el registro de nuevas cuentas esta desactivado</p>
			</div>
			{*<div class="tiide" style="margin: 10px 0 20px 0;"><span>Registrar</span></div>*}
		</div>
	</div>	
{/if}
{include file='sections/main_footer.tpl'}