
<div class="modal fade" id="share_document" role="dialog">
    <div class="modal-dialog">
        <g:uploadForm controller="resource" action="createFileResource"  class="form-horizontal">
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
                            <g:select name="topic" from="${subscribedTopics}" optionKey="id" optionValue="name"/>
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

%{--

<div class="panel panel-default ">
    <div class="panel-heading">Share Document</div>
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group form-group-sm">
                <div class="col-xs-4">
                    <label class="control-label" for="photo">Document* :</label>
                </div>
                <div class="col-xs-8">
                    <input class="" type="file" id="photo">
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-4 ">
                    <label class=" control-label" for="desc">Description* :</label>
                </div>
                <div class="col-xs-8">
                    <textarea class="form-control" placeholder="description" type="text" id="desc"></textarea>
                </div>
            </div>
            <div class="form-group form-group-sm">
                <div class="col-xs-4 ">
                    <label class="control-label" for="stopic">Topic* :</label>
                </div>
                <div id="stopic" class="col-xs-8">
                    <select class="form-control">
                        <option>Topic</option>
                        <option>Topic</option>
                        <option>Topic</option>
                    </select>
                </div>
            </div>


            <div class="">
                <button class="col-xs-3 pull-right">Cancel</button>
                <button class="col-xs-3 pull-right">Share</button>
            </div>
        </form>
    </div>
</div>--}%
