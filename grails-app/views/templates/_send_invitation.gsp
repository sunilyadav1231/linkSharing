<div class="modal fade" id="send_invitation" role="dialog">
    <div class="modal-dialog">
        <form class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Send invitation</h4>
                </div>
                <div class="modal-body">

                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class=" control-label" for="sentTo">Email* :</label>
                        </div>
                        <div class="col-xs-8">
                            <textarea class="form-control" placeholder="Email" type="text" id="sentTo"></textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="invite">Topic* :</label>
                        </div>
                        <div id="invite" class="col-xs-8">
                            <g:select class="topicToInvite" name="topic" from="${session.userData.subscriptions*.topic}" optionKey="id" optionValue="name"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="sendInvitation"  class="btn btn-default">Invite</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </form>
    </div>
</div>
