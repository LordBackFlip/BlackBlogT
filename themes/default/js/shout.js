var publico = {
    maxWidth: 574, // WIDTH PARA LAS FOTOS Y VIDEOS
    stream: {
        total: 0, // TOTAL DE PUBLICACIONES CARGADAS
        show: 10, // CUANTOS SE MUESTRAN POR CADA CARGA
        type: 'status', // TIPO D PUBLICACION ACTUAL
        status: 0, // PARA EVITAR CLICKS INESESARIOS
        adjunto: '', // SE HA CARGADO UN ARCHIVO ADJUNTO?
        // CARGAR EL TIPO DE PUBLICACION :
        load: function(aid, obj){
            // ACTUAL
            publico.stream.type = aid;
            //
            var atxt = (publico.stream.type == 'foto') ? 'a' : 'e';
            atxt = 'Haz un comentario sobre est' + atxt + ' ' + publico.stream.type + '...';
            //
            if(aid != 'status') {
                $('.btnStatus').hide();				
                $('.SattaDesc').show();
                //
                $('#SattaDesc').attr('title', atxt).val(atxt);
            } else {
                $('.btnStatus').show();
                $('.SattaDesc').hide();
                //$('.framefForm').css('border-bottom', '1px solid #E9E9E9');
            }
            //
            $('span.uiComposer .nub, span.uiComposer span').hide();
            $('span.uiComposer a').show();
            $(obj).hide().parent().find('span, i').show();
            // 
            $('#BattaContent > div').hide();
            $('#' + aid + 'SFrameS').css('display', 'flex'); 
			$('#' + aid + 'SFrameS textarea').focus();
			$('#' + aid + 'SFrameS input').focus();
			$('#' + aid + 'SFrameS input').val('');			
            // 
            return false;
        },
        // ADJUNTAR ARCHIVO EXTERNO : FOTO, ENLACE, VIDEO DE YOUTBE
        adjuntar: function(){
            // SI ESTA OCUPADO NO HACEMOS NADA
            if(publico.stream.status == 1) return false;
            else publico.stream.status = 1;
            // LOADER
            publico.stream.loader(true);
            // FUNCION
            var inpt = $('input[name=u' + publico.stream.type + ']');
//            inpt.attr('disabled', 'true');
            var valid = publico.stream.validar(inpt);
            if(valid == true){
                // ADJUNTAMOS...
                publico.stream.ajaxCheck(inpt.val(), inpt);
            } else {
				shout.close();				
				publico.stream.load('status', this);				
				mydialog.alert('Error al publicar', valid);				
                // LOADER / DISABLED / STATUS
                publico.stream.loader(false);
//                inpt.attr('disabled', '');
                publico.stream.status = 0;
            }
        },
        // VERIFICAR ARCHIVO
        ajaxCheck: function(url, inpt){
            $('#loading').fadeIn(250);
			$('#barcaB').show();
			$('#BattaContent').hide();			
            $.ajax({
            	type: 'POST',
            	url: global_data.url + '/muro-stream.php?do=check&type=' + publico.stream.type,
            	data: 'url=' + encodeURIComponent(url),
            	success: function(h){
            		switch(h.charAt(0)){
            			case '0': //Error
                            mydialog.alert('Error al publicar', h.substring(3));
                            //inpt.attr('disabled', '');
            				break;
            			case '1': //OK
                            publico.stream.adjunto = inpt.val();
							$('#FajuFull').show();
							$('#FajuFull').html(h.substring(3));
							$('#' + publico.stream.type + 'SFrameS').hide();							
							if(publico.stream.type == 'video'){
								$('.vContent').show();
								$('.vDesc').show();
								$('.vContent div').show();
							}
            				break;
            		}
                    $('#loading').fadeOut(350); 
					$('#barcaB').hide();	
					$('#BattaContent').show();
            	},
                complete: function (){
                    // LOADER/ STATUS
                    publico.stream.loader(false);
                    publico.stream.status = 0;
                    $('#loading').fadeOut(350); 
					$('#barcaB').hide();
					$('#BattaContent').show();
                }
            });
        },
        // VALIDAR LAS URL DE LOS ARCHIVOS ADJUNTOS
        validar: function(inpt){
            var val = inpt.val();
            var regex = /^(ht|f)tps?:\/\/\w+([\.\-\w]+)?\.([a-z]{2,3}|info|mobi|aero|asia|name)(:\d{2,5})?(\/)?((\/).+)?$/i;
            //
            if(val == '' || val == inpt.attr('title') || regex.test(val) == false) return 'Debes ingresar una direcci&oacute;n URL v&aacute;lida.';
            else {
                switch(publico.stream.type){
                    case 'foto':
                        inpt.val(val.replace(' ', ''));
                        var ext = inpt.val().substr(-3);
                        if(ext != 'gif' && ext != 'png' && ext != 'jpg') return 'S&oacute;lo se permiten im&aacute;genes .gif, .png y .jpg';
                    break;
                    case 'video':
                        var video_id = val.split('watch?v=');
                        // NO ES VALIDO : DE MOMENTO
                        if(!video_id[1]) return 'Al parecer la url del video no es v&aacute;lida. Recuerda que solo puedes compartir videos de YouTube.';
                    break;
                }
                //
                return true;
            }
        },
        // COMPARTIR
        compartir: function(){
            // SI ESTA OCUPADO NO HACEMOS NADA
            if(publico.stream.status == 1) return false;
            else publico.stream.status = 1;
            // LOADER
            publico.stream.loader(true);
            // 
            var error_length = 'Las publicaciones de estado y/o comentarios deben ser inferiores a 420 caracteres. Ya has ingresado ';
            // ARCHIVOS ADJUNTOS
            if(publico.stream.type != 'status'){
                if(publico.stream.adjunto != ''){
                    var val = $('#SattaDesc').val();
                    // VALIDAR
                    if(val.length > 420) {
                        mydialog.alert('Error al publicar', error_length + val.length + ' caracteres.');
                        // LOADER/ STATUS
                        publico.stream.loader(false);
                        publico.stream.status = 0;
                    }
                    // ENVIAMOS PUBLICACION
                    else {
                        val = (val == $('#SattaDesc').attr('title')) ? '' : val;
                        publico.stream.ajaxPost(val);
                    }
                    
                } else {
					shout.close();
                    mydialog.alert('Error al publicar', 'Ingresa la <b>URL</b> en el campo de texto y a continuaci&oacute;n da clic en <b>Adjuntar</b>.');
                    // LOADER/ STATUS
                    publico.stream.loader(false);
                    publico.stream.status = 0;
                }
            // PUBLICACION SIMPLE
            } else if(publico.stream.type == 'status'){
                var status = $('#welle');
                var val = status.val();
                var error = false;
                // VALIDAR
                if(val == '' || val == status.attr('title')) {
                    status.blur(); 
                    error = true;
                    // LOADER/ STATUS
                    publico.stream.loader(false);
                    publico.stream.status = 0; 
                    return false;
                }
                else if(val.length > 420) error = error_length + val.length + ' caracteres.';
                // ENVIAR PUBLICACION
                if(error == false){
                    publico.stream.ajaxPost(val);
                } else {
                    mydialog.alert('Error al publicar', error);
                    // LOADER/ STATUS
					publico.stream.load('status', this);
                    publico.stream.loader(false);
                    publico.stream.status = 0;
                }
            }
        },
        // POSTEAR EN EL MURO
        ajaxPost: function(data){
            $('#loading').slideDown(250);
			//DETERMINAR TIPO DE PRIVACIDAD DEL SHOUT BY TO-UP
			privacidad = $('.marcado').attr('data-value');			
			//
            $.ajax({
            	type: 'POST',
            	url: global_data.url + '/muro-stream.php?do=post&type=' + publico.stream.type,
            	data: 'adj=' + publico.stream.adjunto +'&data=' + encodeURIComponent(data) + '&pid=' + $('#jrtoup').attr('pid') + '&privacidad=' + privacidad,
            	success: function(h){
            		switch(h.charAt(0)){
            			case '0': //Error
                            mydialog.alert('Error al publicar', h.substring(3));
						break;
            			case '1': //OK
                            // ESCONDEMOS SI ES EL PRIMER COMENTARIO
                            if($('#solouno')) $('#solouno').hide();
                            //
							$('#wall-content, #news-content, #destacados-content, #populares-content, #publico-content').prepend($(h.substring(3)).fadeIn('slow'));
                            $('#welle').val('').focus();
                            publico.stream.load('status',$('#stMain'));
							$('#pprivami').find('a').removeClass('marcado');
							//$('.fframeForm').hide();
							//$('.yafue').show();
							shout.close();
							//$.scrollTo($('#news-content'), 500);
							filtrar_shout('3');
						break;
            		}
                    $('#loading').slideUp(350); 
            	},
                complete: function (){
                    // LOADER/ STATUS
                    publico.stream.loader(false);
                    publico.stream.status = 0;
                    $('#loading').fadeOut(350); 
                }
            });
        },
        // LOADER
        loader: function(active){
            if(active == true) $('.streamLoader').show();
            else if(active == false) $('.streamLoader').hide();
        }
    }
    //
}

/** READY **/
$(function(){
    // ADJUNTAR
    $('.adj').click(function(){
        var aid = $(this).attr('aid');
    })
    $('input[name=hack]').live("focus",function(){
        $(this).hide();
        $(this).parent().find('div.formulario').show();
        var pub_id = $(this).attr('pid');
        //
        $('#cf_' + pub_id).focus();
    }) 
});

//PRIVACIDAD EN EL SHOUT BY TO-UP
$('#ffulls').live('click', function(event){
	var el_list = $(this).next();
	if($(el_list).is(':visible')){
		$('body').click();
		return;
	}else{	
		$(el_list).show();
	}
});

$('body').click(function(event){
	if(!$(event.target).is('#ffulls'))
	$('#ffulls').next().hide();
});

$('#ffulls + #pprivami a').live('click', function(){
	$(this).closest('#pprivami').find('a').removeClass('marcado');
	$(this).closest('a').addClass('marcado');
});