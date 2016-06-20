<div class="row">
    <div class="col-xs-4 ">
       <g:link controller="login" action="fetchUserDetail" params= "['userName': userData.userName]">
           <g:render template="/templates/show_image" model='[photoPath:"${userData.photoPath}"]'/>
       </g:link>
    </div>
    <div class="col-xs-8">
        <div class="row">
            <div class="col-xs-12">
                <div><b>${userData.fullName}</b>
                    <g:if test="${session.userData && session.userData.id==userData.id}">
                        <span class="pull-right">
                            <a href="#" title="Create Topic" data-toggle="modal" data-target="#update_profile">
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </a>
                        </span>
                    </g:if>
                </div>
                <div><small>@${userData.userName}</small></div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <small>Subscriptions</small> <br/>
                ${userData.subscriptions.size()-userData.topics.size()}
            </div>
            <div class="col-xs-6">
                <small>Topics</small><br/>
                ${userData.topics.size()}

            </div>
        </div>
    </div>
</div>
<hr/>