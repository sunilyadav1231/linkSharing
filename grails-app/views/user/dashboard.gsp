<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">
</head>
<body>

   <!-- <div class="row">-->
        <div class="row"   >
            <div class="col-xs-5" >
                <div class="panel panel-default">
                    <div class="panel-body">
                        <g:render template="/templates/user_detail" model="${session.userData}" var="userData"/>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">Subscriptions <g:link controller="topic" action="userTopicList" class="pull-right">View All</g:link></div>
                    <div class="panel-body">
                        <g:if test="${subscriptions}">
                            <g:render template="/templates/topic_detail" collection="${subscriptions}" var="topic"/>
                        </g:if>
                        <g:else>
                            Have you not subscribed to any topic yet?
                        </g:else>

                    </div>
                </div>


                <div class="panel panel-default">
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
                <div class="panel panel-default">
                    <div class="panel-heading">Inbox <g:link controller="resource" action="resourceList" class="pull-right">View All</g:link></div>
                    <div class="panel-body">
                        <div class="panel-body">
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