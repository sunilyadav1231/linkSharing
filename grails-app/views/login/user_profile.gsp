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
                <g:render template="/templates/user_detail" model="${userData}" var="userData"/>
            </div>
        </div>
        <g:if test="${topics}">
            <div class="panel panel-default">
                <div class="panel-heading">Topics</div>
                <div class="panel-body">
                    <g:render template="/templates/topic_detail" collection="${topics}" var="topic"/>
                </div>
            </div>
        </g:if>
        <g:if test="${subscribedTopics}">
            <div class="panel panel-default">
                <div class="panel-heading">Subscription</div>
                <div class="panel-body">
                    <g:render template="/templates/topic_detail" collection="${subscribedTopics}" var="topic"/>
                </div>
            </div>
        </g:if>

    </div>

    <div class="col-xs-7" >
        <g:if test="${posts}">
            <div class="panel panel-default">
                <div class="panel-heading">Posts</div>
                <div class="panel-body">
                    <g:render template="/templates/resource_detail" collection="${posts}" var="resource"/>
                </div>
            </div>
        </g:if>

    </div>

</div>

</body>
</html>