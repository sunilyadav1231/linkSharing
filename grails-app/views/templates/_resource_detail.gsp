<g:render template="/templates/update_post"/>

<g:if test="${session.userData?.admin || resource?.createdBy?.id==session.userData?.id}">
    <g:set var="canUpdateTopic" value="true"/>
</g:if>
<g:else>
    <g:set var="canUpdateTopic" value="false"/>
</g:else>


<div class="row">
    <div class="col-xs-3 ">
        <g:link controller="login" action="fetchUserDetail" params= "['userName':resource?.createdBy.userName]">
            <g:render template="/templates/show_image" model='[photoPath:"${resource?.createdBy?.photoPath}"]'/>
        </g:link>
    </div>
    <div class="col-xs-9">
        <div class="row">
            <span class="col-xs-8">
                <g:link controller="login" action="fetchUserDetail" params= "['userName':resource?.createdBy.userName]">
                    ${resource?.createdBy?.fullName}
                </g:link>
            </span>
            <g:link class="col-xs-4" controller="login" action="showTopic" params= "['topic.id': resource?.topic?.id]">
                ${resource?.topic?.name}
            </g:link>
        </div>
        <div class="row">
            <span class="col-xs-7">
                <g:link controller="login" action="fetchUserDetail" params= "['userName':resource?.createdBy.userName]">
                    @${resource?.createdBy?.userName}
                </g:link>

            </span>
            <span class="col-xs-5 small pull-right">
                    <time class="timeago" datetime="${resource?.dateCreated}">
                        <g:formatDate format="MMM dd, yyyy hh:mm" date="${resource?.dateCreated}"/>
                    </time>
            </span>
        </div>
        <div class="row">

            <g:if test="${resource?.ratingUserCount && resource?.averageRating}">

                <span class="col-xs-5 pull-right resource-rating" identity="${resource?.id}" id="res_avg_count_${resource?.id}" data-rating="${resource.averageRating}">
                </span>
            </g:if>
            <g:else>
                <span class="col-xs-5 pull-right resource-rating" identity="${resource?.id}">
                </span>
            </g:else>
        </div>
        <div class="row">
        <span  class="col-xs-5 pull-right">
            Rating:
            <g:if test="${resource?.averageRating}">

                    <span id="res_user_count_${resource?.id}">${resource?.ratingUserCount}</span>
               %{-- </span>--}%
            </g:if>
            <g:else>
                <span id="res_user_count_${resource?.id}"> 0
                </span>
            </g:else>
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
                        <span class="tab-space"><a href="#" class="delete_resource" identity="${resource.id}" ><small>Delete</small></a></span>
                            <span class="tab-space"><a href="#" title="Update Resource" data-toggle="modal" data-target="#update_post_${resource.id}" ><small>Edit</small></a></span>
                        </g:if>
                    <g:if test="${resource instanceof com.ttnd.ls.entity.FileResource}">
                        <span class="tab-space"><g:link controller="login" action="downloadResource" params='[path: "${resource.fileDocument}"]'><small>Download</small></g:link></span>
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
<hr/>