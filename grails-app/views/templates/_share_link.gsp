
<div class="modal fade" id="share_link" role="dialog">
    <div class="modal-dialog">
        <form class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Share Link</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class=" control-label" for="Username">Link* :</label>
                        </div>
                        <div class="col-xs-8 ">
                            <input class="form-control" placeholder="link" type="text" id="Username" >
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="Password">Description* :</label>
                        </div>
                        <div class="col-xs-8 ">
                            <textarea class="form-control" placeholder="description" type="" id="Password" ></textarea>
                        </div>
                    </div>
                    <div class="form-group form-group-sm">
                        <div class="col-xs-4 ">
                            <label class="control-label" for="topic">Topic* :</label>
                        </div>
                        <div id="topic" class="col-xs-8 ">
                            <g:select name="topic.id" from="${subscribedTopics?.name}"/>

                            %{--<select class="form-control">
                                <option>Topic</option>
                                <option>Topic</option>
                                <option>Topic</option>
                            </select>--}%
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-default">Share</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </form>
    </div>
</div>



%{--



<div class=" panel panel-default">
    <div class="panel-heading">Share Link (Pop up)</div>
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group form-group-sm">
                <div class="col-xs-4 ">
                    <label class=" control-label" for="Username">Link* :</label>
                </div>
                <div class="col-xs-8 ">
                    <input class="form-control" placeholder="link" type="text" id="Username" >
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-4 ">
                    <label class="control-label" for="Password">Description* :</label>
                </div>
                <div class="col-xs-8 ">
                    <textarea class="form-control" placeholder="description" type="" id="Password" ></textarea>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-4 ">
                    <label class="control-label" for="topic">Topic* :</label>
                </div>

            </div>
            <div class="">
                <button class="col-xs-3 pull-right">Cancel</button>
                <button class="col-xs-3 pull-right">Share</button>
            </div>
        </form>

    </div>
</div>--}%
