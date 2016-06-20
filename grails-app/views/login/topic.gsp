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
                    <div class="panel-heading">Resources</div>
                    <div class="panel-body">
                        <g:render template="/templates/user_detail" collection="${topic.subscriptions*.user}" var="userData"/>
                    </div>
                </div>
            </g:if>
        </div>

        <div class="col-xs-7" >

                <div class="panel panel-default">
                    <div class="panel-heading">Resources</div>
                    <div class="panel-body">
                        <g:if test="${topic.resources}">
                            <g:render template="/templates/resource_detail" collection="${topic.resources}" var="resource"/>
                        </g:if>
                        <g:else>
                            No resources to show you
                        </g:else>
                    </div>
                </div>

           %{-- <g:if test="${session.userData}">
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

            </g:if>
            <g:else>
                <div class="panel panel-default">
                    <div class="panel-heading">Login</div>
                    <div class="panel-body">
                        <g:render template="/templates/login"/>
                    </div>
                </div>

                <div class="panel panel-default ">
                    <div class="panel-heading">Register</div>
                    <div class="panel-body">
                        <g:render template="/templates/register"/>
                    </div>
                </div>
            </g:else>--}%


        </div>

    </div>

</body>
</html>