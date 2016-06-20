
<div class="modal fade" id="update_post_${resource.id}" role="dialog">
    <div class="modal-dialog">
        <g:uploadForm controller="resource" action="updateResource"  class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update Post</h4>
                </div>
                <div class="modal-body">

                    <g:if test="${resource instanceof com.ttnd.ls.entity.LinkResource}">
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4 ">
                                <label class=" control-label" for="documentUrl">Link* :</label>
                            </div>
                            <div class="col-xs-8 ">
                                    <input class="form-control" value="${resource?.urlDocument}" name="urlDocument" placeholder="link" type="text" id="documentUrl" >
                            </div>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="form-group form-group-sm">
                            <div class="col-xs-4">
                                <label class="control-label" for="doc">Document* :</label>
                            </div>
                            <div class="col-xs-8">
                                <input class="" name="docFile" type="file" id="doc">
                            </div>
                        </div>
                    </g:else>

                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="Password">Description* :</label>
                        </div>
                        <div class="col-xs-8 ">
                            <textarea class="form-control" name="description" placeholder="description" type="" id="Password" >${resource.description}</textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="topic">Topic* :</label>
                        </div>
                        <div id="topic" class="col-xs-8 ">
                            <input type="hidden" name="id" value="${resource.id}">
                            <span >${resource.topic.name}</span>
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
