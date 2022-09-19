function login_ajax(form, connect){
	var el = new Array(), params = '';
	if (form == 'registro-logueo' || form == 'logueo-form') {
		el['nick'] = $('.reg-login .login-panel #nickname');
		el['pass'] = $('.reg-login .login-panel #password');
		el['error'] = $('.reg-login .login-panel #login_error');
		el['cargando'] = $('.reg-login .login-panel #login_cargando');
		el['cuerpo'] = $('.reg-login .login-panel .login_cuerpo');
		el['button'] = $('.reg-login .login-panel input[type="submit"]');
	} else {
		el['nick'] = $('#login_box #nickname');
		el['pass'] = $('#login_box #password');
		el['error'] = $('#login_box #login_error');
		el['cargando'] = $('#login_box #login_cargando');
		el['cuerpo'] = $('#login_box .login_cuerpo');
		el['button'] = $('#login_box input[type="submit"]');
	}
	if (typeof connect != 'undefined') {
		params = 'connect=facebook';
	} else {
		if (empty($(el['nick']).val())) {
			$(el['nick']).focus();
			return;
		}
		if (empty($(el['pass']).val())) {
			$(el['pass']).focus();
			return;
		}
		$(el['error']).css('display', 'none');
		$(el['cargando']).css('display', 'block');
		$(el['button']).attr('disabled', 'disabled').addClass('disabled');
		var remember = ($('#rem').is(':checked')) ? 'true' : 'false';
		params = 'nick='+encodeURIComponent($(el['nick']).val())+'&pass='+encodeURIComponent($(el['pass']).val())+'&rem='+remember;
		if (form == 'logueo-form') {
			params += '&facebook=1';
		}
	}
    $('#loading').fadeIn(250);    
	$('#login_carga').css('display', 'block');
	$.ajax({
		type: 'post', url: global_data.url + '/login-user.php', cache: false, data: params,
		success: function (h) {
			switch(h.charAt(0)){
				case '0':
					$(el['error']).html(h.substring(3)).show();
					$(el['nick']).focus();
					$(el['button']).removeAttr('disabled').removeClass('disabled');
					break;
				case '1':
					if (form != 'registro-logueo') {
						//close_login_box();						
						$('.fulr').css('opacity', .5);
						$('#login_box').css('opacity', .5);
						$('#login_carga').css('display', 'block');
					}
					if (h.substring(3)=='Home') {
						location.href='/';
					} else if (h.substr(3) == 'Cuenta') {
						location.href = '/cuenta/';
					} else {
						location.href='/';
					}
                    $('#loading').fadeOut(350);
					break;
				case '2':
					$(el['cuerpo']).css('text-align', 'center').css('line-height', '150%').html(h.substring(3));
					break;
				case '3':
					open_login_box();
					mydialog.class_aux = 'registro';
					mydialog.mask_close = false;
					mydialog.close_button = true;
					mydialog.show(true);
					mydialog.title('Ingresar');
					mydialog.body('<br /><br />', 305);
					mydialog.buttons(false);
					mydialog.procesando_inicio('Cargando...', 'Registro');
					mydialog.center();
					$.ajax({
						type: 'POST',
						url: global_data.url + '/login-form.php',
						data: '',
						success: function(h){
							mydialog.procesando_fin();
							switch(h.charAt(0)){
								case '0':
									mydialog.alert('Error', h.substring(3));
									break;
								case '1':
									mydialog.body(h.substring(3), 305);
							}
							mydialog.center();
						}
					});

			}
		},
		error: function() {
			$(el['error']).html(lang['error procesar']).show();
		},
		complete: function(){
			$(el['cargando']).css('display', 'none');
			$('#login_carga').css('display', 'none');
			$('#loading').fadeOut(250);
		}
	});
}

$(document).ready(function(){
	$('#nickname').focus();
});	

function demo(a){
	$('#ver'+a).show();
}

function demoo(b){
	$('#ver'+b).hide();
}