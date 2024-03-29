{if $tsAction == 'editar'}
<script type="text/javascript" src="{$tsConfig.js}/jquery.color.js"></script>
<script type="text/javascript" src="{$tsConfig.js}/cuenta.js"></script>
{literal}
<style>
#colores {width:200px; position:absolute; right:50px; padding:15px 8px 10px 10px; border:1px solid #ccc; background-color:#fafafa;}
#cerrar {position:absolute; right:5px; top:3px; z-index:2}
#colores .title {position:absolute; left:10px; top:0px; z-index:2; font-weight:bold}
#colores span {display:block; float:left; cursor:pointer; border:1px solid #FFF; border-width:1px 1px 0 0}
/* ADMIN NEW LABEL */
fieldset tr.newLabel td{text-align:left;}
fieldset tr.newLabel label{
	float:none;
	width:80px;
	padding:0;
	text-align:center;
	cursor:pointer;
}
tr.newLabel label.yes:hover {
	background-color:#86F786;
}
tr.newLabel label.no:hover {
	background-color:#EFB0B2;
}
</style>
{/literal}
	<input type="hidden" id="comid" value="{$tsDato.c_id}" />
	<div class="boxposts separa">
		<div class="titular">
			<h2>Imagen de la comunidad</h2>
		</div>
		<div class="com_edit_imagen" align="center">
			<img src="{$tsConfig.url}/files/uploads/c_{$tsDato.c_id}.jpg" id="cei_cambio" height="120" width="120" />
			<label id="subeimg" class="boto azul">
				<input type="file" id="cei_input" name="imagen" onchange="com.subir_imagen({$tsDato.c_id})"/>
				Subir imagen
			</label>
		</div>
	</div>


	<div class="boxposts separa">
		<div class="titular">	
			<h2>Apariencia</h2>
		</div>
		<div class="com_edit_apa">
        <h4>Fondo de la comunidad</h4>
        <div class="com_edit_imagen" align="center">
            <img src="{$tsConfig.url}/files/uploads/cf_{$tsDato.c_id}.jpg" id="cef_cambio" height="120" width="120" />
			<label id="subeimg" class="boto azul">
				<input type="file" id="cef_input" name="background" onchange="com.subir_fondo({$tsDato.c_id})" />
				Subir imagen
			</label>			
        </div>
		<div class="subt">
			<h4>Trama</h4>
			<input type="checkbox" name="back_repeat" id="repetir" class="floatL" {if $tsDato.c_back_repeat == 1}checked="checked"{/if} /><label for="repetir">Repetir fondo</label>
        </div>
		<div class="subt" style="height: 60px;overflow: visible;">
			<h4>Color de fondo</h4>
			<div class="com_edit_color" id="TColor" style="background: #{$tsDato.c_back_color}" title="Color actual"></div>
			<input type="text" id="rColor" name="back_color" class="input_text" value="{$tsDato.c_back_color}" style="color:#{$tsDato.c_back_color};"/>
			<div id="asli">
			<div id="colores"><span class="title">Color de fondo</span><a href="#" id="cerrar"><img src="{$tsConfig.images}/borrar.png" /></a></div>
			</div>			
		</div>        
	    {if $tsDato.c_estado == 0}
			<a onclick="com.borrar({$tsDato.c_id});" class="boto gris" style="display: block;text-align: center;margin-top: 20px;">Suspender comunidad</a>
        {elseif $tsDato.c_estado == 1}
			<a onclick="com.borrar({$tsDato.c_id}, 1);" class="boto verde" style="display: block;text-align: center;margin-top: 20px;">Reactivar comunidad</a>
        {/if}
		{if $tsUser->is_admod == 1}		
			<a onclick="com.eliminar({$tsDato.c_id});" class="boto rojo" style="display: block;text-align: center;margin-top: 20px;">Eliminar comunidad</a>
		{/if}
		</div>
	</div>
{else}
    <div class="add_com_sidebar">
        <span class="stitle">Reglas para tu comunidad</span>
        Para que tu comunidad sea exitosa te recomendamos tener en cuenta los siguientes puntos:
        <p><strong style="color:#22B447">Una comunidad SI puede:</strong></p>
        <ul class="positive-items">
            <li>Compartir ideas y pensamientos.</li>
            <li>Ser interesante para otras personas.</li>
            <li>Preguntar y Consultar.</li>
            <li>Compartir gustos y experiencias personales.</li>
        </ul>
        <p><strong style="color:#822217">Una comunidad NO puede:</strong></p>
        <ul>	
        <li>Compartir enlaces de descarga.</li>
        <li>Generar odio.</li>
        <li>Generar violencia.</li>
        <li>Compartir fotos de personas menores de edad.</li>
        <li>Mostrar muertos, sangre, v&oacute;mitos, etc.</li>
        <li>Tener contenido racista y/o peyorativo.</li>
        <li>Que sus miembros insulten a otros.</li>
        <li>Hacer apolog&iacute;a al delito.</li>
        <li>Contener software spyware, malware, virus o troyanos.</li>
        <li>Hacer Spam.</li>	
        </ul>
        <br><br>
        <strong>Por favor lea el protocolo para evitar sanciones o que tu comunidad sea eliminada haciendo <a href="{$tsConfig.url}/pages/protocolo/" target="_blank">click aqu&iacute;</a></strong>
        </div>
        <div class="box">
        <div class="floatL mg-bt">
        </div>
    </div>
{/if}