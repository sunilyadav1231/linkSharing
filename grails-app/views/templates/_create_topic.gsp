
<div class="modal fade" id="create_topic" role="dialog " aria-hidden="true">
     <div class="modal-dialog">
        <g:form  controller="topic" action="save" class="form-horizontal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Create Topic</h4>
            </div>


            <div class="modal-body">

                <div class="form-group form-group-sm">
                    <div class="col-xs-4 ">
                        <label class=" control-label" for="name">Name* :</label>
                    </div>
                    <div class="col-xs-8">
                        <input class="form-control" name="name" placeholder="Name" type="text" id="name"/>
                    </div>
                </div>
                <div class="form-group form-group-sm">
                    <div class="col-xs-4 ">
                        <label class="control-label" for="visibility">Visibility* :</label>
                    </div>
                    <div id="visibility"  class="col-xs-8">
                        <g:select from="${['PUBLIC','PRIVATE']}" name="visibility" value="visibility">
                        </g:select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-default">Save</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        </g:form>
    </div>

</div>
