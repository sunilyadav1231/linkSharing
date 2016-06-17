<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">


</head>
<body>

    <div class="row"   >
        <div class="col-xs-7" >
            <div class="panel panel-default">
                <div class="panel-body">
                    <g:render template="/templates/resource_detail" model="${resource}" var="resource"/>
                </div>
            </div>
        </div>

        <div class="col-xs-5" >
            <g:if test="${session.userData}">
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
            </g:else>


        </div>

    </div>

</body>
</html>