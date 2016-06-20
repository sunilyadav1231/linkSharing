<div class="row">
    <div class="col-xs-12">
        <g:uploadForm class="form-horizontal" id="register-form" name="register-form" action="">
            <div class="form-group form-group-sm">
                <div class="col-xs-5">
                    <label class=" control-label"  for="firstName">First Name *</label>
                </div>
                <div class="col-xs-7">
                    <input class="form-control" maxlength="15" name="firstName" type="text" id="firstName">
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-5">
                    <label class="control-label" for="lastName">Last Name *</label>
                </div>
                <div class="col-xs-7">
                    <input class="form-control" maxlength="15" name="lastName" type="text" id="lastName">
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-5">
                    <label class="control-label" for="email">Email *</label>
                </div>
                <div class="col-xs-7">
                    <input class="form-control" maxlength="100" name="email" type="text" id="email">
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-5">
                    <label class="control-label" for="userName">Username *</label>
                </div>
                <div class="col-xs-7">
                    <input class="form-control" maxlength="15" name="userName" type="text" id="userName">
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-5">
                    <label class=" control-label" for="password">Password *</label>
                </div>
                <div class="col-xs-7">
                    <input class="form-control" maxlength="15" name="password" type="password" id="password">
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-5 ">
                    <label class="  control-label" for="confirmPassword">Confirm Password *</label>
                </div>
                <div class="col-xs-7">
                    <input class="form-control" maxlength="15" name="confirmPassword" type="password" id="confirmPassword">
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-5">
                    <label class="control-label" for="proflePicFile">Photo</label>
                </div>
                <div class="col-xs-7">
                    <input class="form-control" name="proflePicFile" type="file"  data-max-size="3m" type="image" id="proflePicFile">
                </div>
            </div>
            <div>
                <button type="submit" name="Register" class="pull-right col-xs-4">Register</button>
            </div>
        </g:uploadForm>
    </div>
</div>