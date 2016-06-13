<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">

</head>
<body>
    <div class="row">
        <div class="col-xs-7">
            <div class="panel panel-default">
                <div class="panel-heading">Recent Shares</div>
                <div class="panel-body">
                    <g:if test="${recentShares}">
                        <g:render template="/templates/resource_brief" collection="${recentShares}" var="resource"/>
                    </g:if>
                    <g:else>
                        Oops! nothing is recent
                    </g:else>

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-9"><span>Top posts</span></div>
                        <div class="col-xs-3 pull-right">
                            <select class="dropdown">
                                <option>Today</option>
                                <option>1 Week</option>
                                <option>1 Month</option>
                                <option>1 Year</option>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="panel-body">
                    <g:if test="${topPosts}">
                        <g:render template="/templates/resource_brief" collection="${topPosts}" var="resource"/>
                    </g:if>
                    <g:else>
                        Oops! nothing on top
                    </g:else>

                </div>
            </div>

        </div>
        <div class="col-xs-5">

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
        </div>
    </div>
</body>
</html>