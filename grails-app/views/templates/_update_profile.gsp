
<div class="modal fade" id="update_profile" role="dialog " aria-hidden="true">
     <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="panel ">
                    <div class="panel-heading">Update Profile</div>
                    <div class="panel-body">
                        <g:uploadForm class="form-horizontal" name="update-profile-form" id="update-profile-form" action="">
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class=" control-label"  for="firstName">First Name *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" value="${session.userData.firstName}" name="firstName" type="text" id="firstName">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class="control-label" for="lastName">Last Name *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" value="${session.userData.lastName}" name="lastName" type="text" id="lastName">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class="control-label" for="userName">Username *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" value="${session.userData.id}" name="id" type="hidden" >
                                    <input class="form-control" value="${session.userData.userName}" name="userName" type="text" id="userName">
                                </div>
                            </div>

                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class="control-label" for="proflePicFile">Photo</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" name="proflePicFile"  type="file" id="proflePicFile">
                                </div>
                            </div>
                            <div>
                                <button type="submit" name="register" class="pull-right col-xs-4">Update</button>
                            </div>
                        </g:uploadForm>
                    </div>
                </div>

                <div class="panel">
                    <div class="panel-heading">Update Password</div>
                    <div class="panel-body">
                        <g:uploadForm class="form-horizontal" action="" name="change_password_form" id="change_password_form">
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class=" control-label" for="currentPassword">Current Password *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" name="currentPassword" type="password" id="currentPassword">
                                </div>
                            </div>
                                <div class="form-group form-group-sm">
                                    <div class="col-xs-5">
                                        <label class=" control-label" for="newPassword">New Password *</label>
                                    </div>
                                    <div class="col-xs-7">
                                        <input class="form-control" value="${session.userData.userName}" name="userName" id="ChangePassUserName" type="hidden" >
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
    </div>
</div>

