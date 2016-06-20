
<div class="modal fade" id="share_document" role="dialog">
    <div class="modal-dialog">
        <g:uploadForm action="" id="createFileResource_form" name="createFileResource_form"  class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Document</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4">
                            <label class="control-label" for="photo">Document* :</label>
                        </div>
                        <div class="col-xs-8">
                            <input class="" name="docFile" type="file" id="photo">
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="Password">Description* :</label>
                        </div>
                        <div class="col-xs-8 ">
                            <textarea class="form-control" name="description" placeholder="description" type="" id="Password" ></textarea>
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
        </g:uploadForm>
    </div>
</div>

