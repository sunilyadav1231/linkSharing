<script>
    $(document).ready(function(){

        $("#stars-herats").rating('create',{coloron:'green',limit:5,glyph:'glyphicon-heart'});
    });
</script>

<g:if test="${session.userData?.admin || resource.createdBy.id==session.userData?.id}">
    <g:set var="canUpdateTopic" value="true"/>
</g:if>
<g:else>
    <g:set var="canUpdateTopic" value="false"/>
</g:else>

<div class="row">
    <div class="col-xs-3 ">
        <g:render template="/templates/show_image" model='[photoPath:"${resource?.createdBy.photoPath}"]'/>
    </div>
    <div class="col-xs-9">
        <div class="row">
            <span class="col-xs-8">
                ${resource?.createdBy?.fullName}
            </span>
            <a class="col-xs-4" href="#">
                ${resource?.topic?.name}
            </a>
        </div>
        <div class="row">
            <span class="col-xs-8"> @${resource?.createdBy?.userName}  </span>
            <span class="col-xs-4">
                <small>
                    <time class="timeago" datetime="${resource?.dateCreated}">
                        <g:formatDate format="MMM dd, yyyy hh:mm" date="${resource?.dateCreated}"/>
                    </time>
                </small>
            </span>
        </div>
        <div class="row">
            <span class="col-xs-5 pull-right">
                %{--<div id="stars-herats" data-rating="3"></div>--}%

                <div id="stars-herats" disabled="true" data-rating="3"></div>
               %{-- <i class="glyphicon glyphicon-heart"></i>
                <i class="glyphicon glyphicon-heart"></i>
                <i class="glyphicon glyphicon-heart-empty"></i>
                <i class="glyphicon glyphicon-heart-empty"></i>
                <i class="glyphicon glyphicon-heart-empty"></i>--}%

            </span>
        </div>
        <div class="row text-justify">
                <div class="col-xs-12 " >
                    <p class="text-justify" >
                        ${resource?.description}
                    </p>

                </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <a href="#"><i class="fa fa-facebook-official"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <div class="pull-right">
                    <g:if test="${canUpdateTopic=='true'}">
                        <span class="tab-space"><a href="#"><small>Delete</small></a></span>
                        <span class="tab-space"><a href="#"><small>Edit</small></a></span>
                    </g:if>
                    <g:if test="${resource instanceof com.ttnd.ls.entity.FileResource}">
                        <span class="tab-space"><a href="#"><small>Download</small></a></span>
                    </g:if>
                    <g:if test="${resource instanceof com.ttnd.ls.entity.LinkResource}">
                        <span class="tab-space"><a target="_blank" href="${resource.urlDocument}"><small>View full site</small></a></span>
                    </g:if>

                    %{--<span class="tab-space"><a href="#"><small>Mark as read</small></a></span>--}%
                    %{--<span class="tab-space"><a href="#"><small>View post</small></a></span>--}%
                </div>
            </div>
        </div>
    </div>
</div>