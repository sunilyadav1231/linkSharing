<g:if test="${photoPath!='null'}">
    <img class="Photo img-responsive img-circle"  height="100%" width="100% " src="${createLink(controller:'login', action:'showImage',params: [path: "${photoPath}"] )}" />
</g:if>
<g:else>
    <asset:image height="100%" width="100% " class="Photo img-responsive img-circle"  src="personIcon.png"></asset:image>
</g:else>