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


            %{--<div class="panel panel-default">
                <div class="panel-heading">Trending topics</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="row">
                            <div class="col-xs-3 ">
                                <asset:image  src="personIcon.png"></asset:image>
                            </div>
                            <div class="col-xs-9">

                                <div class="row">
                                    <span class="col-xs-8">Uday Pratap Singh</span>
                                    <a class="col-xs-4" href="#">Grails</a>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">
                                        <br/> <small>@uday</small>
                                        <br/> <a href="#" >Subscribe</a>

                                    </div>
                                    <div class="col-xs-4">
                                        <br/><small>Subscription</small> <br/>
                                        50
                                    </div>
                                    <div class="col-xs-4">
                                        <br/><small>Topics</small><br/>
                                        30
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <hr>
                    <div class="row">
                        <div class="row">
                            <div class="col-xs-3 ">
                                <asset:image  src="personIcon.png"></asset:image>
                            </div>
                            <div class="col-xs-9">

                                        <div class="row">
                                            <span class="col-xs-8">Uday Pratap Singh</span>
                                            <a class="col-xs-4" href="#">Grails</a>
                                        </div>

                                <div class="row">
                                    <div class="col-xs-4">
                                        <br/> <small>@uday</small>
                                        <br/> <a href="#" >Unsubscribe</a>
                                    </div>
                                    <div class="col-xs-4">
                                        <br/><small>Subscription</small> <br/>
                                        50
                                    </div>
                                    <div class="col-xs-4">
                                        <br/><small>Topics</small><br/>
                                        30
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-3"></div>
                            <div class="col-xs-3">
                                <select class="dropdown">
                                    <option>Serious</option>
                                    <option>Serious</option>
                                    <option>Serious</option>
                                </select>
                            </div>
                            <div class="col-xs-3">
                                <select class="dropdown">
                                    <option>Private</option>
                                    <option>Private</option>
                                    <option>Private</option>
                                </select>
                            </div>
                            <div class="col-xs-3">
                                <a href="#">edit</a>
                                <a class="tab-space" href="#">delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--}%
            <!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->
        </div>

    </div>
    <!--</div>-->
</body>
</html>