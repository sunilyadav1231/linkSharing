<g:render template="/templates/update_topic"/>

<g:set var="subscription" value="${session.userData?.subscriptions.findAll({it.topic.id==topic.id})}"/>
<div class="row">
    <div class="col-xs-12">
        <div class="row">
            <div class="col-xs-4">
                <g:link controller="login" action="fetchUserDetail" params= "['userName':topic?.createdBy.userName]">
                    <g:render template="/templates/show_image" model='[photoPath:"${topic?.createdBy.photoPath}"]'/>
                </g:link>

            </div>
            <div class="col-xs-8">
                <div class="row">
                    <div class="col-xs-12">
                        <g:link controller="login" action="showTopic" params= "['topic.id': topic.id]">
                           <u>${topic?.name}</u>
                        </g:link>
                            <g:if test="${topic?.visibility==com.ttnd.ls.enumConstant.Visibility.PRIVATE}">
                                <i class="fa fa-lock tab-space" aria-hidden="true"></i>
                            </g:if>

                    </div>
                </div>
                %{--<div class="padd-bottom"></div>--}%
                <div class="row">
                    <div class="col-xs-5 small">
                        <g:link controller="login" action="fetchUserDetail" params= "['userName':topic?.createdBy.userName]">
                            @${topic?.createdBy.userName}
                        </g:link>
                    </div>
                    <div class="col-xs-4 ">
                        Subscription
                    </div>
                    <div class="col-xs-3 ">
                        Posts
                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-5">
                        %{--<a href="${createLink(controller: 'subscription', action: 'subscribe',params: [topic: "${subscription?.topic}"])}" >Unsubscribe</a>--}%
                        <g:if test="${subscription.size()>0}">
                            <g:if  test="${session.userData?.id == topic.createdBy.id}">
                            </g:if>
                            <g:else>
                                <g:link controller="subscription" action="unSubscribe" params= "['subscription.id': subscription[0].id]">
                                    Unsubscribe
                                </g:link>
                            </g:else>
                        </g:if>
                        <g:else>
                            <g:if  test="${session.userData}">
                                <g:link controller="subscription" action="subscribe" params= "['topic.id': topic.id]">
                                    Subscribe
                                </g:link>
                            </g:if>

                        </g:else>
                    </div>
                    <div class="col-xs-4 text-center">
                        ${topic.subscriptions?.size()-1}
                    </div>
                    <div class="col-xs-3 text-center">
                        ${topic.resources?.size()}
                    </div>
                </div>

            </div>
        </div>
        <div class="padd-bottom"></div>
        <div class="row pull-right ">
            <div class="col-xs-12">
            <g:if test="${subscription.size()>0}">

                    <g:select identity="${subscription[0].id}" class="topic_seriousness serious_${topic.id}" from="${['VERY_SERIOUS','SERIOUS','CASUAL']}" name="seriousness" value="${subscription[0]?.seriousness}">
                    </g:select>
            </g:if>
                <g:if test="${session.userData?.admin || topic.createdBy.id==session.userData?.id}">
                    <g:set var="canUpdateTopic" value="true"/>
                </g:if>
                <g:else>
                    <g:set var="canUpdateTopic" value="false"/>
                </g:else>
                <g:if test="${canUpdateTopic=='true'}">
                    <span class="tab-space">

                        <g:if test="${topic.visibility==com.ttnd.ls.enumConstant.Visibility.PUBLIC}">
                            <input type="checkbox" identity="${topic.id}"  class="topic_visibility"    data-on="PUBLIC" data-off="PRIVATE" checked data-toggle="toggle" data-size="mini">
                        </g:if>
                        <g:else>
                            <input type="checkbox" identity="${topic.id}" class="topic_visibility" data-on="PUBLIC" data-off="PRIVATE" data-toggle="toggle" data-size="mini"  >
                        </g:else>

                        %{--<g:select identity="${topic.id}" class="topic_visiblity visible_${topic.id}" from="${['PUBLIC','PRIVATE']}" name="visibility" value="${topic.visibility}">
                        </g:select>--}%
                    </span>
                </g:if>

                <span class="tab-space">
                    <g:if test="${session.userData?.admin || subscription.size()>0}">
                        <a data-target="#send_invitation" class="invitation_modal" identity="${topic.id}" data-toggle="modal"  title="send invitation" href="#"><i class="fa fa-envelope-o fa-lg" aria-hidden="true"></i></a>
                    </g:if>
                    <g:if test="${canUpdateTopic=='true'}">
                        <a href="#" title="Update Topic" data-toggle="modal" data-target="#update_topic_${topic.id}"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
                        <a href="#" class="delete_topic" identity="${topic.id}" title="Delete Topic"><i class=" fa fa-trash-o fa-lg" aria-hidden="true"></i></a>
                    </g:if>
                </span>
                <span class="tab-space"></span>
            </div>

            %{--<div class="col-xs-4">

            </div>
            <div class="col-xs-4">

            </div>
            <div class="col-xs-4">
                <a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
            </div>--}%
        </div>
    </div>
</div>
<hr>