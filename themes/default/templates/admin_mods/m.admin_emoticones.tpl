{literal}
<script type="text/javascript">
	$(function(){
		$('.kmt_tabs li a').click(function(){
            $('.kmt_tabs li.active').removeClass('active');
            $(this).parent('li').addClass('active');
            $('.kmt_content table').hide();
            var id = $(this).data('tab');
            $('.kmt_content table#cont_'+id).show();

		});
        $('#image').change(function(){
            var cssi = $("#image option:selected").css('background-image');
            $('#c_icon').css("background-image", cssi);
        });
	});
</script>
<style type="text/css">
    .km_tabbable .kmt_tabs {
        text-align: center;
    }
    .km_tabbable .kmt_tabs li {
        display: initial;
    }
    .km_tabbable .kmt_tabs li a {
        text-align: center;
        padding: 7px 10px;
        background: #f3f3f3;
        display: inline-block;
        border: solid 1px #cccccc;
        margin-right: 5px;
        font-weight: normal;
    }
    .km_tabbable .kmt_tabs li.active a {
        background: #1481B6;
        border: solid 1px #093C56;
        color: #fff;
    }
    #c_icon {
        width: 26px;
        height: 26px;
        background-repeat: no-repeat;
        background-size: 100%;
        vertical-align: middle;
    }
</style>
{/literal}

<div class="boxy-title">
    <h3>Administrar Emoticones</h3>
</div>
<div id="res" class="boxy-content">
{if $tsSave}<div class="mensajes ok">Tus cambios han sido guardados.</div>{/if}
{if $tsAct == ''}
<div class="km_tabbable">
    <ul class="kmt_tabs clearfix">
        {foreach from=$tsCatsEmotis item=c key=i}
        <li{if $i == 1} class="active"{/if}><a data-tab="{$i}">{$c.title}</a></li>
        {/foreach}
    </ul>
    <div class="kmt_content">
    {foreach from=$tsEmoticones item=categoria key=i}
	<table cellpadding="0" cellspacing="0" border="0" width="500" align="center" id="cont_{$i}" class="admin_table" {if $i > 1}style="display:none"{/if}>
        {if $categoria.data}
    	<thead>
        	<th>ID</th>
            <th>Imagen</th>
            <th>Code</th>
            <th>Opciones</th>
        </thead>
        <tbody>
            {foreach from=$categoria.data item=e}
        	<tr id="{$e.id}">
            	<td>{$e.id}</td>
                <td><img src="{$tsConfig.url}/themes/default/images/icons/smiles/{$e.image}" /></td>
                <td>{$e.code|escape}</td>
                <td class="admin_actions">
                	<a href="?act=editar&eid={$e.id}"><img src="{$tsConfig.url}/themes/default/images/icons/editar.png" title="Editar Emoticon"/></a>
                    <a href="?act=borrar&eid={$e.id}"><img src="{$tsConfig.url}/themes/default/images/icons/close.png" title="Borrar Emoticon"/></a>
                </td>
            </tr>
            {/foreach}
        </tbody>
        {else}
        <tr><td colspan="4" class="emptyData">Nada por aqu&iacute;</td></tr>
        {/if}
    </table>
    {/foreach}
    </div>
</div>
    <hr />
    <input type="button"  onclick="location.href = '{$tsConfig.url}/admin/emoticones?act=nuevo'" value="Agregar Nuevo Emoticon" class="mBtn btnOk" style="margin-left:280px;"/>
    {elseif $tsAct == 'nuevo' || $tsAct == 'editar'}
        {if $tsError}
        <div class="mensajes error">{$tsError}</div>
        {else}
        <div class="mensajes ok">Si deseas m&aacute;s emoticones debes subirlos al directorio: /themes/default/images/icons/smiles/</div>
        {/if}
        <form action="" method="post" autocomplete="off">
        <fieldset>
            <legend>Nuevo</legend>
            <dl>
                <dt><label for="code">Code:</label></dt>
                <dd><input type="text" id="code" name="code" value="{$tsEmoticon.code}" /></dd>
            </dl>
            <dl>
                <dt><label for="image">Imagen:</label></dt>
                <dd>
                    <img src="{$tsConfig.images}/space.gif" id="c_icon" style="{if $tsEmoticon.image}background-image: url({$tsConfig.url}/themes/default/images/icons/smiles/{$tsEmoticon.image});{/if}" />
                    <select name="image" id="image" style="width:164px">
                    {foreach from=$tsImages key=i item=img}
                    	<option value="{$img}" style="background-image: url({$tsConfig.url}/themes/default/images/icons/smiles/{$img})" {if $img == $tsEmoticon.image}selected{/if}>{$img}</option>
                    {/foreach}
                    </select>
                </dd>
            </dl>
            <dl>
                <dt><label for="cat">Categor&iacute;a:</label></dt>
                <dd>
                    <select name="cat" id="cat">
                    {foreach from=$tsCatsEmotis item=c key=i}
                        <option value="{$i}"{if $i == $tsEmoticon.cat}selected{/if}>{$c.title}</option>
                    {/foreach}
                    </select>
                </dd>
            </dl>
            <p><input type="submit" name="save" value="{if $tsAct == 'editar'}Guardar{else}Agregar{/if} Emoticon" class="btn_g"/></p>
        </fieldset> 
        </form>                                       
    {/if}
</div>