<div class="row">
    <div class="col-xs-12">
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