$(document).ready(function(){
	$('textarea.imagen-desc').live('focus', function(){ if ($(this).html() == 'Descripcion de la foto') $(this).html(''); });
	/*$('input[name=ciudad]').autocomplete('/registro-geo.php', {
		minChars: 2,
		width: 298
	}).result(function(event, data, formatted){
		cuenta.ciudad_id = (data) ? data[1] : '';
		cuenta.ciudad_text = (data) ? data[0] : '';
	});*/
	//cuenta.chgprovincia(true);
	if (typeof $.browser.msie != 'undefined' && $.browser.version == '6.0') $('li.local-file > div.mini-modal').html('<div class="dialog-m"></div><span>Esta funciÃ³n no es compatible con su navegador</span>');

});

function input_fake(x) {
	$('.input-hide-'+x).hide();
	$('.input-hidden-'+x).show().focus();
}

function desactivate(few) {
	if(!few){
		mydialog.show();			
		mydialog.title('Desactivar Cuenta');
		mydialog.body('&#191;Seguro que quiere desativar su cuenta?');
		mydialog.buttons(true, true, 'Acepatar', 'desactivate(true)', true, false, true, 'Cancelar', 'close', true, true);
		mydialog.center();			
	}else{			
		var pass = $('#passi');        
		$('#loading').fadeIn(250); 			
		//$.post(global_data.url + '/cuenta.php?action=desactivate', function(a){		
		$.post(global_data.url + '/cuenta.php?action=desactivate', 'key=' + 'ajaxcontinue', function(a){		
			mydialog.alert((a.charAt(0) == '0' ? 'Opps!' : 'Hecho'), (a.charAt(0) == '0' ? 'No se pudo desactivar' : 'Cuenta desactivada'), true);		   
			mydialog.center();           
			$('#loading').fadeOut(250); 		   
		});
	}
}	

var cuenta = {
	ciudad_id: '',
	ciudad_text: '',
	no_requerido: new Array(),

	alert: function (secc, title, body) {
		$('div.alert-cuenta.cuenta-'+secc).html('<h2>'+title+'</h2>');
		$('div.alert-cuenta.cuenta-'+secc).show();
		setTimeout(function(){
			$('div.alert-cuenta.cuenta-'+secc).hide();
		}, 2000);							
	},

	alert_close: function (secc) {
		$('div.alert-cuenta.cuenta-'+secc).html('');
		$('div.alert-cuenta.cuenta-'+secc).show();
		setTimeout(function(){
			$('div.alert-cuenta.cuenta-'+secc).hide();
		}, 2000);			
	},

	chgtab: function (obj) {
		$('div.tabbed-d > div.floatL > ul.menu-tab > li.active').removeClass('active');
		$(obj).parent().addClass('active');
		var active = $(obj).html().toLowerCase().replace(' ', '-');
		$('div.content-tabs').hide();
		$('div.content-tabs.'+active).show();
	},

	chgsec: function (obj) {
		$('div.content-tabs.perfil > h3').removeClass('active');
		$('div.content-tabs.perfil > fieldset').slideUp(100);
		if ($(obj).next().css('display') == 'none') {
			$(obj).addClass('active');
			$(obj).next().slideDown(100).addClass('active');
		}
	},

	chgpais: function(){
		var pais = $('form[name=editarcuenta] select[name=pais]').val();
		var el_estado = $('form[name=editarcuenta] .content-tabs.cuenta select[name=estado]');

		//No se selecciono ningun pais.
		if(empty(pais)){
			$('form[name=editarcuenta] select[name=estado]').addClass('disabled').attr('disabled', 'disabled').val('');
		}else{
			//Obtengo las estados
			$(el_estado).html('');
            $('#loading').fadeIn(250); 
			$.ajax({
				type: 'GET',
				url: global_data.url + '/registro-geo.php',
				data: 'pais_code=' + pais,
				success: function(h){
					switch(h.charAt(0)){
						case '0': //Error
							break;
						case '1': //OK
							cuenta.no_requerido['estado'] = false;
							$(el_estado).append(h.substring(3)).removeAttr('disabled').val('').focus();
							break;
					}
                    $('#loading').fadeOut(250); 
				},
				error: function(){

				}
			});
		}
	},
	

	error: function(obj, str){
		var container = $(obj).next();
		if($(container).hasClass('errorstr')){
			$(container).show();
			$(container).html(str);
		}
	},

	next: function (isprofile) {
		if (typeof isprofile == 'undefined') var isprofile = false;
		if (isprofile) $('div.content-tabs.perfil > h3.active').next().next().click();
		else $('div.tabbed-d > div.floatL > ul.menu-tab > li.active').next().children().click();
	},

	save: function (secc, next) {

		$('.ac_input, .cuenta-save-'+secc).removeClass('input-incorrect');

		if (typeof next == 'undefined') var next = false;
		params = Array();
		params.push('save='+secc);

		$('.cuenta-save-'+secc).each(function(){
			if (($(this).attr('type') != 'checkbox' && $(this).attr('type') != 'radio') || $(this).attr('checked')) params.push($(this).attr('name')+'='+encodeURIComponent($(this).val()));
		});

		var cuenta_url = global_data.url + '/cuenta.php?action=save&ajax=true';

        $('#loading').slideDown(250); 
		$.ajax({
			type: 'post', 
			url: cuenta_url, 
			data: params.join('&'), 
			dataType: 'json',
			success: function (r) {
				//$('#prueba').html(r.html);
				if (r.error) {
					if (r.field) $('input[name='+r.field+']').focus().addClass('input-incorrect');
					cuenta.alert(secc, r.error)
				}
				else {
					if (next) cuenta.next(secc > 1 && secc < 5);
					cuenta.alert(secc, 'Los cambios fueron aceptados y ser&aacute;n aplicados.');
					if(r.porc != null) {
						$('#porc-completado-label').html('Perfil completo al ' + r.porc + '%');
						$('#porc-completado-barra').css('width', r.porc + '%');
					}
				}
				window.location.hash = 'alert-cuenta';
                $('#loading').slideUp(250); 
			}
		});
	},

	imagen: {
		add: function (obj) {
			var url = $(obj).prev().prev(), caption = $(obj).prev();
			$(url).removeClass('input-incorrect');
			$(caption).removeClass('input-incorrect');
            $('#loading').fadeIn(250); 
			$.ajax({
				type: 'post', url: global_data.url + '/cuenta.php?ajax=1&action=add', data: 'url='+$(url).val()+'&caption='+$(caption).val(), dataType: 'json',
				success: function (r) {
					if (r.error) {
						if (r.field) $(eval(r.field)).focus().addClass('input-incorrect');
						else {
							cuenta.alert(7, r.error);
							window.location.hash = 'alert-cuenta';
						}
					}
					else if (typeof r.id != 'undefined') {
						$(obj).attr('onclick', '');
						$(obj).unbind('click').bind('click', function(){ cuenta.imagen.del(this, r.id); });
						$(obj).removeClass('misfotos-add').addClass('misfotos-del').html('Eliminar');
						$(url).parent().prepend('<div class="floatL"><img src="'+$(url).val()+'" class="imagen-preview" /></div>')
						$('<div class="field"><label>Imagen</label><div class="input-fake"><input value="http://" type="text" class="text" /><textarea style="margin-top:10px">Descripcion de la foto</textarea><a onclick="cuenta.imagen.add(this)" class="misfotos-add floatL">Agregar</a></div></div>').appendTo('.content-tabs.mis-fotos > fieldset');
					}
                    $('#loading').fadeOut(250); 
				}
			});
		},

		del: function (obj, id) {
			var container = $(obj).parent().parent();
            $('#loading').fadeIn(250); 
			$.ajax({
				type: 'post', url: global_data.url + '/cuenta.php?ajax=1&action=del', data: 'id='+id, dataType: 'json',
				success: function (r) { $(container).slideUp(100, function(){ $(container).remove(); cuenta.alert_close(7); }); $('#loading').fadeOut(250);  }
			});
		}

	}

}

var avatar = {

	uid: false,
	key: false,
    ext: false,
	crop_coord: false,
	current: false,
	success: false,

	edit: function (obj) {
		if ($(obj).html() == 'Editar') {
			$('.change-avatar').slideDown(100);
			$(obj).html('Cancelar');
		}
		else {
			$('div.sidebar-tabs > div.webcam-capture, div.mini-modal').hide();
			$('div.sidebar-tabs > img:first, div.avatar-big-cont').show();
			$('ul.change-avatar > li').removeClass('active');
			$('.change-avatar').slideUp(100);
			$(obj).html('Editar');
		}
	},
	chgtab: function (obj) {
		var container = $(obj).parent().parent();
		var close = container.hasClass('active');
		$('ul.change-avatar > li').removeClass('active');
		$('div.sidebar-tabs > div.webcam-capture, div.mini-modal').hide();
		$('div.sidebar-tabs > div.avatar-big-cont').show();
		if (!close) {
			container.addClass('active');
			if (container.hasClass('webcam-file')) {
				$('div.sidebar-tabs > div.avatar-big-cont').hide();
				$('div.sidebar-tabs > div.webcam-capture').show();
			}
			else $(obj).parent().next().show();
		}
	},
	upload: function (obj) {
		if ($(obj).hasClass("local")) {
			if ($('input#file-avatar').val()) {
				if(isImageFile($('input#file-avatar').val())){
				    $('div.avatar-loading').show();
					//FIX BY TO-UP
					$('.mini-modal').hide();
					$('.local-file').removeClass('active');
					//
				    $.ajaxFileUpload({ url: global_data.url + '/upload-avatar.php', fileElementId: 'file-avatar', dataType: 'json', success: this.uploadsuccess });
				} else alert('El archivo no es una imagen válida');
			}
			else alert('No selecciono ningun archivo');
		} else if($(obj).hasClass("url")) {
            var url_file = $('input#url-avatar').val();  
            if(url_file && isImageFile(url_file)){
                $('div.avatar-loading').show();
                $(obj).attr('disabled', 'true');
    			$.ajax({type: 'post', url: global_data.url + '/upload-avatar.php', data: 'url='+url_file, dataType: 'json', success: this.uploadsuccess, complete: function() {$(obj).attr('disabled', 'true');} });
            } else alert('El archivo no es una imagen válida');
		}
		return false;
	},
	uploadsuccess: function (r) {
		$('div.avatar-loading').hide();
		if (r.error == 'success') {
			avatar.success = true;
			avatar.close();
		}
		else if (r.msg) {
            avatar.key = r.key;
            avatar.ext = r.ext;
            avatar.crop(r.msg); 
		}
		else alert(r);
	},
	crop: function (img) {
		mydialog.show();
		$('#modalBody').css('padding', 0);
		$('#mask').unbind('click'); 
		mydialog.title('Cortar avatar');
		mydialog.body('<img id="avatar-crop" src="'+img+'?'+Math.random()+'" onload="mydialog.center()">');
		mydialog.buttons(true, true, 'Guardar', 'avatar.save()', true, false, true, 'Cancelar', 'avatar.close()', true, true);
		$('img.avatar-big').attr('src', img+'?'+Math.random()).bind('load', function(){ $('#avatar-crop').Jcrop({ aspectRatio: 1, sideHandles: false, setSelect: [ 0, 0, 120, 120 ], onChange: avatar.preview, onSelect: function(c) { avatar.crop_coord = c; } }) });
	},
	reload: function () {
		$('.avatar-big').attr('src', this.current+'?'+Math.random()).css({ margin: 0, width: '120px', height: '120px' });
	},
	close: function () {
        mydialog.body('');
		mydialog.close();
		$('a.edit').click();
		if (avatar.success) {
			avatar.success = false;
            var img_url = global_data.url + '/files/avatar/' + avatar.uid + '_120.jpg?reload=true';
            $('#avatar-img').attr({'src': img_url}).fadeIn();
			$('.avamu').attr({'src': img_url}).fadeIn();
            $('div.avatar-loading').hide();
		}else {
			$.ajax({type: 'post', url: global_data.url + '/upload-delete.php', data: 'key='+avatar.key+'&ext=' + avatar.ext});
		}		
	},
	preview: function (coords) {
		avatar.crop_coord = coords;
		var rx = 120 / coords.w;
		var ry = 120 / coords.h;
		$('.avatar-big').css({
			width: Math.round(rx * $('#avatar-crop').width()) + 'px',
			height: Math.round(ry * $('#avatar-crop').height()) + 'px',
			marginLeft: '-' + Math.round(rx * coords.x) + 'px',
			marginTop: '-' + Math.round(ry * coords.y) + 'px'
		});
	},

	save: function () {
		if (!this.crop_coord) alert('Debes seleccionar una parte de la foto');
		else {
            $('div.avatar-loading').show();
            $('#avatar-img').attr({'style' : 'display:none'});
            $('#loading').fadeIn(250); 
			$.ajax({
				type: 'post', 
                url: global_data.url + '/upload-crop.php', 
                data: 'key='+this.key+'&ext=' + this.ext + '&x='+this.crop_coord.x+'&y='+this.crop_coord.y+'&w='+this.crop_coord.w+'&h='+this.crop_coord.h, 
                dataType: 'json',
				success: function (r) {
            		if (r.error == 'success') {
            			avatar.success = true;
            			avatar.close();
						//FIX BY TO-UP
						$('.mini-modal').hide();
						$('.local-file').removeClass('active');
						//
            		}
            		else alert(r.error);                    
                    $('#loading').fadeOut(250); 
					//FIX BY TO-UP
					$('.mini-modal').hide();
					//
					$('.local-file').removeClass('active');
				}
			});
		}
	}
}
/*
	isImageFile(filename)
*/
function isImageFile(filename){
	var ext = (/[.]/.exec(filename)) ? /[^.]+$/.exec(filename.toLowerCase()) : '';
	if(ext && /^(jpg|png|jpeg|gif)$/.test(ext)) return true;
	else return false;
}
jQuery.extend({

	createUploadIframe: function(id, uri) {
		var frameId = 'jUploadFrame' + id;
		if(window.ActiveXObject) {
			var io = document.createElement('<iframe id="' + frameId + '" name="' + frameId + '" />');
			if(typeof uri== 'boolean') io.src = 'javascript:false';
			else if(typeof uri== 'string') io.src = uri;
		}
		else {
			var io = document.createElement('iframe');
			$(io).attr({ id: frameId, name: frameId })
		}
		$(io).css({ position: 'absolute', top: '-1000px', left: '-1000px' });
		document.body.appendChild(io);
		return io
	},

	createUploadForm: function(id, fileElementId) {
		var formId = 'jUploadForm' + id;
		var fileId = 'jUploadFile' + id;
		var form = $('<form	action="" method="POST" name="' + formId + '" id="' + formId + '" enctype="multipart/form-data"></form>');
		var oldElement = $('#' + fileElementId);
		var newElement = $(oldElement).clone();
		$(oldElement).attr('id', fileId);
		$(oldElement).before(newElement);
		$(oldElement).appendTo(form);
		$(form).css({ position: 'absolute', top: '-1200px', left: '-1200px' });
		$(form).appendTo('body');
		return form;
	},

	ajaxFileUpload: function(s) {
		s = jQuery.extend({}, jQuery.ajaxSettings, s);
		var id = new Date().getTime();
		var form = jQuery.createUploadForm(id, s.fileElementId);
		var io = jQuery.createUploadIframe(id, s.secureuri);
		var frameId = 'jUploadFrame' + id;
		var formId = 'jUploadForm' + id;
		if (s.global && !jQuery.active++) jQuery.event.trigger('ajaxStart');
		var requestDone = false;
		var xml = {}	 
		if (s.global) jQuery.event.trigger('ajaxSend', [xml, s]);
		var uploadCallback = function(isTimeout) {
			var io = document.getElementById(frameId);
			try{
				if (io.contentWindow) {
					xml.responseText = io.contentWindow.document.body ? io.contentWindow.document.body.innerHTML : null;
					xml.responseXML = io.contentWindow.document.XMLDocument?io.contentWindow.document.XMLDocument:io.contentWindow.document;
				}
				else if (io.contentDocument) {
					xml.responseText = io.contentDocument.document.body?io.contentDocument.document.body.innerHTML:null;
					xml.responseXML = io.contentDocument.document.XMLDocument?io.contentDocument.document.XMLDocument:io.contentDocument.document;
				}
			} catch(e) { jQuery.handleError(s, xml, null, e); }
			if (xml || isTimeout == 'timeout') {
				requestDone = true;
				var status;
				try {
					status = isTimeout != 'timeout' ? 'success' : 'error';
					if (status != 'error') {
						var data = jQuery.uploadHttpData(xml, s.dataType);	
						if (s.success) s.success(data, status);
						if (s.global) jQuery.event.trigger('ajaxSuccess', [xml, s]);
					}
					else jQuery.handleError(s, xml, status);
				} catch(e)	{ status = 'error'; jQuery.handleError(s, xml, status, e); }
				if (s.global) jQuery.event.trigger('ajaxComplete', [xml, s]);
				if (s.global && !--jQuery.active) jQuery.event.trigger('ajaxStop');
				if (s.complete) s.complete(xml, status);
				jQuery(io).unbind();
				setTimeout(function() { try { $(io).remove(); $(form).remove(); } catch(e) { jQuery.handleError(s, xml, null, e); } }, 100);
				xml = null;
			}
		}
		if (s.timeout > 0) setTimeout(function(){ if(!requestDone) uploadCallback('timeout'); }, s.timeout);
		try{
			var form = $('#'+formId);
			$(form).attr({ action: s.url, method: 'post', target: frameId });
			if(form.encoding) form.encoding = 'multipart/form-data';
			else form.enctype = 'multipart/form-data';
			$(form).submit();
		} catch(e) { jQuery.handleError(s, xml, null, e); }
		if ($.browser.opera) document.getElementById(frameId).onload = uploadCallback;
		else {
			if (window.attachEvent) document.getElementById(frameId).attachEvent('onload', uploadCallback);
			else document.getElementById(frameId).addEventListener('load', uploadCallback, false);
		}
		return {abort: function () {}};	
	},

	uploadHttpData: function(r, type) {
		var data = !type;
		data = type == 'xml' || data ? r.responseXML : r.responseText;
		if (type == 'script') jQuery.globalEval(data);
		if (type == 'json') eval('data ='+data);
		return data;
	}

});


(function(a){a.Jcrop=function(b,c){function i(a){return Math.round(a)+"px"}function j(a){return d.baseClass+"-"+a}function k(){return a.fx.step.hasOwnProperty("backgroundColor")}function l(b){var c=a(b).offset();return[c.left,c.top]}function m(a){return[a.pageX-e[0],a.pageY-e[1]]}function n(b){typeof b!="object"&&(b={}),d=a.extend(d,b),a.each(["onChange","onSelect","onRelease","onDblClick"],function(a,b){typeof d[b]!="function"&&(d[b]=function(){})})}function o(a,b,c){e=l(D),bc.setCursor(a==="move"?a:a+"-resize");if(a==="move")return bc.activateHandlers(q(b),v,c);var d=_.getFixed(),f=r(a),g=_.getCorner(r(f));_.setPressed(_.getCorner(f)),_.setCurrent(g),bc.activateHandlers(p(a,d),v,c)}function p(a,b){return function(c){if(!d.aspectRatio)switch(a){case"e":c[1]=b.y2;break;case"w":c[1]=b.y2;break;case"n":c[0]=b.x2;break;case"s":c[0]=b.x2}else switch(a){case"e":c[1]=b.y+1;break;case"w":c[1]=b.y+1;break;case"n":c[0]=b.x+1;break;case"s":c[0]=b.x+1}_.setCurrent(c),bb.update()}}function q(a){var b=a;return bd.watchKeys
(),function(a){_.moveOffset([a[0]-b[0],a[1]-b[1]]),b=a,bb.update()}}function r(a){switch(a){case"n":return"sw";case"s":return"nw";case"e":return"nw";case"w":return"ne";case"ne":return"sw";case"nw":return"se";case"se":return"nw";case"sw":return"ne"}}function s(a){return function(b){return d.disabled?!1:a==="move"&&!d.allowMove?!1:(e=l(D),W=!0,o(a,m(b)),b.stopPropagation(),b.preventDefault(),!1)}}function t(a,b,c){var d=a.width(),e=a.height();d>b&&b>0&&(d=b,e=b/a.width()*a.height()),e>c&&c>0&&(e=c,d=c/a.height()*a.width()),T=a.width()/d,U=a.height()/e,a.width(d).height(e)}function u(a){return{x:a.x*T,y:a.y*U,x2:a.x2*T,y2:a.y2*U,w:a.w*T,h:a.h*U}}function v(a){var b=_.getFixed();b.w>d.minSelect[0]&&b.h>d.minSelect[1]?(bb.enableHandles(),bb.done()):bb.release(),bc.setCursor(d.allowSelect?"crosshair":"default")}function w(a){if(d.disabled)return!1;if(!d.allowSelect)return!1;W=!0,e=l(D),bb.disableHandles(),bc.setCursor("crosshair");var b=m(a);return _.setPressed(b),bb.update(),bc.activateHandlers(x,v,a.type.substring
(0,5)==="touch"),bd.watchKeys(),a.stopPropagation(),a.preventDefault(),!1}function x(a){_.setCurrent(a),bb.update()}function y(){var b=a("<div></div>").addClass(j("tracker"));return g&&b.css({opacity:0,backgroundColor:"white"}),b}function be(a){G.removeClass().addClass(j("holder")).addClass(a)}function bf(a,b){function t(){window.setTimeout(u,l)}var c=a[0]/T,e=a[1]/U,f=a[2]/T,g=a[3]/U;if(X)return;var h=_.flipCoords(c,e,f,g),i=_.getFixed(),j=[i.x,i.y,i.x2,i.y2],k=j,l=d.animationDelay,m=h[0]-j[0],n=h[1]-j[1],o=h[2]-j[2],p=h[3]-j[3],q=0,r=d.swingSpeed;c=k[0],e=k[1],f=k[2],g=k[3],bb.animMode(!0);var s,u=function(){return function(){q+=(100-q)/r,k[0]=Math.round(c+q/100*m),k[1]=Math.round(e+q/100*n),k[2]=Math.round(f+q/100*o),k[3]=Math.round(g+q/100*p),q>=99.8&&(q=100),q<100?(bh(k),t()):(bb.done(),bb.animMode(!1),typeof b=="function"&&b.call(bs))}}();t()}function bg(a){bh([a[0]/T,a[1]/U,a[2]/T,a[3]/U]),d.onSelect.call(bs,u(_.getFixed())),bb.enableHandles()}function bh(a){_.setPressed([a[0],a[1]]),_.setCurrent([a[2],
a[3]]),bb.update()}function bi(){return u(_.getFixed())}function bj(){return _.getFixed()}function bk(a){n(a),br()}function bl(){d.disabled=!0,bb.disableHandles(),bb.setCursor("default"),bc.setCursor("default")}function bm(){d.disabled=!1,br()}function bn(){bb.done(),bc.activateHandlers(null,null)}function bo(){G.remove(),A.show(),A.css("visibility","visible"),a(b).removeData("Jcrop")}function bp(a,b){bb.release(),bl();var c=new Image;c.onload=function(){var e=c.width,f=c.height,g=d.boxWidth,h=d.boxHeight;D.width(e).height(f),D.attr("src",a),H.attr("src",a),t(D,g,h),E=D.width(),F=D.height(),H.width(E).height(F),M.width(E+L*2).height(F+L*2),G.width(E).height(F),ba.resize(E,F),bm(),typeof b=="function"&&b.call(bs)},c.src=a}function bq(a,b,c){var e=b||d.bgColor;d.bgFade&&k()&&d.fadeTime&&!c?a.animate({backgroundColor:e},{queue:!1,duration:d.fadeTime}):a.css("backgroundColor",e)}function br(a){d.allowResize?a?bb.enableOnly():bb.enableHandles():bb.disableHandles(),bc.setCursor(d.allowSelect?"crosshair":"default"),bb
.setCursor(d.allowMove?"move":"default"),d.hasOwnProperty("trueSize")&&(T=d.trueSize[0]/E,U=d.trueSize[1]/F),d.hasOwnProperty("setSelect")&&(bg(d.setSelect),bb.done(),delete d.setSelect),ba.refresh(),d.bgColor!=N&&(bq(d.shade?ba.getShades():G,d.shade?d.shadeColor||d.bgColor:d.bgColor),N=d.bgColor),O!=d.bgOpacity&&(O=d.bgOpacity,d.shade?ba.refresh():bb.setBgOpacity(O)),P=d.maxSize[0]||0,Q=d.maxSize[1]||0,R=d.minSize[0]||0,S=d.minSize[1]||0,d.hasOwnProperty("outerImage")&&(D.attr("src",d.outerImage),delete d.outerImage),bb.refresh()}var d=a.extend({},a.Jcrop.defaults),e,f=navigator.userAgent.toLowerCase(),g=/msie/.test(f),h=/msie [1-6]\./.test(f);typeof b!="object"&&(b=a(b)[0]),typeof c!="object"&&(c={}),n(c);var z={border:"none",visibility:"visible",margin:0,padding:0,position:"absolute",top:0,left:0},A=a(b),B=!0;if(b.tagName=="IMG"){if(A[0].width!=0&&A[0].height!=0)A.width(A[0].width),A.height(A[0].height);else{var C=new Image;C.src=A[0].src,A.width(C.width),A.height(C.height)}var D=A.clone().removeAttr("id").
css(z).show();D.width(A.width()),D.height(A.height()),A.after(D).hide()}else D=A.css(z).show(),B=!1,d.shade===null&&(d.shade=!0);t(D,d.boxWidth,d.boxHeight);var E=D.width(),F=D.height(),G=a("<div />").width(E).height(F).addClass(j("holder")).css({position:"relative",backgroundColor:d.bgColor}).insertAfter(A).append(D);d.addClass&&G.addClass(d.addClass);var H=a("<div />"),I=a("<div />").width("100%").height("100%").css({zIndex:310,position:"absolute",overflow:"hidden"}),J=a("<div />").width("100%").height("100%").css("zIndex",320),K=a("<div />").css({position:"absolute",zIndex:600}).dblclick(function(){var a=_.getFixed();d.onDblClick.call(bs,a)}).insertBefore(D).append(I,J);B&&(H=a("<img />").attr("src",D.attr("src")).css(z).width(E).height(F),I.append(H)),h&&K.css({overflowY:"hidden"});var L=d.boundary,M=y().width(E+L*2).height(F+L*2).css({position:"absolute",top:i(-L),left:i(-L),zIndex:290}).mousedown(w),N=d.bgColor,O=d.bgOpacity,P,Q,R,S,T,U,V=!0,W,X,Y;e=l(D);var Z=function(){function a(){var a={},b=["touchstart"
,"touchmove","touchend"],c=document.createElement("div"),d;try{for(d=0;d<b.length;d++){var e=b[d];e="on"+e;var f=e in c;f||(c.setAttribute(e,"return;"),f=typeof c[e]=="function"),a[b[d]]=f}return a.touchstart&&a.touchend&&a.touchmove}catch(g){return!1}}function b(){return d.touchSupport===!0||d.touchSupport===!1?d.touchSupport:a()}return{createDragger:function(a){return function(b){return d.disabled?!1:a==="move"&&!d.allowMove?!1:(e=l(D),W=!0,o(a,m(Z.cfilter(b)),!0),b.stopPropagation(),b.preventDefault(),!1)}},newSelection:function(a){return w(Z.cfilter(a))},cfilter:function(a){return a.pageX=a.originalEvent.changedTouches[0].pageX,a.pageY=a.originalEvent.changedTouches[0].pageY,a},isSupported:a,support:b()}}(),_=function(){function h(d){d=n(d),c=a=d[0],e=b=d[1]}function i(a){a=n(a),f=a[0]-c,g=a[1]-e,c=a[0],e=a[1]}function j(){return[f,g]}function k(d){var f=d[0],g=d[1];0>a+f&&(f-=f+a),0>b+g&&(g-=g+b),F<e+g&&(g+=F-(e+g)),E<c+f&&(f+=E-(c+f)),a+=f,c+=f,b+=g,e+=g}function l(a){var b=m();switch(a){case"ne":return[
b.x2,b.y];case"nw":return[b.x,b.y];case"se":return[b.x2,b.y2];case"sw":return[b.x,b.y2]}}function m(){if(!d.aspectRatio)return p();var f=d.aspectRatio,g=d.minSize[0]/T,h=d.maxSize[0]/T,i=d.maxSize[1]/U,j=c-a,k=e-b,l=Math.abs(j),m=Math.abs(k),n=l/m,r,s,t,u;return h===0&&(h=E*10),i===0&&(i=F*10),n<f?(s=e,t=m*f,r=j<0?a-t:t+a,r<0?(r=0,u=Math.abs((r-a)/f),s=k<0?b-u:u+b):r>E&&(r=E,u=Math.abs((r-a)/f),s=k<0?b-u:u+b)):(r=c,u=l/f,s=k<0?b-u:b+u,s<0?(s=0,t=Math.abs((s-b)*f),r=j<0?a-t:t+a):s>F&&(s=F,t=Math.abs(s-b)*f,r=j<0?a-t:t+a)),r>a?(r-a<g?r=a+g:r-a>h&&(r=a+h),s>b?s=b+(r-a)/f:s=b-(r-a)/f):r<a&&(a-r<g?r=a-g:a-r>h&&(r=a-h),s>b?s=b+(a-r)/f:s=b-(a-r)/f),r<0?(a-=r,r=0):r>E&&(a-=r-E,r=E),s<0?(b-=s,s=0):s>F&&(b-=s-F,s=F),q(o(a,b,r,s))}function n(a){return a[0]<0&&(a[0]=0),a[1]<0&&(a[1]=0),a[0]>E&&(a[0]=E),a[1]>F&&(a[1]=F),[Math.round(a[0]),Math.round(a[1])]}function o(a,b,c,d){var e=a,f=c,g=b,h=d;return c<a&&(e=c,f=a),d<b&&(g=d,h=b),[e,g,f,h]}function p(){var d=c-a,f=e-b,g;return P&&Math.abs(d)>P&&(c=d>0?a+P:a-P),Q&&Math.abs
(f)>Q&&(e=f>0?b+Q:b-Q),S/U&&Math.abs(f)<S/U&&(e=f>0?b+S/U:b-S/U),R/T&&Math.abs(d)<R/T&&(c=d>0?a+R/T:a-R/T),a<0&&(c-=a,a-=a),b<0&&(e-=b,b-=b),c<0&&(a-=c,c-=c),e<0&&(b-=e,e-=e),c>E&&(g=c-E,a-=g,c-=g),e>F&&(g=e-F,b-=g,e-=g),a>E&&(g=a-F,e-=g,b-=g),b>F&&(g=b-F,e-=g,b-=g),q(o(a,b,c,e))}function q(a){return{x:a[0],y:a[1],x2:a[2],y2:a[3],w:a[2]-a[0],h:a[3]-a[1]}}var a=0,b=0,c=0,e=0,f,g;return{flipCoords:o,setPressed:h,setCurrent:i,getOffset:j,moveOffset:k,getCorner:l,getFixed:m}}(),ba=function(){function f(a,b){e.left.css({height:i(b)}),e.right.css({height:i(b)})}function g(){return h(_.getFixed())}function h(a){e.top.css({left:i(a.x),width:i(a.w),height:i(a.y)}),e.bottom.css({top:i(a.y2),left:i(a.x),width:i(a.w),height:i(F-a.y2)}),e.right.css({left:i(a.x2),width:i(E-a.x2)}),e.left.css({width:i(a.x)})}function j(){return a("<div />").css({position:"absolute",backgroundColor:d.shadeColor||d.bgColor}).appendTo(c)}function k(){b||(b=!0,c.insertBefore(D),g(),bb.setBgOpacity(1,0,1),H.hide(),l(d.shadeColor||d.bgColor,1),bb.
isAwake()?n(d.bgOpacity,1):n(1,1))}function l(a,b){bq(p(),a,b)}function m(){b&&(c.remove(),H.show(),b=!1,bb.isAwake()?bb.setBgOpacity(d.bgOpacity,1,1):(bb.setBgOpacity(1,1,1),bb.disableHandles()),bq(G,0,1))}function n(a,e){b&&(d.bgFade&&!e?c.animate({opacity:1-a},{queue:!1,duration:d.fadeTime}):c.css({opacity:1-a}))}function o(){d.shade?k():m(),bb.isAwake()&&n(d.bgOpacity)}function p(){return c.children()}var b=!1,c=a("<div />").css({position:"absolute",zIndex:240,opacity:0}),e={top:j(),left:j().height(F),right:j().height(F),bottom:j()};return{update:g,updateRaw:h,getShades:p,setBgColor:l,enable:k,disable:m,resize:f,refresh:o,opacity:n}}(),bb=function(){function k(b){var c=a("<div />").css({position:"absolute",opacity:d.borderOpacity}).addClass(j(b));return I.append(c),c}function l(b,c){var d=a("<div />").mousedown(s(b)).css({cursor:b+"-resize",position:"absolute",zIndex:c}).addClass("ord-"+b);return Z.support&&d.bind("touchstart.jcrop",Z.createDragger(b)),J.append(d),d}function m(a){var b=d.handleSize,e=l(a,c++
).css({opacity:d.handleOpacity}).addClass(j("handle"));return b&&e.width(b).height(b),e}function n(a){return l(a,c++).addClass("jcrop-dragbar")}function o(a){var b;for(b=0;b<a.length;b++)g[a[b]]=n(a[b])}function p(a){var b,c;for(c=0;c<a.length;c++){switch(a[c]){case"n":b="hline";break;case"s":b="hline bottom";break;case"e":b="vline right";break;case"w":b="vline"}e[a[c]]=k(b)}}function q(a){var b;for(b=0;b<a.length;b++)f[a[b]]=m(a[b])}function r(a,b){d.shade||H.css({top:i(-b),left:i(-a)}),K.css({top:i(b),left:i(a)})}function t(a,b){K.width(Math.round(a)).height(Math.round(b))}function v(){var a=_.getFixed();_.setPressed([a.x,a.y]),_.setCurrent([a.x2,a.y2]),w()}function w(a){if(b)return x(a)}function x(a){var c=_.getFixed();t(c.w,c.h),r(c.x,c.y),d.shade&&ba.updateRaw(c),b||A(),a?d.onSelect.call(bs,u(c)):d.onChange.call(bs,u(c))}function z(a,c,e){if(!b&&!c)return;d.bgFade&&!e?D.animate({opacity:a},{queue:!1,duration:d.fadeTime}):D.css("opacity",a)}function A(){K.show(),d.shade?ba.opacity(O):z(O,!0),b=!0}function B
(){F(),K.hide(),d.shade?ba.opacity(1):z(1),b=!1,d.onRelease.call(bs)}function C(){h&&J.show()}function E(){h=!0;if(d.allowResize)return J.show(),!0}function F(){h=!1,J.hide()}function G(a){a?(X=!0,F()):(X=!1,E())}function L(){G(!1),v()}var b,c=370,e={},f={},g={},h=!1;d.dragEdges&&a.isArray(d.createDragbars)&&o(d.createDragbars),a.isArray(d.createHandles)&&q(d.createHandles),d.drawBorders&&a.isArray(d.createBorders)&&p(d.createBorders),a(document).bind("touchstart.jcrop-ios",function(b){a(b.currentTarget).hasClass("jcrop-tracker")&&b.stopPropagation()});var M=y().mousedown(s("move")).css({cursor:"move",position:"absolute",zIndex:360});return Z.support&&M.bind("touchstart.jcrop",Z.createDragger("move")),I.append(M),F(),{updateVisible:w,update:x,release:B,refresh:v,isAwake:function(){return b},setCursor:function(a){M.css("cursor",a)},enableHandles:E,enableOnly:function(){h=!0},showHandles:C,disableHandles:F,animMode:G,setBgOpacity:z,done:L}}(),bc=function(){function f(b){M.css({zIndex:450}),b?a(document).bind("touchmove.jcrop"
,k).bind("touchend.jcrop",l):e&&a(document).bind("mousemove.jcrop",h).bind("mouseup.jcrop",i)}function g(){M.css({zIndex:290}),a(document).unbind(".jcrop")}function h(a){return b(m(a)),!1}function i(a){return a.preventDefault(),a.stopPropagation(),W&&(W=!1,c(m(a)),bb.isAwake()&&d.onSelect.call(bs,u(_.getFixed())),g(),b=function(){},c=function(){}),!1}function j(a,d,e){return W=!0,b=a,c=d,f(e),!1}function k(a){return b(m(Z.cfilter(a))),!1}function l(a){return i(Z.cfilter(a))}function n(a){M.css("cursor",a)}var b=function(){},c=function(){},e=d.trackDocument;return e||M.mousemove(h).mouseup(i).mouseout(i),D.before(M),{activateHandlers:j,setCursor:n}}(),bd=function(){function e(){d.keySupport&&(b.show(),b.focus())}function f(a){b.hide()}function g(a,b,c){d.allowMove&&(_.moveOffset([b,c]),bb.updateVisible(!0)),a.preventDefault(),a.stopPropagation()}function i(a){if(a.ctrlKey||a.metaKey)return!0;Y=a.shiftKey?!0:!1;var b=Y?10:1;switch(a.keyCode){case 37:g(a,-b,0);break;case 39:g(a,b,0);break;case 38:g(a,0,-b);break;
case 40:g(a,0,b);break;case 27:d.allowSelect&&bb.release();break;case 9:return!0}return!1}var b=a('<input type="radio" />').css({position:"fixed",left:"-120px",width:"12px"}).addClass("jcrop-keymgr"),c=a("<div />").css({position:"absolute",overflow:"hidden"}).append(b);return d.keySupport&&(b.keydown(i).blur(f),h||!d.fixedSupport?(b.css({position:"absolute",left:"-20px"}),c.append(b).insertBefore(D)):b.insertBefore(D)),{watchKeys:e}}();Z.support&&M.bind("touchstart.jcrop",Z.newSelection),J.hide(),br(!0);var bs={setImage:bp,animateTo:bf,setSelect:bg,setOptions:bk,tellSelect:bi,tellScaled:bj,setClass:be,disable:bl,enable:bm,cancel:bn,release:bb.release,destroy:bo,focus:bd.watchKeys,getBounds:function(){return[E*T,F*U]},getWidgetSize:function(){return[E,F]},getScaleFactor:function(){return[T,U]},getOptions:function(){return d},ui:{holder:G,selection:K}};return g&&G.bind("selectstart",function(){return!1}),A.data("Jcrop",bs),bs},a.fn.Jcrop=function(b,c){var d;return this.each(function(){if(a(this).data("Jcrop")){if(
b==="api")return a(this).data("Jcrop");a(this).data("Jcrop").setOptions(b)}else this.tagName=="IMG"?a.Jcrop.Loader(this,function(){a(this).css({display:"block",visibility:"hidden"}),d=a.Jcrop(this,b),a.isFunction(c)&&c.call(d)}):(a(this).css({display:"block",visibility:"hidden"}),d=a.Jcrop(this,b),a.isFunction(c)&&c.call(d))}),this},a.Jcrop.Loader=function(b,c,d){function g(){f.complete?(e.unbind(".jcloader"),a.isFunction(c)&&c.call(f)):window.setTimeout(g,50)}var e=a(b),f=e[0];e.bind("load.jcloader",g).bind("error.jcloader",function(b){e.unbind(".jcloader"),a.isFunction(d)&&d.call(f)}),f.complete&&a.isFunction(c)&&(e.unbind(".jcloader"),c.call(f))},a.Jcrop.defaults={allowSelect:!0,allowMove:!0,allowResize:!0,trackDocument:!0,baseClass:"jcrop",addClass:null,bgColor:"black",bgOpacity:.6,bgFade:!1,borderOpacity:.4,handleOpacity:1,handleSize:null,aspectRatio:0,keySupport:!0,createHandles:["n","s","e","w","nw","ne","se","sw"],createDragbars:["n","s","e","w"],createBorders:["n","s","e","w"],drawBorders:!0,dragEdges
:!0,fixedSupport:!0,touchSupport:null,shade:null,boxWidth:0,boxHeight:0,boundary:2,fadeTime:400,animationDelay:20,swingSpeed:3,minSelect:[0,0],maxSize:[0,0],minSize:[0,0],onChange:function(){},onSelect:function(){},onDblClick:function(){},onRelease:function(){}}})(jQuery);