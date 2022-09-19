$(document).ready(function() {


//boton de PAUSA/PLAY
$('#btn').click(function() {
  if( $('#btn').val() == 'PAUSA' ){
	clearInterval(interval);
	$('#btn').val('REANUDAR');
	$('#btn').removeClass('bpausa');
	$('#btn').addClass('bplay');	
  }else{
    $('#btn').val('PAUSA');
	$('#btn').removeClass('bplay');
	$('#btn').addClass('bpausa');
   interval = setInterval(interval_function, 500);
  }
});

/*
$('.hh').hover(function(){
  if( $('#btn').val() == 'PAUSA' ){
     clearInterval(interval);
     $('#btn').val('REANUDAR');   
  }else{
    $('#btn').val('PAUSA');
   interval = setInterval(interval_function, 1000);
  }
});
*/
interval_function = function () {
	posts = $('#Fposts').attr('checked') == 'checked' ? 1 : 0;
	shouts = $('#Fshouts').attr('checked') == 'checked' ? 1 : 0;
	usuarios = $('#Fusuarios').attr('checked') == 'checked' ? 1 : 0;
	fotos = $('#Ffotos').attr('checked') == 'checked' ? 1 : 0;
	//
	$.ajax({
		type: 'POST',
		url: global_data.url + '/envivo-actividad.php',		
		cache: false,
		data: 'posts='+posts + '&shouts='+shouts + '&usuarios='+usuarios + '&fotos='+fotos,
		success: function(h){
			$('.hh').html(h);
		},
		error: function(){
		}
	});
}
interval = setInterval( interval_function , 500);  
});