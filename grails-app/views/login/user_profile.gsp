<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">

</head>
<body>

<div class="row"   >
    <div class="col-xs-5" >
        <div class="panel">
            <div class="panel-body">
                <g:render template="/templates/user_detail" model="${userData}" var="userData"/>
            </div>
        </div>
        <g:if test="${topics}">
            <div class="panel">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <h5 id="topic_heading">Topic(s)</h5>
                        </div>
                        <g:if test="${session.userData && session.userData.id== userData.id}">
                            <div class="col-xs-6 ">
                                <div class="input-group pull-right">
                                    <input type="text" class="form-control" id="user_topic_search"  placeholder="Search" name="q">
                                    <span class="input-group-addon user_topic_search_button"><a href="#" ><i class="glyphicon glyphicon-search"></i></a></span>
                                </div>
                            </div>
                        </g:if>

                    </div>

                </div>
                <div class="panel-body" id="user_topic_content">
                    <g:render template="/templates/topic_detail" collection="${topics}" var="topic"/>
                </div>
            </div>
        </g:if>
        <g:if test="${subscribedTopics}">
            <div class="panel">
                <div class="panel-heading">Subscription</div>
                <div class="panel-body">
                    <g:render template="/templates/topic_detail" collection="${subscribedTopics}" var="topic"/>
                </div>
            </div>
        </g:if>

    </div>

    <div class="col-xs-7" >
        <g:if test="${posts}">
            <div class="panel">
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