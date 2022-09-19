{if $tsPages.pages > 1}
	<div class="paginat">
		<div class="boxpag">
			<div class="bante"><a {if $tsPages.prev > 0 && $tsPages.max == false}href="pagina{$tsPages.prev}"{else}class="inactivo"{/if}>Anterior</a></div>			
			<div class="pnume">
				<ul>
					{if $tsPages.current < 8}
						{section name=page start=1 loop=9}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}			
					{if $tsPages.current > 7 && $tsPages.current < 14}
						{section name=page start=7 loop=15}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}
					{if $tsPages.current > 13 && $tsPages.current < 20}
						{section name=page start=13 loop=21}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}
					{if $tsPages.current > 19 && $tsPages.current < 26}
						{section name=page start=19 loop=27}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}					
					{if $tsPages.current > 25 && $tsPages.current < 32}
						{section name=page start=25 loop=33}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}
					{if $tsPages.current > 31 && $tsPages.current < 38}
						{section name=page start=31 loop=39}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}
					{if $tsPages.current > 37 && $tsPages.current < 44}
						{section name=page start=37 loop=45}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}
					{if $tsPages.current > 43 && $tsPages.current < 50}
						{section name=page start=43 loop=51}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}					
					{if $tsPages.current > 49 && $tsPages.current < 56}
						{section name=page start=49 loop=57}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}										
					{if $tsPages.current > 55 && $tsPages.current < 62}
						{section name=page start=55 loop=63}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}										
					{if $tsPages.current > 61 && $tsPages.current < 68}
						{section name=page start=61 loop=69}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}									
					{if $tsPages.current > 67 && $tsPages.current < 74}
						{section name=page start=67 loop=75}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}														
					{if $tsPages.current > 73 && $tsPages.current < 80}
						{section name=page start=73 loop=81}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}			
					{if $tsPages.current > 79 && $tsPages.current < 86}
						{section name=page start=79 loop=87}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}
					{if $tsPages.current > 85 && $tsPages.current < 92}
						{section name=page start=85 loop=93}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}				
					{if $tsPages.current > 91 && $tsPages.current < 98}
						{section name=page start=91 loop=99}
							<li {if $tsPages.current == $smarty.section.page.index}class="active"{/if}><a href="pagina{$smarty.section.page.index}">{$smarty.section.page.index}</a></li>
						{/section}
					{/if}					
				</ul>
			</div>			
			<div class="bdesp"><a {if $tsPages.next <= $tsPages.pages}href="pagina{$tsPages.next}"{else}class="inactivo"{/if}>Siguiente</a></div>
		</div>
	</div>
{/if}