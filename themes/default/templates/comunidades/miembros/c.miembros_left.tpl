<div class="com_loc_global">
	<ul class="clearfix">
    	<li><a href="{$tsConfig.url}/comunidades/">Comunidades</a></li>
        <li><a href="{$tsConfig.url}/comunidades/home/{$tsCom.cat.c_seo}/">{$tsCom.cat.c_nombre}</a></li>
        <li><a href="{$tsConfig.url}/comunidades/{$tsCom.c_nombre_corto}/">{$tsCom.c_nombre}</a></li>
        <li>Miembros</li>
    </ul>
</div>
<div class="com_members_filter clearfix">
	<div class="clearfix floatL">
	<input type="text" class="input_text floatL" style="width: 305px;margin: 0;margin-right: 3px;" id="search_member" />
	<input type="button" value="Buscar" class="boto verde" style="margin: 0;padding: 8px 10px;" onclick="com.search_member();"/>
    </div>
    <ul class="cmf_select clearfix floatR">
    	<li id="miembros" class="active"><a onclick="com.load_members('miembros');">Miembros</a></li>
        <li id="suspendidos"><a onclick="com.load_members('suspendidos');">Suspendidos</a></li>
    </ul>
</div>
<div id="com_members_result">{include file=t.comus_ajax/c.com_members.tpl}</div>
