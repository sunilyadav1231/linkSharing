<div class="modal fade" id="update_topic_${topic.id}" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <g:form controller="topic" action="updateTopic">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Update Topic</h4>
                </div>
                <div class="modal-body text-center">
                    <input type="hidden" name="id" value="${topic.id}"/>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class=" control-label" for="name">Name* :</label>
                        </div>
                        <div class="col-xs-8">
                            <input class="form-control" value="${topic.name}" name="name" placeholder="Name" type="text" id="name"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="delete_topic_button" identity="" class="btn btn-default " >Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </g:form>
        </div>

    </div>
</div>