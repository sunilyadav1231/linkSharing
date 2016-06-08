<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">

</head>
<body>
%{--    <div class="row">
        <div  class=" panel panel-default">
            <div class="panel-body">
                <div class="col-xs-9">
                    <h3><a href="#">Link Sharing</a></h3>
                </div>
                <div class="col-xs-3 ">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                        <input type="text" class="form-control" placeholder="Search" name="q">
                    </div>
                </div>
            </div>
        </div>
    </div>--}%
    <!-- <div class="row">-->

    <div class="row"   >
        <div class="col-xs-7">
            <div class="panel panel-default">
                <div class="panel-heading">Recent Shares</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-4 ">
                            <asset:image src="personIcon.png"></asset:image>
                           %{-- <img height="100" width="100" src="images/"  class="img-rounded">--}%
                        </div>
                        <div class="col-xs-8">
                            <div>
                                <p style="font-size: 12px">Uday Pratap Singh  <span class="small text-center">@uday 21 Jul 2014 </span>           <a href="#" class="pull-right">Grails</a><br/>
                                    Lorem Ipsum Depsum sit amet, consectetur adipiscing elit, Nulla quam sfsf sdfs dfg  asfisoi ndsoufb sadfs ghgfhijb juseeih nishci sacromfj</p>
                            </div>
                            <div class="">
                                <a href="#"><i class="fa fa-facebook-official"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                                <div class="pull-right"><a href="#">View post</a></div>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-xs-4 ">
                            <asset:image src="personIcon.png"></asset:image>
                        </div>
                        <div class="col-xs-8">
                            <div>
                                <p style="font-size: 12px">Uday Pratap Singh  <span class="small text-center">@uday 21 Jul 2014 </span>           <a href="#" class="pull-right">Grails</a><br/>
                                    Lorem Ipsum Depsum sit amet, consectetur adipiscing elit, Nulla quam sfsf sdfs dfg  asfisoi ndsoufb sadfs ghgfhijb juseeih nishci sacromfj</p>
                            </div>
                            <div class="">
                                <a href="#"><i class="fa fa-facebook-official"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                                <div class="pull-right"><a href="#">View post</a></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->
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
                    <div class="row">
                        <div class="col-xs-4 ">
                            <asset:image src="personIcon.png"></asset:image>
                        </div>
                        <div class="col-xs-8">
                            <div>
                                <p style="font-size: 12px">Uday Pratap Singh  <span class="small text-center">@uday 21 Jul 2014 </span>           <a href="#" class="pull-right">Grails</a><br/>
                                    Lorem Ipsum Depsum sit amet, consectetur adipiscing elit, Nulla quam sfsf sdfs dfg  asfisoi ndsoufb sadfs ghgfhijb juseeih nishci sacromfj</p>
                            </div>
                            <div class="">
                                <a href="#"><i class="fa fa-facebook-official"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                                <div class="pull-right"><a href="#">View post</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--</div>
        <div class="row" >-->

        <div class="col-xs-5">

            <div class="panel panel-default">
                <div class="panel-heading">Login</div>
                <div class="panel-body">
                    <g:form class="form-horizontal" controller="login" action="loginHandler">
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5 ">
                                <label class=" control-label" for="Username">Email/Username *</label>
                            </div>
                            <div class="col-xs-7 ">
                                <input class="form-control" name="userName" type="text" id="Username" >
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5">
                                <label class="control-label" for="Password">Password *</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="password" type="password" id="Password" >
                            </div>
                        </div>
                        <div class="">
                            <a class="col-xs-5" href="#">Forget Password</a>
                            <button type="submit" class="pull-right col-xs-3">Login</button>
                        </div>
                    </g:form>

                </div>
            </div>

            <div class="panel panel-default ">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <g:uploadForm class="form-horizontal" controller="login" action="register">
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5">
                                <label class=" control-label"  for="fName">First Name *</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="firstName" type="text" id="fName">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5">
                                <label class="control-label" for="lName">Last Name *</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="lastName" type="text" id="lName">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5">
                                <label class="control-label" for="email">Email *</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="email" type="text" id="email">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5">
                                <label class="control-label" for="rUsername">Username *</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="userName" type="text" id="rUsername">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5">
                                <label class=" control-label" for="rPassword">Password *</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="password" type="password" id="rPassword">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5 ">
                                <label class="  control-label" for="cPassword">Confirm Password *</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="confirmPassword" type="password" id="cPassword">
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-5">
                                <label class="control-label" for="photo">Photo</label>
                            </div>
                            <div class="col-xs-7">
                                <input class="form-control" name="proflePicFile"  type="file" id="photo">
                            </div>
                        </div>
                        <div>
                            <button type="submit" name="Register" class="pull-right col-xs-4">Register</button>
                        </div>
                    </g:uploadForm>
                </div>
            </div>


            <!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->
        </div>
    </div>
    <!--</div>-->
</body>
</html>