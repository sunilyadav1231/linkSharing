<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">
</head>
<body>

   <!-- <div class="row">-->
        <div class="row"   >
            <div class="col-xs-5" >
                <div class="panel ">
                    <div class="panel-body">
                        <g:render template="/templates/user_detail" model="${session.userData}" var="userData"/>
                    </div>
                </div>

                <div class="panel ">
                    <div class="panel-heading">Subscriptions <g:link controller="topic" action="userTopicList" class="pull-right font-color-white">View All</g:link></div>
                    <div class="panel-body">
                        <g:if test="${subscriptions}">
                            <g:render template="/templates/topic_detail" collection="${subscriptions}" var="topic"/>
                        </g:if>
                        <g:else>
                            Have you not subscribed to any topic yet?
                        </g:else>

                    </div>
                </div>


                <div class="panel ">
                    <div class="panel-heading">Trending topics</div>
                    <div class="panel-body">
                        <g:if test="${trendingTopics}">
                            <g:render template="/templates/topic_detail" collection="${trendingTopics}" var="topic"/>
                        </g:if>
                       <g:else>
                           Nothing is trending for you :-(
                       </g:else>
                    </div>
                </div>
            </div>
            <div class="col-xs-7" >
                <div class="panel ">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-6">
                                <h5 id="inbox_heading">Inbox</h5>
                            </div>
                            <div class="col-xs-6 ">
                                <div class="input-group pull-right">
                                    <input type="text" class="form-control" id="inbox_search"  placeholder="Search" name="q">
                                    <span class="input-group-addon inbox-search-button"><a href="#" ><i class="glyphicon glyphicon-search"></i></a></span>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="panel-body">
                        <div class="panel-body" id="inboxContent">
                            <g:if test="${inboxResources}">
                                <g:render template="/templates/resource_brief" collection="${inboxResources}" var="resource"/>
                            </g:if>
                            <g:else>
                                O o ! There is nothing in your box
                            </g:else>
                        </div>
                    </div>
                </div>
            </div>
        </div>


</body>
</html>