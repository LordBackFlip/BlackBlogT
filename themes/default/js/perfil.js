/*
    PERFIL
*/
var perfil = {
    cache: {},
    load_tab:function(type, obj){
        // CSS
        $('#tabs_menu_new > li').removeClass('viendo');
        $(obj).parent().addClass('viendo');		
        //
        $('#perfil_content > div').hide();
        $('#perfil_load').show();
        // CARGAMOS
        perfil.cargar(type);
    },
    // CARGAR CONTENIDO
    cargar: function(type){
        //
        var status = $('#perfil_' + type).attr('status');
        if(status == 'activo') {
            // LOADER/ STATUS
            $('#perfil_load').hide();
            $('#perfil_' + type).fadeIn();
            return true;   
        }
        //
        $('#loading').slideDown(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/perfil-' + type + '.php',
        	data: 'pid=' + $('#info').attr('pid'),
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error', h.substring(3));
        				break;
        			case '1': //OK
                        if(typeof perfil.cache[type] == 'undefined'){
                            $('#perfil_content').append(h.substring(3));
                            $('#perfil_' + type).fadeIn();
                            perfil.cache[type] = true;
                        }
        				break;
        		}
                // LOADER/ STATUS
                $('#perfil_load').hide();
                $('#loading').slideUp(350); 
        	}
        });
    },
    // CARGAR PAGINAS DE LOS SEGUIDORES!
    follows:function(type, page){
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/perfil-' + type + '.php?hide=true&page=' + page,
        	data: 'pid=' + $('#info').attr('pid'),
        	success: function(h){
                $('#perfil_' + type).html(h.substring(3));
        	}
        });
    }
}
/** ACTIVIDAD **/
var actividad = {
    total: 25,
    show: 25,
    cargar: function(id, ac_do, ac_type){
        // ELIMINAR
        $('#last-activity-view-more').remove();
        if(ac_do == 'filtrar') actividad.total = 0;
        // ENVIAMOS
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/perfil-actividad.php',
        	data: 'pid=' + $('#info').attr('pid') + '&ac_type=' + ac_type + '&do=' + ac_do + '&start=' + actividad.total,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error', h.substring(3));
        				break;
        			case '1': //OK
                            if(ac_do == 'more')
                                $('#last-activity-container').append(h.substring(3));
                            else 
                                $('#last-activity-container').html(h.substring(3));
                            // TOTALES
                            var total_pubs = $('#total_acts').attr('val');
                            actividad.total = actividad.total + parseInt(total_pubs);
                            $('#total_acts').remove();
        				break;
        		}
        	}
        });
    },
    borrar: function(id, obj){
        // ENVIAMOS
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/perfil-actividad.php',
        	data: 'pid=' + $('#info').attr('pid') + '&acid=' + id + '&do=borrar',
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error', h.substring(3));
        				break;
        			case '1': //OK
                        $(obj).parent().parent().parent().remove();
        				break;
        		}
        	}
        });
    }
}
/** MURO **/
var muro = {
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
            muro.stream.type = aid;
            //
            var atxt = (muro.stream.type == 'foto') ? 'a' : 'e';
            atxt = 'Haz un comentario sobre est' + atxt + ' ' + muro.stream.type + '...';
            //
            if(aid != 'status') {
                $('.btnStatus').hide();				
                $('.attaDesc').show();
                //
                $('#attaDesc').attr('title', atxt).val(atxt);
            } else {
                $('.btnStatus').show();
                $('.attaDesc').hide();
                //$('.frameForm').css('border-bottom', '1px solid #E9E9E9');
            }
            //
            $('span.uiComposer .nub, span.uiComposer span').hide();
            $('span.uiComposer a').show();
            $(obj).hide().parent().find('span, i').show();
            // 
            $('#attaContent > div').hide();
            $('#' + aid + 'Frame').show(); 
			$('#' + aid + 'Frame textarea').focus();
			$('#' + aid + 'Frame input').focus();			
            // 
            return false;
        },
        // ADJUNTAR ARCHIVO EXTERNO : FOTO, ENLACE, VIDEO DE YOUTBE
        adjuntar: function(){
            // SI ESTA OCUPADO NO HACEMOS NADA
            if(muro.stream.status == 1) return false;
            else muro.stream.status = 1;
            // LOADER
            muro.stream.loader(true);
            // FUNCION
            var inpt = $('input[name=i' + muro.stream.type + ']');
//            inpt.attr('disabled', 'true');
            var valid = muro.stream.validar(inpt);
            if(valid == true){
                // ADJUNTAMOS...
                muro.stream.ajaxCheck(inpt.val(), inpt);
            } else {
                mydialog.alert('Error al publicar', valid);
                // LOADER / DISABLED / STATUS
                muro.stream.loader(false);
//                inpt.attr('disabled', '');
                muro.stream.status = 0;
            }
        },
        // VERIFICAR ARCHIVO
        ajaxCheck: function(url, inpt){
            $('#loading').fadeIn(250);
			$('#barca').show();
			$('#attaContent').hide();			
            $.ajax({
            	type: 'POST',
            	url: global_data.url + '/muro-stream.php?do=check&type=' + muro.stream.type,
            	data: 'url=' + encodeURIComponent(url),
            	success: function(h){
            		switch(h.charAt(0)){
            			case '0': //Error
                            mydialog.alert('Error al publicar', h.substring(3));
                            //inpt.attr('disabled', '');
            				break;
            			case '1': //OK
                            muro.stream.adjunto = inpt.val();
							$('#ajuFull').show();
							$('#ajuFull').html(h.substring(3));
							$('#' + muro.stream.type + 'Frame').hide();							
							if(muro.stream.type == 'video'){
								$('.vContent').show();
								$('.vDesc').show();
								$('.vContent div').show();
							}
            				break;
            		}
                    $('#loading').fadeOut(350); 
					$('#barca').hide();	
					$('#attaContent').show();
            	},
                complete: function (){
                    // LOADER/ STATUS
                    muro.stream.loader(false);
                    muro.stream.status = 0;
                    $('#loading').fadeOut(350); 
					$('#barca').hide();
					$('#attaContent').show();
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
                switch(muro.stream.type){
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
            if(muro.stream.status == 1) return false;
            else muro.stream.status = 1;
            // LOADER
            muro.stream.loader(true);
            // 
            var error_length = 'Las publicaciones de estado y/o comentarios deben ser inferiores a 420 caracteres. Ya has ingresado ';
            // ARCHIVOS ADJUNTOS
            if(muro.stream.type != 'status'){
                if(muro.stream.adjunto != ''){
                    var val = $('#attaDesc').val();
                    // VALIDAR
                    if(val.length > 420) {
                        mydialog.alert('Error al publicar', error_length + val.length + ' caracteres.');
                        // LOADER/ STATUS
                        muro.stream.loader(false);
                        muro.stream.status = 0;
                    }
                    // ENVIAMOS PUBLICACION
                    else {
                        val = (val == $('#attaDesc').attr('title')) ? '' : val;
                        muro.stream.ajaxPost(val);
                    }
                    
                } else {
                    mydialog.alert('Error al publicar', 'Ingresa la <b>URL</b> en el campo de texto y a continuaci&oacute;n da clic en <b>Adjuntar</b>.');
                    // LOADER/ STATUS
                    muro.stream.loader(false);
                    muro.stream.status = 0;
                }
            // PUBLICACION SIMPLE
            } else if(muro.stream.type == 'status'){
                var status = $('#wall');
                var val = status.val();
                var error = false;
                // VALIDAR
                if(val == '' || val == status.attr('title')) {
                    status.blur(); 
                    error = true;
                    // LOADER/ STATUS
                    muro.stream.loader(false);
                    muro.stream.status = 0; 
                    return false;
                }
                else if(val.length > 420) error = error_length + val.length + ' caracteres.';
                // ENVIAR PUBLICACION
                if(error == false){
                    muro.stream.ajaxPost(val);
                } else {
                    mydialog.alert('Error al publicar', error);
                    // LOADER/ STATUS
                    muro.stream.loader(false);
                    muro.stream.status = 0;
                }
            }
        },
        // POSTEAR EN EL MURO
        ajaxPost: function(data){
            $('#loading').slideDown(250);
//			porno = $('#p_porno').attr('checked') == 'checked' ? 1 : 0;
			//DETERMINAR TIPO DE PRIVACIDAD DEL SHOUT BY TO-UP
			privacidad = $('.marcado').attr('data-value');			
			//
            $.ajax({
            	type: 'POST',
            	url: global_data.url + '/muro-stream.php?do=post&type=' + muro.stream.type,
            	data: 'adj=' + muro.stream.adjunto +'&data=' + encodeURIComponent(data) + '&pid=' + $('#info').attr('pid') + '&privacidad=' + privacidad,
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
                            $('#wall').val('').focus();
                            muro.stream.load('status',$('#stMain'));
							$('#privami').find('a').removeClass('marcado');
							//$.scrollTo($('#news-content'), 500);
						break;
            		}
                    $('#loading').slideUp(350); 
            	},
                complete: function (){
                    // LOADER/ STATUS
                    muro.stream.loader(false);
                    muro.stream.status = 0;
                    $('#loading').fadeOut(350); 
                }
            });
        },
        loadMore: function(type){
            // SI ESTA OCUPADO NO HACEMOS NADA
            if(muro.stream.status == 1) return false;
            else muro.stream.status = 1;
            // LOADER
            $('.more-pubs a').hide();
            $('.more-pubs span').css('display','block');
            // CARGAMOS
            $('#loading').fadeIn(250); 
            $.ajax({
            	type: 'POST',
            	url: global_data.url + '/muro-stream.php?do=more&type=' + type,
//				data: 'pid=' + $('#info').attr('pid') + '&start=' + muro.stream.total,
            	data: 'pid=' + $('#info').attr('pid') + '&start=' + muro.stream.total  + '&tipo=' + muro.stream.tipo + '&acciones=' + muro.stream.acciones + '&tiempos=' + muro.stream.tiempos,
            	success: function(h){
            		switch(h.charAt(0)){
            			case '0': //Error
                            mydialog.alert('Error al cargar', h.substring(3));
            				break;
            			case '1': //OK
                            // CARGAMOS AL DOM
                            $('#' + type + '-content').append(h.substring(3));
                            // VALIDAMOS
                            var total_pubs = $('#total_pubs').attr('val');
                            total_pubs = parseInt(total_pubs);
                            // 
                            var msg = (type == 'news' && total_pubs < 0) ? 'Solo puedes ver los &uacute;ltimos 100 shouts.' : 'No hay m&aacute;s shouts para mostrar'; 
                            if(total_pubs == 0 || total_pubs < muro.stream.show) $('.more-pubs').html(msg).css('color','#000');
                            else muro.stream.total = muro.stream.total + parseInt(total_pubs);
                            // REMOVER
                            $('#total_pubs').remove();
            				break;
            		}
                    $('#loading').fadeOut(250); 
            	},
                complete: function (){
                    $('.more-pubs a').show();
                    $('.more-pubs span').hide();
                    muro.stream.status = 0;
                    $('#loading').fadeOut(450); 
                }
            });
        },
        // LOADER
        loader: function(active){
            if(active == true) $('.streamLoader').show();
            else if(active == false) $('.streamLoader').hide();
        }
    },
    // LIKE
    like_this: function(id, type, obj){
        muro.stream.status = 1;
        // MANDAMOS
        $('#loading').slideDown(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/muro-likes.php',
            dataType: 'json',
        	data: 'id=' + id + '&type=' + type,
        	success: function(h){
        	   if(h['status'] == 'ok'){
//        	       $(obj).text(h['link']);
        	       if(type == 'pub'){
						sho_total = parseInt($('#sunl_'+id+'> div.acnu').text());
						if(h['link'] == 'Me gusta'){					   
							$('#cb_' + id).hide();							
							$('#sunl_'+id+'> div.acnu').text(sho_total - 1);								
							$('#sunl_'+id+'> span.i').addClass('likeli');							
							$('#sunl_'+id+'> span.i').removeClass('likeliVerde');
							//SHOUTS HOME
							$('#sunl_'+id+'> span.toup-thumb_up').addClass('mazul');							
							$('#sunl_'+id+'> span.toup-thumb_up').removeClass('mgris');
							//
							$('#sunl_'+id+'> .acnu').addClass('azu');							
							$('#sunl_'+id+'> .acnu').removeClass('gri');							
							//
							$('#activida'+id).hide();							
						}else{
							$('#cb_' + id).show();
							$('#cf_' + id).focus();																	
							$('#sunl_'+id+'> div.acnu').text(sho_total + 1);
							$('#sunl_'+id+'> span.i').removeClass('likeli');							
							$('#sunl_'+id+'> span.i').addClass('likeliVerde');	
							//SHOUTS HOME
							$('#sunl_'+id+'> span.toup-thumb_up').removeClass('mazul');							
							$('#sunl_'+id+'> span.toup-thumb_up').addClass('mgris');
							//
							$('#sunl_'+id+'> .acnu').removeClass('azu');							
							$('#sunl_'+id+'> .acnu').addClass('gri');														
							//
							$('#activida'+id).hide();
						}					   
        	       } else {
					   sho_total = parseInt($('#mgus_'+id).text());
//						$('#lk_cm_'+id).text(h['text']);
						if(h['text'] == '') 
							//$('#lk_cm_'+id).parent().hide();
							$('#mgus_'+id).text(sho_total - 1);
//							$('#tipolike_'+id+'> span.i').addClass('sigusta');
//							$('#tipolike_'+id+'> span.i').removeClass('nogusta');							
						else 
							//$('#lk_cm_'+id).parent().show();
							$('#mgus_'+id).text(sho_total + 1);
							$('#mgus_'+id).removeClass('versi');
//							$('#tipolike_'+id+'> span.i').removeClass('sigusta');
//							$('#tipolike_'+id+'> span.i').addClass('nogusta');
        	       }
			   
        	   } else {
        	       mydialog.alert('Error:', h['text'].substring(3));
        	   }
               $('#loading').slideUp(350); 
        	},
            complete: function (){
                // STATUS
                muro.stream.status = 0;
            }
        });
    },
    show_likes: function(id, type){
        muro.stream.status = 1;
        // MANDAMOS
        $('#loading').fadeIn(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/muro-likes.php?do=show',
            dataType: 'json',
        	data: 'id=' + id + '&type=' + type,
        	success: function(h){
        		switch(h.status){
        			case 0: //Error
                        mydialog.alert('Error', h['data']);
        				break;
        			case 1: //OK
                        var html = '<ul id="show_likes">';
                        for(var i = 0; i < h.data.length; i++){
                            html += '<li>'
                            html += '<a href="' + global_data.url + '/perfil/' + h.data[i].user_name + '"><img src="' + global_data.url + '/files/avatar/' + h.data[i].user_id + '_50.jpg" /></a>'
                            html += '<div class="name"><a href="' + global_data.url + '/perfil/' + h.data[i].user_name + '">' + h.data[i].user_name + '</a></div>' 
                            html += '</li>'; 
                        }
                        html += '</ul>';
                        // MOSTRAMOS
                		mydialog.show(true);
                		mydialog.title('Personas a las que les gusta');
                		mydialog.body(html);
                        mydialog.buttons(true, true, 'Cerrar', 'close', true, true);
                        mydialog.center();
        				break;
        		}
                $('#loading').fadeOut(350); 
        	},
            complete: function (){
                // STATUS
                muro.stream.status = 0;
            }
        });
   
    },
    show_comment_box: function(id){
        $('#cb_' + id).show();
		$('#cf_' + id).autogrow();
		$('#cf_' + id).focus();
		$('#activida'+id).hide();
    },
    comentar: function(id){
        var val = $('#cf_' + id).val();
        muro.stream.status = 1;
        if(val == '' || val == $('#cf_' + id).attr('title')) {
            $('#cf_' + id).focus(); 
            // LOADER/ STATUS
            muro.stream.loader(false);
            muro.stream.status = 0; 
            return false;
        }
        //
        $('#loading').fadeIn(250); 
		$('#carga_' + id).show();
		$('#cb_' + id).hide();
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/muro-stream.php?do=repost',
        	data: 'data=' + encodeURIComponent(val) + '&pid=' + id,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error:', h.substring(3));
        				break;
        			case '1': //OK
//						$('#cl_' + id).append($(h.substring(3)).fadeIn('slow'));
                        $('#cf_' + id).val('');
						$('#cb_' + id).hide();
						$('#carga_' + id).hide();
						$('#sunc_' + id + '> b').html(number_format(parseInt($('#sunc_' + id  + '> b').html().replace(".", "")) + 1, 0, ',', '.'));						
        				break;
        		}
                $('#loading').fadeOut(250); 
        	},
            complete: function (){
                // STATUS
                muro.stream.status = 0;
                $('#loading').fadeOut(350); 
				$('#carga_' + id).hide();
            }
        });
    },
    //
    more_comments: function(id, obj){
        // LOADER / STATUS
        muro.stream.status = 1;
        $(obj).parent().find('img').show();
        //
        $('#loading').fadeIn(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/muro-stream.php?do=more_comments',
        	data: 'pid=' + id,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error:', h.substring(3));
        				break;
        			case '1': //OK
                        $('#cl_' + id).html(h.substring(3));
        				break;
        		}
                $('#loading').fadeOut(350); 
        	},
            complete: function (){
                // STATUS
                muro.stream.status = 0;
                $('#loading').fadeOut(550); 
            }
        });
    },	
    comentar_shout: function(id){
        var val = $('#cf_' + id).val();
        muro.stream.status = 1;
        if(val == '' || val == $('#cf_' + id).attr('title')) {
            $('#cf_' + id).focus(); 
            // LOADER/ STATUS
            muro.stream.loader(false);
            muro.stream.status = 0; 
            return false;
        }
        //
        $('#loading').fadeIn(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/muro-stream.php?do=repost',
        	data: 'data=' + encodeURIComponent(val) + '&pid=' + id,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error:', h.substring(3));
        				break;
        			case '1': //OK
						$('#cl_' + id).append($(h.substring(3)).fadeIn('slow'));
                        $('#cf_' + id).val('');						
//						$('#sunc_' + id).html(number_format(parseInt($('#sunc_' + id).html().replace(".", "")) + 1, 0, ',', '.'));
						$('#datin').html(number_format(parseInt($('#datin').html().replace(".", "")) + 1, 0, ',', '.'));
						$('#datine').html(number_format(parseInt($('#datine').html().replace(".", "")) + 1, 0, ',', '.'));
						$('.nada-azul').hide();
        				break;
        		}
                $('#loading').fadeOut(250); 
        	},
            complete: function (){
                // STATUS
                muro.stream.status = 0;
                $('#loading').fadeOut(350); 
            }
        });
    },
    // MOSTRAR VIDEO DEL MURO
    load_atta: function(type, ID, obj){
        switch(type){
            case 'foto':
                var content = '<center><img src="' + ID + '" style="max-width:' + this.maxWidth + 'px; max-height: 380px" /><center>'; //bzox
            break;
            case 'video':
                var content = '<embed width="' + this.maxWidth + '" height="315" flashvars="width=' + this.maxWidth + '&amp;height=315" wmode="opaque" salign="tl" allowscriptaccess="never" allowfullscreen="false" scale="scale" quality="high" bgcolor="#FFFFFF" src="http://www.youtube.com/v/' + ID +'&amp;autoplay=1" type="application/x-shockwave-flash">';
            break;
        }
        // CARGAMOS
        $(obj).parent().html(content);
    },
    // ELIMINAR PUBLICACION / COMENTARIO
    del_pub: function(id, type){
        var txt_type = (type == 1) ? 'publicaci&oacute;n' : 'comentario';
        var txt_aux = (type == 1) ? 'esta ' : 'este ';
        //
        mydialog.mask_close = false;
        mydialog.show(true);
		mydialog.title('Eliminar ' + txt_type);
		mydialog.body('¿Seguro que deseas eliminar ' + txt_aux + txt_type);
		mydialog.buttons(true, true, 'Eliminar ' + txt_type, 'muro.eliminar(' + id + ', ' + type + ')', true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
    },
    // ELIMINAR PUBLICACION / COMENTARIO
    eliminar: function(id, type){
        // LOADER / STATUS
        muro.stream.status = 1;
        var snd_type = (type == 1) ? 'pub' : 'cmt';
        //
        $('#loading').fadeIn(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/muro-stream.php?do=delete',
        	data: 'id=' + id + '&type=' + snd_type,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error:', h.substring(3));
        				break;
        			case '1': //OK
                        mydialog.close();						
						$('#' + snd_type + '_' + id).fadeOut();	
						if(snd_type == 'cmt'){
							$('#datin').html(number_format(parseInt($('#datin').html().replace(".", "")) - 1, 0, ',', '.'));
							$('#datine').html(number_format(parseInt($('#datine').html().replace(".", "")) - 1, 0, ',', '.'));
						}
					break;
        		}
                $('#loading').fadeOut(350); 
        	},
            complete: function (){
                // STATUS
                muro.stream.status = 0;
                $('#loading').fadeOut(350); 
            }
        });
    },
    eliminar_abierto: function(id, type, nombre){
        // LOADER / STATUS
        muro.stream.status = 1;
        var snd_type = (type == 1) ? 'pub' : 'cmt';
        //
        $('#loading').fadeIn(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/muro-stream.php?do=delete',
        	data: 'id=' + id + '&type=' + snd_type,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error:', h.substring(3));
        				break;
        			case '1': //OK
                        mydialog.close();						
						$('#' + snd_type + '_' + id).fadeOut();	
						if(snd_type == 'cmt'){
							$('#datin').html(number_format(parseInt($('#datin').html().replace(".", "")) - 1, 0, ',', '.'));
							$('#datine').html(number_format(parseInt($('#datine').html().replace(".", "")) - 1, 0, ',', '.'));
						}						
						document.location.href= global_data.url + '/' + 'perfil/'+ nombre;						
					break;
        		}
                $('#loading').fadeOut(350); 
        	},
            complete: function (){
                // STATUS
                muro.stream.status = 0;
                $('#loading').fadeOut(350); 
            }
        });
    }	
    //
}
/** READY **/
$(function(){
    // POR ESTETICA...
    //setTimeout("$('#wall, #attaDesc').blur().css('min-height', '54px')",0);
    //setTimeout("$('#attaContent input').blur().css('height', '32px')",0);
    // WALL
	/*
	$('#wall').focus(function(){
        $('.btnStatus').show();
        //$('.frameForm').css('border-bottom', '1px solid #E9E9E9');
    });
	*/
    // ENVIAR PUBLICACION
/*	
    $('textarea[name=add_wall_comment]').live("keypress",function(k){
        if(k.which == 13){
            var pub_id = $(this).attr('pid');
            muro.comentar(pub_id);
            return false;
        }
    });
*/	
    // ADJUNTAR
    $('.adj').click(function(){
        var aid = $(this).attr('aid');
    })
	
	
	$('#attaDesc').css('min-height', '32px').autogrow().css('height','32px');
	
	
	
	
	
    // RESPUESTAS
	//$('.comentar').css('max-height', '200px').autogrow().css('height','14px');
    //
	//$('.comentar').css('height','30px').autogrow();	 
//	$('.comentar').css('max-height', '500px').autogrow();

//	$('#adres textarea').css('min-height', '30px').autogrow();

    $('input[name=hack]').live("focus",function(){
        $(this).hide();
        $(this).parent().find('div.formulario').show();
        var pub_id = $(this).attr('pid');
        //
        $('#cf_' + pub_id).focus()
    }) 
});

//CARGAR ACTIVIDAD DEL SHOUT BY TO-UP
function ver_actividad(id){
	if( $('#activida'+id).css('display') == 'none') {	
		$('#loading').fadeIn(250);
		$('#carga_' + id).show();
		$('#activida'+id).hide();
		$('#cb_' + id).hide();		
		$.ajax({
			type: 'GET',
			url: global_data.url + '/muro-actividad.php',		
			cache: false,
			data: 'id='+id,
			success: function(h){
				$('#activida'+id).show();
				$('#activida'+id).html(h);
				$('#loading').fadeOut(350);
				$('#carga_' + id).hide();
			},
			error: function(){
				$('#loading').fadeOut(350);
				$('#carga_' + id).hide();
			}
		});
	}else{	
		$('#activida'+id).hide();
	}	
}

//AGREGAR SHOUT A FAVORITOS BY TO-UP
function favorito_shout(comid){
	if(!comid) var comid = gget('comid');
	$('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url +'/muro-favorito.php',
		dataType: 'json',
		data: 'comid=' + comid,
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					mydialog.alert('Opps!', h.substring(3)); 
				break;
				case '1':
					//mydialog.alert('Shout Agregado', h.substring(3));	
					$('#loading').fadeOut(350);			
					var contador = parseInt($('#sunf_'+comid+'> div.acnu').text());
					$('#sunf_'+comid+'> div.acnu').text(++contador);	
					$('#sunf_'+comid+'> span.i').removeClass('favori');
					$('#sunf_'+comid+'> span.i').addClass('favoriAmarillo');		
				break;
				case '2':
					//mydialog.alert('Shout Eliminado', h.substring(3));
					$('#loading').fadeOut(350);
					var contador = parseInt($('#sunf_'+comid+'> div.acnu').text());
					$('#sunf_'+comid+'> div.acnu').text(--contador);
					$('#sunf_'+comid+'> span.i').addClass('favori');
					$('#sunf_'+comid+'> span.i').removeClass('favoriAmarillo');		
				break;	
			}
			$('#loading').fadeOut(350);
		},
		error: function(){
			mydialog.error_500("('"+comid+"')");
			$('#loading').fadeOut(350);
		}
	});
}

//COMPARIT SHOUT BY TO-UP
function compartir_shout(comid){
	if(!comid) var comid = gget('comid');
	$('#loading').fadeIn(250);
	$.ajax({
			type: 'POST',
			url: global_data.url +'/muro-compartir.php',
			dataType: 'json',
			data: 'comid=' + comid,
			success: function(h){
				switch(h.charAt(0)){
					case '0': //Error
						mydialog.alert('Aviso', h.substring(3));
					break;
					case '1':
						//mydialog.alert('Hecho', h.substring(3));
					break;
					case '2':
						//mydialog.alert('Hecho', h.substring(3));
						$('#loading').fadeOut(350);	
						var contador = parseInt($('#suns_'+comid+'> div.acnu').text());
						$('#suns_'+comid+'> div.acnu').text(++contador);						
						$('#suns_'+comid+'> span.i').removeClass('repost');
						$('#suns_'+comid+'> span.i').addClass('repostVerde');		
					break;	
				}
					$('#loading').fadeOut(350);
			},
			error: function(){
				mydialog.error_500("('"+comid+"')");
				$('#loading').fadeOut(350);
			}
	});
}


//PRIVACIDAD EN EL SHOUT BY TO-UP
$('#fulls').live('click', function(event){
	var el_list = $(this).next();
	if($(el_list).is(':visible')){
		$('body').click();
		return;
	}else{	
		$(el_list).show();
	}
});

$('body').click(function(event){
	if(!$(event.target).is('#fulls'))
	$('#fulls').next().hide();
});

$('#fulls + #privami a').live('click', function(){
	$(this).closest('#privami').find('a').removeClass('marcado');
	$(this).closest('a').addClass('marcado');
});


/*

//FUNCION BOTON SEGUIR/DEJAR/SIGUIENDO PARA POSTS BY TO-UP	
$(document).ready(function(param){
	///Ocultar Siguiendo y Mostrar Dejar de Seguir
	$('#socud').hover(
		function(){
			$('#socud').hide();
			$('#smued').show();
		}
	);
	//Ocultar Dejar de Seguir y Mostrar Siguiendo
	$('#smued').hover(
		function(){
			$('#smued').show();
		},
		function(){
			$('#socud').show();
			$('#smued').hide();
		}
	);
	//Ocultar Siguiendo/Dejar de Seguir y mostrar Seguir
	$('#smued').click(
		function(){
			$('#smued').hide();
			$('#socud').hide();
		}
	);	
	
});

function editar_shout(id, step, obj){
    var pub = $('#pub_' + id + ' .Story_Message > p');
    if(!step){
        pub.toggle().siblings('.edit-pub').toggle();
		$('.edit-pub > textarea').focus();
    }else{
		var body = $('#pub' + id + '_newtext');
		if(!body.val()){ body.focus(); return false; }
		$.post(global_data.url + '/edit_story.php', 'pubid=' + id + '&newmsg=' + body.val(), function(a){
			if(a.charAt(0) == '0'){ mydialog.alert('Ops!', a.substring(3)); return false; }
			pub.html(a.substring(3)).show().siblings('.edit-pub').hide();
		});
	}
}*/
