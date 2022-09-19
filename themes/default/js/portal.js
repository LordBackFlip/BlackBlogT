/*
    PERFIL
*/
var portal = {
    cache: {},
    load_tab:function(type, obj){
        // CSS
        $('#tabs_menu > li').removeClass('selected');
        $(obj).parent().addClass('selected');
        if(type == 'news') $('#portal_content').css('background-color', '#FFF');
        else $('#portal_content').css('background-color', '#F9F9F9');
        //
        $('#portal_content > div.showHide').hide();
        // CARGAMOS
        var status = $('#portal_' + type).attr('status');
        if(status == 'activo') {
            $('#portal_' + type).show();
        } else {
            $('#portal_' + type).show();
            portal.posts_page(type, 1, false);
        }
    },
    // CARGAR CONTENIDO
    save_configs: function(){
		var inputs = $('#config_inputs :input');
        var cat_ids = '';        
		inputs.each(function(){
            if($(this).attr('checked')) cat_ids += $(this).val() + ',';
		});
        //
        $('#loading').fadeIn(250);
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/portal-posts_config.php',
        	data: 'cids=' + cat_ids,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Error', h.substring(3));
        				break;
        			case '1': //OK
                        $('#config_posts').slideUp();
                        portal.posts_page('posts',1, false);
        				break;
        		}
                $('#loading').fadeOut(350);
        	}
        });                
    },
    // PAGINAS PARA LOS ULTIMOS POSTS
    posts_page: function(type, page, scroll){
        $('#portal_' + type + '_content').html('<center><img src="' + global_data.img + '/images/fb-loading.gif" /></center>');
        //
  		if(scroll == true) $.scrollTo('#cuerpocontainer', 250);
        if(typeof portal.cache[type + '_' + page] == 'undefined'){
            $('#loading').fadeIn(250);
    		$.ajax({
    			type: 'GET',
    			url: global_data.url + '/portal-' + type + '_pages.php?page=' + page,
    			success: function(h){
    			    // CACHE
                    portal.cache[type + '_' + page] = h;
                    $('#portal_' + type).attr('status', 'activo');
                    // CARGAMOS
   				    $('#portal_' + type + '_content').html(h);
                    // OCULTAMOS MENSAJE CARGA
                    $('#loading').fadeOut(350);
    			}
    		});
        } else {
            $('#portal_' + type + '_content').html(portal.cache[type + '_' + page]);
        }
    }
}

/** READY **/
$(function(){
    
});

//SHOUTS FULL
function shout_recientes(tipo,parte,filtrame){	
    $('#loading').fadeIn(250);
	$('#perfil-' + parte).css('opacity', 0.5);
	$.ajax({
		type: 'GET',
		url: global_data.url + '/muro-'+filtrame+'.php',	
		cache: false,
		data: 'tipo='+tipo + '&parte=' + parte,
		success: function(h){
			$('#perfil-' + parte).css('opacity', 1);
			$('#perfil-' + parte).html(h);
            $('#loading').fadeOut(350);	
			/*
			if(tipo = 3){
				$('.nusho').hide();			
			}
			*/
		},
		error: function(){
			$('#perfil-' + parte).css('opacity', 1);
            $('#loading').fadeOut(350);
		}
	});
}


function shout_populares(tipo,parte,filtrame,acciones,tiempos){	
    $('#loading').fadeIn(250);
	$('#perfil-' + parte).css('opacity', 0.5);
	$.ajax({
		type: 'GET',
		url: global_data.url + '/muro-'+filtrame+'.php',	
		cache: false,
		data: 'tipo='+tipo + '&parte=' + parte + '&acciones=' + acciones + '&tiempos=' + tiempos,
		success: function(h){
			$('#perfil-' + parte).css('opacity', 1);
			$('#perfil-' + parte).html(h);
            $('#loading').fadeOut(350);	
			$('#selec').hide()
		},
		error: function(){
			$('#perfil-' + parte).css('opacity', 1);
            $('#loading').fadeOut(350);
			$('#selec').show()
		}
	});
}

//FUNCION SIMPLE PARA EL MENU DEL PORTAL 
$(document).ready(function() {
	//$('.globo').hide();//ESCONDER GLOBO ROJO DE NOTIFICACION SHOUTS
    $('#selec a').click(function(event) {
        event.preventDefault();
        $(this).parent().addClass('activo');
        $(this).parent().siblings().removeClass('activo');
		//$('.nusho').hide();//ESCONDER GLOBO NEGRO DE NOTIFICACION SHOUTS
    });
});

var pin = {	
    nuevo: function(){
    	var textarea = $('#addPin');
    	var text = textarea.val();
        // VACIO o DEFAULT
    	if(text == ''){
    		textarea.focus();
    		return;
    	}else if(text.length > 32){
			mydialog.alert('Oops!','Un pin debe tener menos de 32 caracteres');
    		textarea.focus();
    		return;
		}else if(text.length < 2){	
			mydialog.alert('Oops!','Un pin debe tener mas de 2 caracteres');
			textarea.focus();
			return;
		}
        $('#loading').fadeIn(250);  
		$.ajax({
    		type: 'POST',
    		url: global_data.url + '/portal-pin.php?do=add',
			data: 'cuerpo=' + encodeURIComponent(text),
    		success: function(h){
    			switch(h.charAt(0)){
    				case '0': //Error
						mydialog.alert('Oops!', h.substring(3));
						textarea.focus();
    					break;
    				case '1': //OK
						mydialog.alert('Bien', h.substring(3));
					break;
    			}
				$('#addPin').val('');
                $('#loading').fadeOut(350);                                 
    			//
    			$('.miComentario #gif_cargando').hide();
                //mydialog.close();
    		}
  	     });
    },	
    eliminar: function(id){
        $('#loading').fadeIn(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/portal-pin.php?do=delete',
        	data: 'id=' + id + '&do=delete',
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Oops!', h.substring(3));
        				break;
        			case '1': //OK
						$('#loading').fadeOut(350);
                        mydialog.close();
					break;
        		}
                $('#loading').fadeOut(350); 
        	},
            complete: function (){
				//$('#mov_'+id).hide();
                $('#loading').fadeOut(350); 
            }
        });
    },	
    convertir: function(id){
        $('#loading').fadeIn(250); 
        $.ajax({
        	type: 'POST',
        	url: global_data.url + '/portal-covertir-hashtag.php',
        	data: 'id=' + id,
        	success: function(h){
        		switch(h.charAt(0)){
        			case '0': //Error
                        mydialog.alert('Oops!', h.substring(3));
        				break;
        			case '1': //OK
						$('#loading').fadeOut(350);
                        mydialog.close();
					break;
        		}
                $('#loading').fadeOut(350); 
        	},
            complete: function (){
				//$('#mov_'+id).hide();
                $('#loading').fadeOut(350); 
            }
        });
    }	
}		

function cambia(){
	var textarea = $('#addPin');
	var text = textarea.val();
	if(text != ''){		
//		$('#repin').css('opacity', 0.4);
		$.ajax({
			url: global_data.url + '/portal-actualizar-pin.php',
			cache: false,
			success: function(h){
				$('#repin').html(h);
			},
			complete: function(){
//				$('#repin').css('opacity', 1);
			}
		});
	}
}

function eli(){
$.ajax({
	url: global_data.url + '/portal-actualizar-pin.php',
	cache: false,
	success: function(h){
		$('#repin').html(h);
	},
	complete: function(){
	}
});
}


$(document).ready(function(){
    $('#GloNoti').click(function(){
		$('#NubeShout').hide();
    });
    $('#GloSho').click(function(){
		$('#NubeNotifi').hide();
    });	
});	