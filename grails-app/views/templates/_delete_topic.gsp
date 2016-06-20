<div class="modal fade" id="delete_topic" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
        <g:form  action="" id="deleteTopic" name="deleteTopic" >
            <input type="hidden" id="deleteTopicId" name="id">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-center">Are you sure?</h4>
            </div>
            <div class="modal-body text-center">
                <p>You really wants to delete the topic?</p>
                <p>It will delete all the posts related to this topic</p>
            </div>
            <div class="modal-footer">
                <button type="submit" id="delete_topic_button" identity="" class="btn btn-default " >Delete</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </g:form>
        </div>

    </div>
</div>