<!DOCTYPE html>
<html lang="en">
<head>
        <meta name="layout" content="main">
</head>
<body>

    <div class="row"   >
        <div class="col-xs-5" >
            <div class="panel panel-default">

                <div class="panel-body">
                    <g:render template="/templates/topic_detail" model="${topic}" var="topic"/>
                </div>
            </div>
            <g:if test="${topic.subscriptions}">
                <div class="panel panel-default">
                    <div class="panel-heading">Subscribed User(s) <g:link controller="topic" action="topicSubscribers" params="['topicId':topic.id]" class="pull-right">View All</g:link></div>
                    <div class="panel-body">
                        <g:render template="/templates/user_detail" collection="${topic.subscriptions*.user}" var="userData"/>
                    </div>
                </div>
            </g:if>
        </div>

        <div class="col-xs-7" >

                <div class="panel panel-default">
                    <div class="panel-heading">Resource(s) <g:link controller="resource" action="topicResourceList" params="['topicId':topic.id]" class="pull-right">View All</g:link></div>
                    <div class="panel-body">
                        <g:if test="${topic.resources}">
                            <g:render template="/templates/resource_brief" collection="${topicResources}" var="resource"/>
                        </g:if>
                        <g:else>
                            No resources to show
                        </g:else>
                    </div>
                </div>

        </div>

    </div>

</body>
</html>