<div class="modal fade" id="delete_resource" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <g:form controller="resource" action="deleteResource">
                <input type="hidden" id="deleteResourceId" name="id">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title text-center">Are you sure?</h4>
                </div>
                <div class="modal-body text-center">
                    <p>You really wants to delete the Resource?</p>
                    <p>It will delete link/file related to this topic</p>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="delete_topic_button" identity="" class="btn btn-default " >Delete</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </g:form>
        </div>

    </div>
</div>