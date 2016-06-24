
<div class="modal fade" id="share_link" role="dialog">
    <div class="modal-dialog">
        <g:form  action="" name="createLinkResource_form" class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Link</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class=" control-label" for="urlDocument">Link* :</label>
                        </div>
                        <div class="col-xs-8 ">
                            <input class="form-control" name="urlDocument" placeholder="link" type="text" id="urlDocument" >
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="description">Description* :</label>
                        </div>
                        <div class="col-xs-8 ">
                            <textarea class="form-control" name="description" placeholder="description"  id="description" ></textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="topic">Topic* :</label>
                        </div>
                        <div id="topic" class="col-xs-8 ">
                            <g:select name="topic" from="${session.userData.subscriptions*.topic}" optionKey="id" optionValue="name"/>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Share</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </g:form>
    </div>
</div>
