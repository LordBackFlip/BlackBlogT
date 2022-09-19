<div class="sidebar-add-post">
	<div id="upload"></div>
	<div id="upload_form">
		<script type="text/javascript" src="{$tsConfig.default}/js/jquery.form.js"></script>
		{literal}
		<script type="text/javascript">
			$(function(){
				$('#up_form').ajaxForm({
					resetForm: true,
					dataType: 'json',
					beforeSubmit: function(a,f,o) {
						//o.dataType = $('#uploadResponseType')[0].value;
						$('#results').html('<center><img src="' + global_data.img + '/images/loading_bar.gif"/></center>');
					},
					success: function(data) {
                                        var res = $('#results');
                                        var imgs = $('#imagenes');
                                        var resp = data.length;
                                        //
                                        if(resp > 0){
                                            res.html(''); // RESET
                                            for(var i = 0; i < resp; i++ ){
                                                // STATUS
                                                var li = '<span class="status_' + data[i][0] + '>';
                                                if(data[i][0] == 1) li += '#' + (i + 1) + ' Subido con &eacute;xito.';
                                                else if(data[i][1] != 'No Found')li += data[i][1];
                                                li += '</span>';
                                                //
                                                res.append(li);
                                                // AGREGAMOS LAS CORRECTAS
                                                if(data[i][0] == 1){
                                                    var ext = data[i][2];
                                                    var img = data[i][1];
//                                                    img = img.replace(ext,'th.' + ext);
													//FIX IMAGEN BY TO-UP
													img = img.replace(ext,'' + ext);													
                                                    // HTML
                                                    var plink = '<a href="#post" onclick="upload.agregar(';
                                                    plink += "'" + data[i][1] + "'";
                                                    plink += '); return false;"';
                                                    //
                                                    var html = '<div class="item">';
                                                    html += plink + '><img src="' + img + '"/></a>';
                                                    html += plink + ' class="txt">Agregar al post</a>';
                                                    html += '</div>';
                                                    imgs.append(html);
                                                }
                                            }
                                        } else {
                                            res.html('No se seleccionaron archivos.');
                                        }
					}
				});
			});
		</script>
		{/literal}
		<form id="up_form" method="post" action="{$tsConfig.url}/upload-images.php" enctype="multipart/form-data">
			<div class="boximg">
				<p>Puedes subir imágenes para tu post desde aquí, solo selecciona las que quieras desde tu PC, y podrás agregarlas fácilmente. Esto puede tardar unos minutos.</p>
				<div class="clearfix" id="nops">
					<div id="fileinputs" class="inputs floatL">
						<input type="file" name="img1" />
						<input type="file" name="img2" />
						<input type="file" name="img3" />
						<input type="file" name="img4" />
						<input type="file" name="img5" />
						<input type="submit" class="boto verde floatL" value="Subir Im&aacute;genes" style="margin: 10px 13px 5px 13px;" />
					</div>
					<div id="imagenes" class="floatL"></div>
				</div>
				<div id="results"></div>
			</div>
		</form>
	</div>
</div>