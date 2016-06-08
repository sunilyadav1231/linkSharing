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
                        <div class="row">
                            <div class="col-xs-4 ">
                                <g:if test="${userData?.photoPath}">

                                    <img class="Photo img-responsive img-circle"  height="100%" width="100% " src="${createLink(controller:'user', action:'showImage',params: [path: "${userData.photoPath}"] )}" />
                                </g:if>
                                <g:else>
                                    <asset:image height="100%" width="100% " class="Photo img-responsive img-circle"  src="personIcon.png"></asset:image>
                                </g:else>

                            </div>
                            <div class="col-xs-8">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div><b>${userData.fullName}</b></div>
                                            <div><small>@${userData.userName}</small></div>
                                        </div>
                                    </div>

                                <div class="row">
                                    <div class="col-xs-6">
                                       <small>Subscriptions</small> <br/>
                                        ${userData.subscriptions.size()}
                                    </div>
                                    <div class="col-xs-6">
                                        <small>Topics</small><br/>
                                        ${userData.topics.size()}

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">Subscriptions <a href="#" class="pull-right">View All</a></div>
                    <div class="panel-body">
                        <g:render template="/templates/topic_detail" collection="${subscriptions}" var="subscription"/>

                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading">Trending topics</div>
                    <div class="panel-body">
                        <g:render template="/templates/trending_topic_detail" collection="${trendingTopics}" var="topic"/>
                        %{--<div class="row">
                            <div class="row">
                                <div class="col-xs-3 ">
                                    <asset:image src="personIcon.png"></asset:image>
                                </div>
                                <div class="col-xs-9">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <a href="#">Grails</a>
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
                                <br/>
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
                                    <a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="row">
                                <div class="col-xs-3 ">
                                    <asset:image src="personIcon.png"></asset:image>
                                </div>
                                <div class="col-xs-9">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <input type="text" placeholder="Grails" class="form-control"/>
                                        </div>
                                        <div class="col-xs-4 pull-left">
                                            <button class="">Save</button>
                                        </div>
                                        <div class="col-xs-4 pull-left">
                                            <button class="">Cancel</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4">

                                            <small>@uday</small>
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
                                <div class="col-xs-4">

                                </div>
                                <div class="col-xs-4">

                                </div>
                                <div class="col-xs-4">
                                    <a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>--}%
                    </div>
                </div>


                <!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->
            </div>



            <div class="col-xs-7" >
                <div class="panel panel-default">
                    <div class="panel-heading">Inbox <a href="#" class="pull-right">View All</a></div>
                    <div class="panel-body">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-3 ">
                                    <asset:image src="personIcon.png"></asset:image>
                                </div>
                                <div class="col-xs-9">
                                    <div>
                                        <p class="text-justify">Uday Pratap Singh  <span class="small text-center">@uday 21 Jul 2014 </span>           <a href="#" class="pull-right">Grails</a><br/>
                                            Lorem Ipsum Depsum sit amet, consectetur adipiscing elit, Nulla quam sfsf sdfs dfg  asfisoi ndsoufb sadfs ghgfhijb juseeih nishci sacromfj</p>
                                    </div>
                                    <div class="">
                                        <a href="#"><i class="fa fa-facebook-official"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                        <div class="pull-right">
                                            <a href="#" class="tab-space"><small>Download</small></a>
                                            <a href="#" class="tab-space"><small>View full site</small></a>
                                            <a href="#" class="tab-space"><small>Mark as read</small></a>
                                            <a href="#" class="tab-space"><small>View post</small></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-xs-3 ">
                                    <asset:image src="personIcon.png"></asset:image>
                                </div>
                                <div class="col-xs-9">
                                    <div>
                                        <p class="text-justify">Uday Pratap Singh  <span class="small text-center">@uday 21 Jul 2014 </span>           <a href="#" class="pull-right">Grails</a><br/>
                                            Lorem Ipsum Depsum sit amet, consectetur adipiscing elit, Nulla quam sfsf sdfs dfg  asfisoi ndsoufb sadfs ghgfhijb juseeih nishci sacromfj</p>
                                    </div>
                                    <div class="">
                                        <a href="#"><i class="fa fa-facebook-official"></i></a>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                        <div class="pull-right">
                                            <a href="#" class="tab-space"><small>Download</small></a>
                                            <a href="#" class="tab-space"><small>View full site</small></a>
                                            <a href="#" class="tab-space"><small>Mark as read</small></a>
                                            <a href="#" class="tab-space"><small>View post</small></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->




                <!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->





            </div>

        </div>
        <!--</div>-->
</body>
</html>