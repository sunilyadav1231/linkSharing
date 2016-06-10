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
                            <label class=" control-label" for="email">Email* :</label>
                        </div>
                        <div class="col-xs-8">
                            <textarea class="form-control" placeholder="Email" type="text" id="email"></textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="invite">Topic* :</label>
                        </div>
                        <div id="invite" class="col-xs-8">
                            <g:select name="topic" from="${subscribedTopics}" optionKey="id" optionValue="name"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Invite</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </form>
    </div>
</div>

%{--

<div class="panel panel-default ">
    <div class="panel-heading">Send invitation(Pop up)</div>
    <div class="panel-body">
        <form class="form-horizontal">

            <div class="form-group form-group-sm">
                <div class="col-xs-4 ">
                    <label class=" control-label" for="email">Email* :</label>
                </div>
                <div class="col-xs-8">
                    <textarea class="form-control" placeholder="Email" type="text" id="email"></textarea>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-4 ">
                    <label class="control-label" for="invite">Topic* :</label>
                </div>
                <div id="invite" class="col-xs-8">
                    <select class="form-control">
                        <option>Topic</option>
                        <option>Topic</option>
                        <option>Topic</option>
                    </select>
                </div>
            </div>


            <div class="">
                <button class="col-xs-3 pull-right">Cancel</button>
                <button class="col-xs-3 pull-right">Invite</button>
            </div>
        </form>
    </div>
</div>
<!--<div class="col-lg-5 col-md-5 col-xs-5 col-sm-5">dd</div>-->
--}%
