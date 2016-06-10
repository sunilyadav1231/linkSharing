<g:set var="subscription" value="${session.userData.subscriptions.findAll({it.topic==topic})}"/>

<div class="row">
        <div class="row">
            <div class="col-xs-4">
                <g:render template="/templates/show_image" model='[photoPath:"${topic?.createdBy.photoPath}"]'/>
            </div>
            <div class="col-xs-8">
                <div class="row">
                    <div class="col-xs-12">
                        <a href="#">${topic?.name}</a>
                    </div>
                </div>
                %{--<div class="padd-bottom"></div>--}%
                <div class="row">
                    <div class="col-xs-5">
                        <small>@${topic?.createdBy.userName}</small>
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
                            <g:if  test="${session.userData.id == topic.createdBy.id}">
                            </g:if>
                            <g:else>
                                <g:link controller="subscription" action="unSubscribe" params= "['subscription.id': subscription[0].id]">
                                    Unsubscribe
                                </g:link>
                            </g:else>
                        </g:if>
                        <g:else>
                                <g:link controller="subscription" action="subscribe" params= "['topic.id': topic.id]">
                                    Subscribe
                                </g:link>
                        </g:else>
                    </div>
                    <div class="col-xs-4 text-center">
                        ${topic.subscriptions?.size()}
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
                    <g:select from="${['VERY SERIOUS','SERIOUS','CASUAL']}" name="seriousness" value="${subscription[0]?.seriousness}">
                    </g:select>
            </g:if>
                </span>



                <g:if test="${session.userData.admin || topic.createdBy.id==session.userData.id}">
                    <g:set var="canUpdateTopic" value="true"/>
                </g:if>
                <g:else>
                    <g:set var="canUpdateTopic" value="false"/>
                </g:else>
                <g:if test="${canUpdateTopic=='true'}">
                    <span class="tab-space">
                        <g:select from="${['PUBLIC','PRIVATE']}" name="visibility" value="${topic.visibility}">
                        </g:select>
                    </span>
                </g:if>

                <span class="tab-space">
                    <g:if test="${session.userData.admin || subscription.size()>0}">
                        <a href="#"><i class="fa fa-envelope-o fa-lg" aria-hidden="true"></i></a>
                    </g:if>
                    <g:if test="${canUpdateTopic=='true'}">
                        <a href="#"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></a>
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
<hr>