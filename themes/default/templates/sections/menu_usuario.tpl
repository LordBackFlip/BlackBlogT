{if $tsUser->is_member}
{else}
<div class="nouse">
	<a class="iden" href="/login?redirect=%2F"><i class="fad fa-sign-in-alt"></i><span class="socult">INGRESAR</span></a>
	<a class="regi" href="/registro/"><i class="fad fa-user-plus"></i><span class="socult">REGISTRARtE</span></a>
</div>
{/if}				