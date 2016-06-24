
<div class="modal fade" id="update_post_${resource.id}" role="dialog">
    <div class="modal-dialog">
        <g:uploadForm controller="resource" action="updateResource" id="updateResource_form" name="updateResource_form"  class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update Post</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="update_description">Description* :</label>
                        </div>
                        <div class="col-xs-8 ">
                            <textarea class="form-control" name="description" placeholder="description" type="" id="update_description" >${resource.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="topic">Topic* :</label>
                        </div>
                        <div id="topic" class="col-xs-8 ">
                            <input type="hidden" name="resource_id" id="resource_id" value="${resource.id}">
                            <span ><b>${resource.topic.name}</b></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </g:uploadForm>
    </div>
</div>
