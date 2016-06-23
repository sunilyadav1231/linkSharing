<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">

</head>
<body>

<div class="row"   >
    <div class="col-xs-12" >
        <g:if test="${respData.respCode==com.ttnd.ls.constants.LSConstants.FAILURE_CODE}">
            <div class="panel panel-default">
                <div class="panel-heading">Change Password</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            ${respData.respMessageCode}
                        </div>
                    </div>
                </div>
            </div>
        </g:if>
        <g:else>
            <div class="panel panel-default">
                <div class="panel-heading">Change Password</div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <g:uploadForm class="form-horizontal" action="" name="forget_password_change_password_form" id="forget_password_change_password_form">
                                <div class="form-group form-group-sm">
                                    <div class="col-xs-5">
                                        <label class=" control-label" for="newPassword">New Password *</label>
                                    </div>
                                    <div class="col-xs-7">
                                        <input class="form-control" value="${userName}" name="userName" id="ChangePassUserName" type="hidden" >
                                        <input class="form-control" name="newPassword" type="password" id="newPassword">
                                    </div>
                                </div>
                                <div class="form-group form-group-sm">
                                    <div class="col-xs-5 ">
                                        <label class="  control-label" for="confirmPassword">Confirm New Password *</label>
                                    </div>
                                    <div class="col-xs-7">
                                        <input class="form-control" name="confirmPassword" type="password" id="confirmPassword">
                                    </div>
                                </div>
                                <div>
                                    <button type="submit" name="Register" class="pull-right col-xs-4">Update</button>
                                </div>
                            </g:uploadForm>
                        </div>
                    </div>
                </div>
            </div>
        </g:else>

    </div>

</div>

</body>
</html>