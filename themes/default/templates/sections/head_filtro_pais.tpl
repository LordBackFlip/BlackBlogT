<div class="menuca" id="paifi">
	<div id="selcat">
		{if $tsPais}
			{if $tsPais == 'ar'}Argentina{/if}
			{if $tsPais == 'cl'}Chile{/if}
			{if $tsPais == 'co'}Colombia{/if}
			{if $tsPais == 'mx'}M&eacute;xico{/if}
			{if $tsPais == 'pe'}Per&uacute;{/if}
			{if $tsPais == 'uy'}Uruguay{/if}
			{if $tsPais == 've'}Venezuela{/if}
		{else}
			Global
		{/if}
		<span class="toup-chevron-down"></span>
	</div>
	<div class="catlis">
		<a href="{$tsConfig.url}" {if $tsPais}{else}class="listo"{/if}>Global</a>
		<a href="{$tsConfig.url}/?pais=ar" {if $tsPais == 'ar'}class="listo"{/if}>Argentina</a>
		<a href="{$tsConfig.url}/?pais=cl" {if $tsPais == 'cl'}class="listo"{/if}>Chile</a>			
		<a href="{$tsConfig.url}/?pais=co" {if $tsPais == 'co'}class="listo"{/if}>Colombia</a>
		<a href="{$tsConfig.url}/?pais=mx" {if $tsPais == 'mx'}class="listo"{/if}>M&eacute;xico</a>
		<a href="{$tsConfig.url}/?pais=pe" {if $tsPais == 'pe'}class="listo"{/if}>Per&uacute;</a>
		<a href="{$tsConfig.url}/?pais=uy" {if $tsPais == 'uy'}class="listo"{/if}>Uruguay</a>
		<a href="{$tsConfig.url}/?pais=ve" {if $tsPais == 've'}class="listo"{/if}>Venezuela</a>		
	</div>
</div>