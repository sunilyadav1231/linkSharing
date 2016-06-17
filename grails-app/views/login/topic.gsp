<!DOCTYPE html>
<html lang="en">
<head>
        <meta name="layout" content="main">

    <script>
        $(document).ready(function(){

            $(".topic_seriousness").change(function(){
                $.ajax({
                    url:"${g.createLink(controller:'subscription',action:'changeSeriousness')}",
                    dataType: 'json',
                    type : 'POST',
                    data: {
                        'subscriptionId':$(this).attr('identity'),
                        'topicSeriousness':$(this).val()
                    },
                    success: function(data) {
                        $("#seriousness_alert_model").modal();
                    },
                    error: function(request, status, error) {

                    }
                });
            });

/*            $(".topic_visiblity").change(function(){
                $.ajax({
                    url:"${g.createLink(controller:'topic',action:'changeVisiblity')}",
                    dataType: 'json',
                    type : 'POST',
                    data: {
                        'topicId':$(this).attr('identity'),
                        'topicVisibility':$(this).val()
                    },
                    success: function(data) {
                        //$(".visible_"+data.id).val(data.visibility);
                        $("#seriousness_alert_model").modal();
                    },
                    error: function(request, status, error) {

                    }
                });
            });*/
        });
    </script>
</head>
<body>

    <div class="row"   >
        <div class="col-xs-7" >
            <div class="panel panel-default">

                <div class="panel-body">
                    <g:render template="/templates/topic_detail" model="${topic}" var="topic"/>
                </div>
            </div>
            <g:if test="${topic.resources}">
                <div class="panel panel-default">
                    <div class="panel-heading">Resources</div>
                    <div class="panel-body">
                        <g:render template="/templates/resource_detail" collection="${topic.resources}" var="resource"/>
                    </div>
                </div>
            </g:if>
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