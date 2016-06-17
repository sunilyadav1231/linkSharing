
<div class="modal fade" id="update_profile" role="dialog " aria-hidden="true">
     <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="panel panel-default">
                    <div class="panel-heading">Update Profile</div>
                    <div class="panel-body">
                        <g:uploadForm class="form-horizontal" controller="user" action="updateProfile">
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class=" control-label"  for="fName">First Name *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" value="${session.userData.firstName}" name="firstName" type="text" id="fName">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class="control-label" for="lName">Last Name *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" value="${session.userData.lastName}" name="lastName" type="text" id="lName">
                                </div>
                            </div>
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class="control-label" for="username">Username *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" value="${session.userData.id}" name="id" type="hidden" >
                                    <input class="form-control" value="${session.userData.userName}" name="userName" type="text" id="username">
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
                                <button type="submit" name="Register" class="pull-right col-xs-4">Update</button>
                            </div>
                        </g:uploadForm>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">Update Password</div>
                    <div class="panel-body">
                        <g:uploadForm class="form-horizontal" controller="user" action="changePassword">
                            <div class="form-group form-group-sm">
                                <div class="col-xs-5">
                                    <label class=" control-label" for="cPassword">Current Password *</label>
                                </div>
                                <div class="col-xs-7">
                                    <input class="form-control" name="currentPassword" type="password" id="cPassword">
                                </div>
                            </div>
                                <div class="form-group form-group-sm">
                                    <div class="col-xs-5">
                                        <label class=" control-label" for="nPassword">New Password *</label>
                                    </div>
                                    <div class="col-xs-7">
                                        <input class="form-control" value="${session.userData.id}" name="id" type="hidden" >
                                        <input class="form-control" name="newPassword" type="password" id="nPassword">
                                    </div>
                                </div>
                                <div class="form-group form-group-sm">
                                    <div class="col-xs-5 ">
                                        <label class="  control-label" for="cnPassword">Confirm New Password *</label>
                                    </div>
                                    <div class="col-xs-7">
                                        <input class="form-control" name="confirmPassword" type="password" id="cnPassword">
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

