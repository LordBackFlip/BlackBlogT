{if $tsFoto.f_status != 0 || $tsFoto.user_activo == 0}
	<div class="nada-gris" style="margin: 10px 10px 0 10px;">Esta foto no es visible{if $tsFoto.f_status == 1} por acumulaci&oacute;n de denuncias u orden administrativa{elseif $tsFoto.f_status == 2} porque est&aacute; eliminada{elseif $tsFoto.user_activo != 1} porque la cuenta del due&ntilde;o se encuentra desactivada{/if}, pero puedes verla porque eres {if $tsUser->is_admod == 1}administrador{elseif $tsUser->is_admod == 2}moderador{else}autorizado{/if}.</div><br />
{/if}
<div class="boximgg">
	<div class="boxpc" style="padding: 0;">
		<h1>{$tsFoto.f_title}<h1>
	</div>
	<div class="femas">
		<div class="panero">
			<span>Fecha de publicaci&oacute;n: {$tsFoto.f_date|date_format:"%d/%m/%Y"}</span>
		</div>
	</div>
	<div class="imgds">
		<img class="loadimg" data-original="{$tsFoto.f_url}"/>
		<p>{$tsFoto.f_description|nl2br}</p>
	</div>
	<div class="meta" style="margin: 10px 0;">
		<div class="botonetes">
			<li><a class="boto gris" href="#" onclick="fotos.votar('pos'); return false;"><span class="i mgu"></span>Me gusta</a></li>
			<li><a class="boto gris" href="#" onclick="fotos.votar('neg'); return false;"><span class="i mngu" style="margin: 1px 0;"></span></a></li>	
			<li><a class="boto gris" onclick="denuncia.nueva('foto',{$tsFoto.foto_id}, '{$tsFoto.f_title}', '{$tsFoto.user_name}'); return false;"><span class="i mavid" style="margin: 1px 0;"></span></a>			
		</div>
		<div class="floatR">
			<div class="bulto"><p><strong>{$tsFoto.f_hits}</strong><span class="i mv"></span></p>Visitas</div>
			<div class="bulto"><p><strong id="votos_total_pos">{$tsFoto.f_votos_pos}</strong><span class="i posi"></span></p>Positivos</div>
			<div class="bulto"><p><strong id="votos_total_neg">{$tsFoto.f_votos_neg}</strong><span class="i ngas"></span></p>Negativos</div>
		</div>
	</div>	
</div>