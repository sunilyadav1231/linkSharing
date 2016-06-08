<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">

</head>
<body>
<div class="container">
    <!-- <div class="row">-->
    <div class="row">
        <div class="col-xs-5" >
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-4 ">
                            <asset:image  src="personIcon.png"></asset:image>
                        </div>
                        <div class="col-xs-8">
                            <div class="row">
                                <h4 class="col-xs-12">Uday Pratap Singh</h4>
                            </div>
                            <div class="row">
                                <small class="col-xs-12">@uday</small>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <small>Subscriptions</small>
                                </div>
                                <div class="col-xs-6">
                                    <small>Topics</small><br/>
                                </div>
                            </div>
                            <div class="row">
                                <span class="col-xs-6">60</span>
                                <span class="col-xs-6">60</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-7">Topics </div>
                        <div class="col-xs-5">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                <input type="text" class="form-control" placeholder="Search" name="q">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-4 ">
                                <asset:image  src="personIcon.png"></asset:image>
                            </div>
                            <div class="col-xs-8">
                                <div class="row">
                                    <input class="col-xs-7" type="text" placeholder="Grails"/>
                                    <button class="col-xs-5">Save</button>
                                </div>
                                <div class="row">
                                    <div class="col-xs-4">

                                        <div class="row">
                                             <small>@uday</small>
                                        </div>

                                    </div>
                                    <div class="col-xs-4">
                                        <div class="row">
                                            <small>Subscription</small>
                                        </div>
                                        <div class="row">
                                            50
                                        </div>

                                    </div>
                                    <div class="col-xs-4">
                                        <div class="row">
                                            <small>Topics</small>
                                        </div>
                                        <div class="row">
                                            30
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row pull-right">
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
            </div>
            <!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->
        </div>



        <div class="col-xs-7">
            <div class=" panel panel-default">
                <div class="panel-heading">Profile</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4 ">
                                <label class=" control-label" for="fName">First Name* :</label>
                            </div>
                            <div class="col-xs-8 ">
                                <input class="form-control" placeholder="" type="text" id="fName" >
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4 ">
                                <label class=" control-label" for="lName">Last Name* :</label>
                            </div>
                            <div class="col-xs-8 ">
                                <input class="form-control" placeholder="" type="text" id="lName" >
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4 ">
                                <label class=" control-label" for="eUsername">Username* :</label>
                            </div>
                            <div class="col-xs-8 ">
                                <input class="form-control" placeholder="" type="text" id="eUsername" >
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4">
                                <label class="control-label" for="photo">Photo</label>
                            </div>
                            <div class="col-xs-8">
                                <input class="" type="file" id="photo">
                            </div>
                        </div>
                        <div class="">
                            <button class="col-xs-3 pull-right">Update</button>
                        </div>
                    </form>

                </div>
            </div>

            <div class=" panel panel-default">
                <div class="panel-heading">Change Password</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4 ">
                                <label class=" control-label" for="Password">Password*</label>
                            </div>
                            <div class="col-xs-8 ">
                                <input class="form-control" type="text" id="Password" >
                            </div>
                        </div>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4 ">
                                <label class="control-label" for="cPassword">Confirm Password *</label>
                            </div>
                            <div class="col-xs-8 ">
                                <input class="form-control" type="password" id="cPassword" >
                            </div>
                        </div>
                        <div class="">
                            <button class="pull-right col-xs-3">Update</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </div>
    <!--</div>-->
</div>
</body>
</html>