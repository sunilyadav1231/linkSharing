    <div class="row">
        <div class="row">
            <div class="col-xs-4">
                <asset:image  class="Photo img-responsive img-circle" height="100%" width="100% " src="personIcon.png"></asset:image>
            </div>
            <div class="col-xs-8">
                <div class="row">
                    <div class="col-xs-12">
                        <a href="#">${subscription?.topic.name}</a>
                    </div>
                </div>
                <div class="padd-bottom"></div>
                <div class="row">
                    <div class="col-xs-5">
                        <small>@${subscription?.topic.createdBy.userName}</small>
                    </div>
                    <div class="col-xs-4">
                        <small>Subscription</small>
                    </div>
                    <div class="col-xs-3">
                        <small>Posts</small><br/>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-5">
                        <a href="#" >Unsubscribe</a>
                    </div>
                    <div class="col-xs-4">
                        ${subscription?.topic.subscriptions?.size()}
                    </div>
                    <div class="col-xs-3">
                        ${subscription?.topic.resources?.size()}
                    </div>
                </div>

            </div>
        </div>
        <div class="row pull-right ">
            <div class="col-xs-12">
                <span>
                    <g:select from="${['VERY SERIOUS','SERIOUS','CASUAL']}" name="seriousness" value="${subscription?.seriousness}">
                    </g:select>
                </span>



                <g:if test="${session.userData.admin || subscription?.topic.createdBy.id==session.userData.id}">
                    <g:set var="canUpdateTopic" value="true"/>
                </g:if>
                <g:else>
                    <g:set var="canUpdateTopic" value="false"/>
                </g:else>
                <g:if test="${canUpdateTopic}">
                    <span class="tab-space">
                        <g:select from="${['PUBLIC','PRIVATE']}" name="visibility" value="${subscription?.topic.visibility}">
                        </g:select>
                    </span>
                </g:if>

                <span class="tab-space">
                    <a href="#"><i class="fa fa-envelope-o fa-lg" aria-hidden="true"></i></a>
                    <g:if test="${canUpdateTopic}">
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