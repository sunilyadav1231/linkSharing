<g:render template="/templates/update_post"/>
%{--
<g:if test="${session.userData}">
<g:set var="resourceOp" value="${session.userData.resourceOperations.findAll({it.resource==resource})}"/>
</g:if>
<g:if test="${(!session.userData) || (session.userData && !resourceOp) || (session.userData && resourceOp && !resourceOp[0]?.isRead) }">
--}%

    <div class="row">
        <div class="col-xs-3 ">
            <g:link controller="login" action="fetchUserDetail" params= "['userName':resource?.createdBy.userName]">
                <g:render template="/templates/show_image" model='[photoPath:"${resource?.createdBy.photoPath}"]'/>
            </g:link>

        </div>
        <div class="col-xs-9">
            <div class="row">
                <div class="col-xs-12">
                    <div class="row">
                        <div class="col-xs-6 ">
                            <a href="#" class="">
                                <g:link controller="login" action="fetchUserDetail" params= "['userName':resource?.createdBy.userName]">
                                    ${resource?.createdBy?.fullName}
                                </g:link>

                            </a>
                        </div>
                        <div class="col-xs-6 pull-right">
                            <g:link class="tab-space pull-right" controller="login" action="showTopic" params= "['topic.id': resource?.topic?.id]">
                                ${resource?.topic?.name}
                            </g:link>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 small">
                            <g:link controller="login" action="fetchUserDetail" params= "['userName':resource?.createdBy.userName]">
                                @${resource?.createdBy?.userName}
                            </g:link>
                        </div>
                        <div class="col-xs-6 pull-right small">
                                    <time class="timeago" datetime="${resource?.dateCreated}">
                                    <g:formatDate format="MMM dd, yyyy hh:mm" date="${resource?.dateCreated}"/>
                                </time>
                        </div>
                    </div>


                    <div class=" row text-justify">
                        <div class="col-xs-12 " >
                            <p class="text-justify" >
                                <g:if test="${resource?.description?.length()>150}">
                                    ${resource?.description.substring(0,145)}...
                                </g:if>
                                <g:else>
                                    ${resource?.description}
                                </g:else>


                            </p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <a href="#"><i class="fa fa-facebook-official"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-google-plus"></i></a>
                    <div class="pull-right">
                        <g:if test="${session.userData && resource instanceof com.ttnd.ls.entity.FileResource}">
                            <span class="tab-space"><g:link controller="login" action="downloadResource" params='[path: "${resource.fileDocument}"]'><small>Download</small></g:link></span>
                        </g:if>
                        <g:if test="${session.userData && resource instanceof com.ttnd.ls.entity.LinkResource}">
                            <span class="tab-space"><a target="_blank" href="${resource.urlDocument}"><small>View full site</small></a></span>
                        </g:if>
                        <g:if test="${session.userData}">
                            <g:if test="${resource.resourceOperations[0]?.isRead}">
                            </g:if>
                            <g:else>
                                <span class="tab-space">
                                    %{--<g:link class="small" value="" controller="resourceOperation" action="markRead" params="['resource.id':resource.id,'user.id':session.userData.id,'resourceOperation.id': resource.resourceOperations[0]?.id]">
                                        Mark as read
                                    </g:link>--}%
                                    <a href="#"  id="markRead_${resource.resourceOperations[0]?.id}" value="${resource.id}" class="markRead">
                                        Mark as read
                                    </a>
                                </span>
                            </g:else>

                            <span class="tab-space"/>

                        </g:if>
                        <span class="tab-space"/>
                        <g:link class="small" controller="login" action="showPost" params= "['resource.id': resource.id]">
                                View post
                        </g:link>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr/>
%{--</g:if>--}%
