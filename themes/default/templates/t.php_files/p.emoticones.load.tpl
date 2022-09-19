<div class="e_nav left"><a class="en_up"></a><a class="en_down"></a></div>
<div class="e_container">
    <div class="e_content active ec_tab_0"></div>
    {foreach from=$tsEmoticones item=categoria key=i}
    <div class="e_content ec_tab_{$i}">
        {foreach from=$categoria.data item=e}
        <a data-code="{$e.code}" data-image="{$e.image}" style="background-image: url({$tsConfig.default}/images/icons/smiles/{$e.image})"></a>
        {/foreach}
    </div>
    {/foreach}
</div>
<div class="e_nav right"><a class="en_up"></a><a class="en_down"></a></div>
<ul class="e_tabs">
    <li class="active" data-tab="0">Recientes</li>
    {foreach from=$tsCategorias item=c key=i}
    <li data-tab="{$i}">{$c.title}</li>
    {/foreach}
</ul>