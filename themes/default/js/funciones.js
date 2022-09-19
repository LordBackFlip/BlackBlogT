/*
    T!Script > Funciones
    Autor: JNeutron
    ::
    Funciones extra agregadas al script.
*/
/* DENUNCIAS */
var denuncia = {
    nueva: function(type, obj_id, obj_title, obj_user){
        // PLANTILLA
		$('#loading').fadeIn(250); 
        $.ajax({
			type: 'POST',
			url: global_data.url + '/denuncia-' + type + '.php',
			data: 'obj_id=' + obj_id + '&obj_title=' + obj_title + '&obj_user=' + obj_user,
			success: function(h){
                denuncia.set_dialog(h, obj_id, type);
                $('#loading').fadeOut(350);                                 
			}
		});
    },
    set_dialog: function(html, obj_id, type){
        var d_title = 'Denunciar ' + type;
        // MYDIALOG
        mydialog.mask_close = false;
        mydialog.close_button = true;		                                        
		mydialog.show();
        mydialog.title(d_title);
		mydialog.body(html);
		mydialog.buttons(true, true, 'Enviar', "denuncia.enviar(" + obj_id + ", '" + type + "')", true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
    },
    enviar: function(obj_id, type){
        var razon = $('select[name=razon]').val();
        var extras = $('textarea[name=extras]').val();
        //
        $('#loading').fadeIn(250);                         
		$.ajax({
			type: 'POST',
			url: global_data.url + '/denuncia-' + type + '.php',
			data: 'obj_id=' + obj_id + '&razon=' + razon + '&extras=' + extras,
			success: function(h){
                switch(h.charAt(0)){
                    case '0':
                        mydialog.alert("Error",'<div>' + h.substring(3) +  '</div>');
                    break;
                    case '1':
                        mydialog.alert("Bien", '<div>' + h.substring(3) + '</div>');
                    break;
                }
                $('#loading').fadeOut(350);                                                 
			}
		});
    }
}
/* COMENTARIOS */
var comentario = {
    /* VARIABLES */
    cache: {},
    cargado: false,
    /* FUNCIONES */
    cargar: function(postid, page, autor){
        // GIF
		$('#com_gif').show();
		//$.scrollTo('#comentarios-container', 250);
		$('div#comentarios').css('opacity', 0.4)
		// COMPRVAMOS CACHE
        if(typeof comentario.cache['c_' + page] == 'undefined'){
            $('#loading').fadeIn(250);                                     
    		$.ajax({
    			type: 'POST',
    			url: global_data.url + '/comentario-ajax.php?page=' + page,
    			data: 'postid=' + postid + '&autor=' + autor,
    			success: function(h){
    			    // CACHE
                    comentario.cache['c_' + page] = h;
                    // CARGAMOS
   				    $('#comentarios').html(h);
                    // PAGINAS
    				comentario.set_pages(postid, page, autor);
    				//
                    $('#loading').fadeOut(350);
    			}                                                 
    		});
      } else {
            $('#comentarios').html(comentario.cache['c_' + page]);
            $('.paginadorCom').html(comentario.cache['p_' + page]);
            $('#com_gif').hide();
            $('div#comentarios').css('opacity', 1);
      }
    },
    set_pages: function(postid, page, autor){
    	var total = parseInt($('#ncomments').text());
    	//
        $('#loading').fadeIn(250);                                 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-pages.php?page=' + page,
    		data: 'postid=' + postid + '&autor=' + autor + '&total=' + total,
    		success: function(h){
    		    comentario.cache['p_' + page] = h;
   			    $('.paginadorCom').html(h);
                $('#com_gif').hide();
				$('div#comentarios').css('opacity', 1);
                $('#loading').fadeOut(350);                                                                 
    		}
    	});
	},
    // NUEVO COMENTARIO
    nuevo: function(mostrar_resp, comentarionum){
        // EVITAR FLOOD
        $('#btnsComment').attr({'disabled':'disabled'});
        //
    	var textarea = $('#body_comm');
    	var text = textarea.val();
        // VACIO o DEFAULT
    	if(text == '' || text == textarea.attr('title')){
    		textarea.focus();
            $('#btnsComment').removeAttr('disabled');
    		return;
    	}else if(text.length > 1500){
    		alert("Tu comentario no puede ser mayor a 1500 caracteres.");
    		textarea.focus();
            $('#btnsComment').removeAttr('disabled');
    		return;
    	}
        // IMAGEN
    	$('.miComentario #gif_cargando').show();
    	var auser = $('#auser_post').val();
        $('#loading').fadeIn(250);                                 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-agregar.php',
    		data: 'comentario=' + encodeURIComponent(text) + '&postid=' + gget('postid') + '&mostrar_resp=' + mostrar_resp + '&auser=' + auser,
    		success: function(h){
    			switch(h.charAt(0)){
    				case '0': //Error
    					$('.miComentario .error').html(h.substring(3)).show('slow');
                        $('#btnsComment').removeAttr('disabled');
					break;
    				case '1': //OK
						$("#nuevos").fadeIn();
						$('#preview').remove();
						//textarea.attr('title', 'Escribir un comentario...').val('');
						//onblur_input(textarea);
						$('#nuevos').html(h.substring(3)).slideDown('slow', function () {
							$('#no-comments').hide();
//							$('.miComentario').html('<div class="emptyData">Tu comentario fue agregado correctamente :)</div>');
							$('.miComentario').hide();
							$('#avicome').show();
						});
					// SUMAMOS
    						var ncomments = parseInt($('span#ncomments').text());
    						$('span#ncomments').text(ncomments + 1);
                            //$('#btnsComment').removeAttr('disabled');
                            // POR SI HABIA ERROR
                            //$('.miComentario .error').html('');
					break;
    			}
                $('#loading').fadeOut(350);                                 
    			//
    			$('.miComentario #gif_cargando').hide();
                mydialog.close();
    		}
  	     });
    },
	resp: function(id){		
		$('#'+id).removeAttr('style');
		var textarea = $('#bodys_comm_'+id);
		textarea.focus();
	},
	nuevos: function(mostrar_resp, comentarionum, cid){
        // EVITAR FLOOD
//        $('#btnssComment').attr({'disabled':'disabled'});
        //
    	var textarea = $('#bodys_comm_'+cid);
    	var text = textarea.val();
        // VACIO o DEFAULT
    	if(text == '' || text == textarea.attr('title')){
    		textarea.focus();
//            $('#btnssComment').attr({'disabled':''});
    		return;
    	}else if(text.length > 1500){
    		alert("Tu comentario no puede ser mayor a 1500 caracteres.");
    		textarea.focus();
//            $('#btnssComment').attr({'disabled':''});
    		return;
    	}
        // IMAGEN
//    	$('#'+cid+' #gif_cargando').show();
    	var auser = $('#ausers_post').val();
		var respuesta = $('#respuesta_'+cid).val();
		var comm_user = $('#comm_user_'+cid).val();
        $('#loading').fadeIn(250);                                 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-agregar.php',
    		data: 'comentario=' + encodeURIComponent(text) + '&postid=' + gget('postid') + '&mostrar_resp=' + mostrar_resp + '&auser=' + auser + '&respuesta=' + respuesta + '&comm_user=' + comm_user,
    		success: function(h){
    			switch(h.charAt(0)){
    				case '0': //Error
    					$('#'+cid+' .error').html(h.substring(3)).show();
//                        $('#btnssComment').attr({'disabled':''});
    				break;
    				case '1': //OK
						//$("#nuevoss_"+cid).show(1);
						$('#'+cid).hide();						
						$('#preview').remove();
						textarea.attr('title', 'Escribir una respuesta...').val('');							
						//
						$('#nuevoss_'+cid).html(h.substring(3)).show('slow', function(){
							$('#nuevoss_'+cid).addClass('nuevares');
//							getUrls(gget('postid'));
							$('#loading').hide();							
						});		
						$('#loading').fadeOut(350);
					break;
    			}
                $('#loading').fadeOut(350); 
                mydialog.close();
    		}
  	     });
    },		
    // VISTA PREVIA DEL COMENTARIO
    preview: function(id, type){
    	var textarea = (type == 'new') ? $('#' + id) : $('#edit-comment-' + id);
    	var text = textarea.val();
        var btn_text = (type == 'new') ? 'Aceptar' : 'Guardar';
        var btn_fn = (type == 'new') ? "comentario.nuevo('true')" : 'comentario.editar(' + id + ', \'send\')';
    
    	if(text == '' || text == textarea.attr('title')){
    		textarea.focus();
    		return;
    	}else if(text.length > 1500){
    		alert("Tu comentario no puede ser mayor a 1500 caracteres.");
    		textarea.focus();
    		return;
    	}
    	var auser = $('#auser_post').val();
    
    	$('.miComentario #gif_cargando').show();
        //
		mydialog.class_aux = 'preview';
		mydialog.show(true);
		mydialog.title('Previsualizaci&oacute;n');
		mydialog.body('<div class="carf"><p>Cargando vista previa...</p><img src="' + global_data.img + '/images/loading_bar.gif"/></div>');		        
		mydialog.center();
        //
        $('#loading').fadeIn(250);                 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-preview.php?type=' + type,
    		data: 'comentario=' + encodeURIComponent(text) + '&auser=' + auser,
    		success: function(h){
    		  switch(h.charAt(0)){
                case '0': //Error
    				if(type == 'new') $('.miComentario .error').html(h.substring(3)).show('slow');
                    else  {
                        $('#edit-error-' + id).css('color','red').html(h.substring(3));
                        mydialog.close();
                    }
                    $('.miComentario #gif_cargando').hide();
    			break;
                case '1': //OK
                    //
					mydialog.body(h.substring(3));
					mydialog.buttons(true, true, btn_text, btn_fn, true, true, true, 'Cancelar', 'close', true, false);
                    mydialog.center();
                    //
                    //$('#preview').html(h.substring(3)).slideDown("slow");
                    $('.miComentario #gif_cargando').hide();
                    $('.miComentario .error').html('');
                break;
                }
                $('#loading').fadeOut(350);                                 
                // DOBLE CENTER XQ SI NO, NO SE CENTRA :S
                mydialog.center();
    		}
    	});
    },
    // VOTAR COMENTARIO
    votar: function(cid, voto){
        var voto_tag = $('#votos_total_' + cid)
    	var total_votos = parseInt(voto_tag.text());
        total_votos = (isNaN(total_votos)) ? 0 : total_votos;
        // FIX
        voto = (voto == 1) ? 1 : -1;
        //
        $('#loading').fadeIn(250); 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-votar.php',
    		data: 'voto=' + voto + '&cid=' + cid + '&postid=' + gget('postid'),
    		success: function(h){
    			switch(h.charAt(0)){
    				case '0': //Error
    					mydialog.alert("Error al votar",h.substring(3));
    					break;
    				case '1': //OK
    					total_votos = total_votos + voto;
                        if(total_votos > 0) total_votos = '+' + total_votos; // PONEMOS EL SIGNO + POR ESTETICA :P
    					var klass = (total_votos < 0) ? 'negativo' : 'positivo'; // CLASS
                        // MOSTRAMOS SI NO ES VISIBLE Y AGREGAMOS LA NUEVA CLASS
                        $('#ul_cmt_' + cid + ' > .numbersvotes').show();
    					voto_tag.text(total_votos).removeClass('positivo, negativo').addClass(klass);
    					// ESCONDEMOS LAS MANITAS xd
                        $('#ul_cmt_' + cid).find('.icon-thumb-up, .icon-thumb-down').hide();
    					break;
    			}
                $('#loading').fadeOut(350); 
    		}
    	});	
    },
    // CITAR
    citar: function(id, nick){
    	var textarea = $('#body_comm');
    	textarea.focus();
    	textarea.val(((textarea.val()!='') ? textarea.val() + '\n' : '') + '[quote=' + nick + ']' + htmlspecialchars_decode($('#citar_comm_'+id).html(), 'ENT_NOQUOTES') + '[/quote]\n');
    },
    // EDITAR
    editar: function(id, step){
        switch(step){
            case 'show':
                var bbcode = htmlspecialchars_decode($('#citar_comm_'+id).html(), 'ENT_NOQUOTES');
                var html = '<textarea id="edit-comment-' + id + '" class="textarea-edit" title="Escribir un comentario..." onfocus="onfocus_input(this)" onblur="onblur_input(this)">' + bbcode + '</textarea><input type="button" class="boto verde" onclick="comentario.preview(\'' + id + '\', \'edit\')" value="Continuar"/> <strong id="edit-error-' + id + '"></strong>';
                $('#comment-body-' + id).html(html);
                $('#edit-comment-' + id).css('max-height', '300px').css('min-height', '40px').autogrow();
				$('#edit-comment-' + id).select();
            break;
            case 'send':
                var cid = $('#edit-cid-' + id).val()
                var comment = $('#edit-comment-' + id).val();
                $('#loading').fadeIn(250); 
            	$.ajax({
            		type: 'POST',
            		url: global_data.url + '/comentario-editar.php',
            		data: 'comentario=' + encodeURIComponent(comment) + '&cid=' + id,
            		success: function(h){
            			switch(h.charAt(0)){
            				case '0': //Error
                                $('#edit-error-' + id).css('color','red').html(h.substring(3));
            				break;
            				case '1': //OK
                                $('#comment-body-' + id).html($('#new-com-html').html());
                                var bbcode = htmlspecialchars_decode($('#new-com-bbcode').html(), 'ENT_NOQUOTES');
                                $('#citar_comm_'+id).html(bbcode) 
           					break;
            			}
                        $('#loading').fadeOut(350); 
            			//
                        mydialog.close();
            		}
                 });

            break;
        }  
    }
}

function remind_password(gew){
//   close_login_box();

	 if(!gew){
	 
	var form = '';
        form += '<div style="padding:15px 15px 18px 15px;" id="AFormInputs">'
        form += '<div class="form-line">'
//        form += '<label for="r_email">Correo electr&oacute;nico:</label>'
        form += '<input type="text" tabindex="1" name="r_email" id="r_email" maxlength="35" placeholder="E-mail con el que te registraste" style="margin: 0;"/>'
  		form += '</div>'
		form += '</div>'
        //
        mydialog.class_aux = 'registro';
		mydialog.show(true);
		mydialog.title('Recuperar contrase&ntilde;a');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Continuar', 'javascript:remind_password(true)', true, true, true, 'Cancelar', 'close', true, false);		
		mydialog.center();
	
	 }else{
	 
	var r_email = $('#r_email').val(); 
	
	$.post(global_data.url + '/recover-pass.php', 'r_email=' + r_email, function(a){
		   
           mydialog.alert((a.charAt(0) == '0' ? 'Opps!' : 'Hecho'), a.substring(3), false);
		   
           mydialog.center();
		    
		  });
	}
	
}

function resend_validation(gew){
//    close_login_box();

	 if(!gew){
	 
	var form = '';
        form += '<div style="padding:15px 15px 18px 15px;" id="AFormInputs">'
        form += '<div class="form-line">'
//        form += '<label for="r_email">Correo electr&oacute;nico:</label>'
        form += '<input type="text" tabindex="1" name="r_email" id="r_email" maxlength="35" placeholder="E-mail con el que te registraste" style="margin: 0;"/>'
  		form += '</div>'
		form += '</div>'
        //
        mydialog.class_aux = 'registro';
		mydialog.show(true);
		mydialog.title('Reenviar validaci&oacute;n');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Reenviar', 'javascript:resend_validation(true)', true, true, true, 'Cancelar', 'close', true, false);		
		mydialog.center();
	
	 }else{
	 
	var r_email = $('#r_email').val(); 
    
    $('#loading').fadeIn(250); 
	
	$.post(global_data.url + '/recover-validation.php', 'r_email=' + r_email, function(a){
		   
           mydialog.alert((a.charAt(0) == '0' ? 'Opps!' : 'Hecho'), a.substring(3), false);
		   
           mydialog.center();
		    
            $('#loading').fadeOut(350); 
		  });
	}
	
}
	
	


/* AFILIACION */
var afiliado = {
    vars: Array(),
    nuevo: function(){
        // CARGAMOS Y BORRAMOS
        var form = '';
        form += '<div class="nada-gris" style="margin-bottom:10px;" id="AFStatus"><span>Ingresa los datos de tu web para afiliarte.</span></div>'
        form += '<div id="AFormInputs">'
        form += '<div class="form-line">'
        form += '<label for="atitle">T&iacute;tulo</label>'
        form += '<input type="text" tabindex="1" name="atitle" id="atitle" maxlength="35"/>'
  		form += '</div>'
        form += '<div class="form-line">'
        form += '<label for="aurl">Direcci&oacute;n</label>'
        form += '<input type="text" tabindex="2" name="aurl" id="aurl" value="http://"/>'
  		form += '</div>'
        form += '<div class="form-line">'
        form += '<label for="aimg">Banner <small>(250x40px)</small></label>'
        form += '<input type="text" tabindex="3" name="aimg" id="aimg" value="http://"/>'
  		form += '</div>'
        form += '<div class="form-line">'
        form += '<label for="atxt">Descripci&oacute;n</label>'
        form += '<textarea tabindex="4" rows="10" name="atxt" id="atxt" style="margin-bottom: 0; height:60px;"></textarea>'
  		form += '</div>'
        form += '</div>'
        //
        //mydialog.class_aux = 'registro';
        mydialog.mask_close = false;
        mydialog.close_button = true;
		mydialog.show(true);
		mydialog.title('Nueva Afiliaci&oacute;n');
		mydialog.body(form);
		mydialog.buttons(true, true, 'Enviar', 'afiliado.enviar(0)', true, true, true, 'Cancelar', 'close', true, false);
		mydialog.center();
    },

    enviar: function(){
        var inputs = $('#AFormInputs :input');
        var status = true;
        var params = '';
        //
        inputs.each(function(){
            var val = $(this).val();
            // EL CAMPO AID NO ES NECESARIO
            if($(this).attr('name') == 'aID') val = '0'; 
            // COMPROBAMOS CAMPOS VACIOS
          /*  if((val == '') && status == true) {
                var campo = $(this).parent().find('label');
                $('#AFStatus > span').fadeOut().text('No has completado el campo ' + campo.text()).fadeIn();
                status = false;
            } else*/ if(status == true){
                // JUNTAMOS LOS DATOS
                params += $(this).attr('name') + '=' + val + '&';
            }
		});
        //
        if(status == true){
            mydialog.procesando_inicio('Enviando...', 'Nueva Afiliaci&oacute;n');
            afiliado.enviando(params);
        }
    },
    enviando: function(params){
    	//
        $('#loading').fadeIn(250); 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/afiliado-nuevo.php',
    		data: params,
    		success: function(h){
    		  mydialog.procesando_fin();
    		  switch(h.charAt(0)){
    		      case '0':
                $('#AFStatus > span').fadeOut().text('La URL es incorrecta').fadeIn();
                   // mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                  break;
                  case '1':
                    mydialog.body(h.substring(3));
                    mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                  break;
                     case '2':
                $('#AFStatus > span').fadeOut().text('Faltan datos').fadeIn();
                   // mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                  break;
    		  }
              mydialog.center();
              $('#loading').fadeOut(350); 
    		}
    	});
    },
    detalles: function(aid){
        $('#loading').fadeIn(250); 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/afiliado-detalles.php',
    		data: 'ref=' + aid,
    		success: function(h){
    		    mydialog.class_aux = '';
        		mydialog.show(true);
        		mydialog.title('Detalles del afiliado');
        		mydialog.body(h);
                mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
                mydialog.center();
                $('#loading').fadeOut(350); 
                
    		}
    	});   
    }
}

/* BBCode */
function spoiler(obj){
    $(obj).toggleClass('show').parent().next().slideToggle();
}
/* EMOTICONOS */
function moreEmoticons(margin){
    $('#emoticons').slideToggle('fast');  
}
/* IMAGENES */
var imagenes = {
    total: 0,
    move: '-250px',
    presentacion: function(){
        $('#imContent').animate({top: '0px'}, 1000, 'easeOutQuad', 
        function(){
            // MOSTRAMOS
            // MOVEMOS
            $('#imContent').css({top: imagenes.move})
            // ULTIMO
            var slm = $('#img_' + imagenes.total).html();
            //
            for(var i = imagenes.total; i >= 0; i--){
                $('#img_' + i).html($('#img_' + (i - 1)).html());
            }
            //
            $('#img_0').html(slm);
            // INFINITO :D
            setTimeout("imagenes.presentacion()",5000);
        });

    }
}

// NEWS
var news = {
    total: 0,
    count: 1,
    slider: function(){
        if(news.total > 1){
            if(news.count < news.total) news.count++;
            else news.count = 1;
            //
            $('#top_news > li').hide();
            $('#new_' + news.count).fadeIn();
            // INFINITO :D
            setTimeout("news.slider()",7000);
        }
    }       
}

// READY
$(document).ready(function(){
    /* NOTICIAS */
    news.total = $('#top_news > li').size();
    news.slider();
    /* IMAGENES */
    imagenes.presentacion();
    /* HOVER CARD */
   	$('.hovercard').tooltip({
		offset: [ -50, -30 ],
		content: 'uid'
	});
    $('.vctip').tipsy({gravity: 'n'});
	$('.qtip').tipsy({gravity: 's'});
	$('.hctip').tipsy({gravity: 'w'});
	$('.ectip').tipsy({gravity: 'e'});	
});


function ModalFoto(url){
	$('#loading').fadeIn(250); 	
	$.ajax({
		type: 'POST',
		data: 'url=' + url,
		success: function(){
			mydialog.show(true);
			mydialog.title('Imagen');
			mydialog.body('<img id="fullimg" src="'+url+'"/>');
			mydialog.buttons(false);
			mydialog.center();
			$('#loading').fadeOut(350); 
		}
	});   
}

function ModalVideo(url){
	$('#loading').fadeIn(250); 	
	$.ajax({
		type: 'POST',
		data: 'url=' + url,
		success: function(){
			mydialog.show(true);
			mydialog.title('Video');
			mydialog.body('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+url+'" frameborder="0" allowfullscreen></iframe>');
			mydialog.buttons(false);
			mydialog.center();
			$('#loading').fadeOut(350); 
		}
	});   
}

//SLIDER PARA LAS NOTICIAS BY TO-UP.NET
$(document).ready(function() {
	var i = 0;
	var control = setInterval(cambiarSlider, 3000);	
	function cambiarSlider(){
		i++;
		if(i == $('#noticias div').size()){
			i = 0;
		}
		$('#noticias div').hide();
		$('#noticias div').eq(i).show();
	}
	
});


/*
function luces_de_colores() {
	$('#LPro').html('Hackeando web... Ataque DDoS en progreso');
	mydialog.show();
	mydialog.title('Hacked by kmario19');
	mydialog.body('Al parecer has modificado o removio mi copy de diseño del tema KM-Tronos.<br>En unos minutos tu web se caera y la habre hackeado por esa razon.<br>Es para que aprendas a respetar el copyright.');
	//mydialog.buttons(true, true, 'Aceptar', 'caiste()', true, true);
	mydialog.buttons(true, true, 'Aceptar', 'mydialog.close()', true, true);
	mydialog.center();	
}

function caiste() {
	mydialog.show();
	mydialog.title('Caiste!!');
	mydialog.body('<img src="http://i.imgur.com/cZDvF.jpg" width="200"><br>De verdad creiste que seria capaz de hacer algo como esto?<br>No te preocupes no le hare nada a tu web, solo veo que has modificado o quitado mi copy<br>Nah, no es obligaci&oacute;n, contactame en el foro y te digo como quitas este mensaje<br>si vas a quitar mi copy No hay problema ;)');
	mydialog.buttons(true, true, 'MP Kmario19', "location.href='http://www.phpost.net/user/6266-kmario19/'", true, false, true, 'Cerrar', 'mydialog.close()', true, true);
	mydialog.center();	
}

// READY
$(document).ready(function(){
	if ($('#KM_copy')){	
		if ($('#KM_copy').html() != 'Kmario19') {
			luces_de_colores();
		}
	} else {
		luces_de_colores();	
	}
});
*/