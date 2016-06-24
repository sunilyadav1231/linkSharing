<!DOCTYPE html>
<html lang="en">
<head>
        <meta name="layout" content="main">
</head>
<body>

    <div class="row"   >


        <div class="col-xs-7" >

            <div class="panel">
                    <div class="panel-heading">Resource(s)</div>
                    <div class="panel-body">
                        <g:if test="${resources}">
                            <g:render template="/templates/resource_brief" collection="${resources}" var="resource"/>
                        </g:if>
                        <g:else>
                            No result found
                        </g:else>
                    </div>
                </div>

        </div>

    </div>

</body>
</html>