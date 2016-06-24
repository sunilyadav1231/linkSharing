<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main">
</head>
<body>
<div class="row"   >
    <div class="col-xs-12" >
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <g:sortableColumn property="id" title="#" />
                    <g:sortableColumn property="name" title="Topic Name" />
                    <g:sortableColumn property="createdBy.userName" title="Created By" />
                    <th>Subscriptions</th>
                    <th>Resources</th>
                    <g:sortableColumn property="visibility" title="Visibility" />
                </tr>
                </thead>
                <tbody>
                <g:each in="${topics}" var="topic">
                %{-- <g:if test="${user.active}">
                     <tr class="success">
                 </g:if>
                 <g:else>
                     <tr class="danger">
                 </g:else>--}%
                    <tr class="success">
                        <td>
                            <g:link controller="login" action="showTopic" params= "['topic.id': topic.id]">
                                ${topic.id}
                            </g:link></td>
                        <td>${topic?.name}</td>
                        <td>${topic?.createdBy.userName}</td>
                        <td>${topic.subscriptions.size()}</td>
                        <td>${topic.resources.size()}</td>
                        <td>${topic.visibility}</td>
                    </tr>
                </g:each>

                </tbody>
            </table>
        </div>
        <div class="box-footer clearfix">
            <ul class="pagination pagination-sm no-margin pull-right">
                <li>
                    <g:paginate max="20" total="${topicCount}"/>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>