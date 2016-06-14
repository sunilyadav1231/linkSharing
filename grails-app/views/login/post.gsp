<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">

    <script>
        $(document).ready(function(){
            <g:if test="${session.userData}">
            $(".resource-rating").rating('create',{coloron:'green',limit:5,glyph:'glyphicon-heart'});
            $(".resource-rating").addClass('clickable')
            </g:if>
            <g:else>
            $(".resource-rating").rating('show',{coloron:'green',limit:5,glyph:'glyphicon-heart'});
            </g:else>

            $(".clickable").click(function(){
                var rating = $(this).rating('get')
                $.ajax({
                    url:"${g.createLink(controller:'resourceOperation',action:'rateResource')}",
                    dataType: 'json',
                    type : 'POST',
                    data: {
                            'resourceId':${resource.id},
                            'resourceScore':$(this).rating('get')
                    },
                    success: function(data) {
                        alert(data.ratingUserCount)
                        $("#alert_model").modal();
                        $("#res_avg_count_"+${resource.id}).rating('set',data.averageRating)
                        $("#res_user_count_"+${resource.id}).text(data.ratingUserCount)

                    },
                    error: function(request, status, error) {
                        $(this).rating('set',rating)
                    }
                });
            });
        });
    </script>
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

    <div class="modal fade" id="alert_model" role="alert">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Post Rated Successfully</h4>
                </div>
                <div class="modal-body">
                    <p>You rated the post successfully</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
            </div>

        </div>
    </div>
</body>
</html>