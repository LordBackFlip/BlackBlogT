{if $tipo == 'comus'}
<div class="com_new_box">
    <div class="com_box_title clearfix"><h2>Categor&iacute;a</h2></div>
    <div class="com_box_cuerpo">
    <br />
    <select name="cat" id="ShowCats" class="required" onChange="$('#search_form').submit();">
        <option value="0">Todas</option>
        {foreach from=$tsCats item=c}
        <option value="{$c.cid}" {if $cat == $c.cid}selected="selected"{/if}>{$c.c_nombre}</option>
        {/foreach}
    </select>
    </div>
</div>
{/if}

<div class="com_new_box">
    <div class="com_box_title clearfix"><h2>Ordenar por</h2></div>
    <div class="com_box_cuerpo">
   		<div><input type="radio" name="ord" value="fecha" checked="checked" /> Fecha</div>
    	<div><input type="radio" name="ord" value="titulo" {if $ord == 'titulo'}checked="checked"{/if} /> T&iacute;tulo</div>
        {if $tipo == 'temas'}
        <div><input type="radio" name="ord" value="votos" {if $ord == 'votos'}checked="checked"{/if} /> Votos</div>
        <div><input type="radio" name="ord" value="respuestas" {if $ord == 'respuestas'}checked="checked"{/if} /> Respuestas</div>
        {else}
        <div><input type="radio" name="ord" value="miembros" {if $ord == 'miembros'}checked="checked"{/if} /> Miembros</div>
        <div><input type="radio" name="ord" value="temas" {if $ord == 'temas'}checked="checked"{/if} /> Temas</div>
        {/if}
        <br />
        <div align="center"><input type="submit" class="input_button ibg" value="Filtrar" /></div>
    </div>
</div>

<input type="hidden" name="tipo" value="{$tipo}" />
{if $tipo == 'temas'}<input type="hidden" name="comid" value="{$comid}" />{/if}
</form>