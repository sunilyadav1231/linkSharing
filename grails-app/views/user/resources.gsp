<%@ page import="com.ttnd.ls.entity.Resource" %>
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
                    <g:sortableColumn property="topic.name" title="Topic of Resource" />
                    <g:sortableColumn property="createdBy.userName" title="Posted By" />
                    <g:sortableColumn property="averageRating" title="Avg. Rating" />
                    <th>Access</th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${resources}" var="resource">
                   %{-- <g:if test="${user.active}">
                        <tr class="success">
                    </g:if>
                    <g:else>
                        <tr class="danger">
                    </g:else>--}%
                    <tr class="success">
                        <td>
                            <g:link class="small" controller="login" action="showPost" params= "['resource.id': resource.id]">
                                ${resource.id}
                            </g:link></td>
                        <td>${resource?.topic?.name}</td>
                        <td>${resource?.createdBy.userName}</td>
                        <td>${resource.averageRating}</td>
                        <td>
                            <g:if test="${resource instanceof com.ttnd.ls.entity.FileResource}">
                                <span class="tab-space"><g:link controller="login" action="downloadResource" params='[path: "${resource.fileDocument}"]'><small>Download</small></g:link></span>
                            </g:if>
                            <g:if test="${resource instanceof com.ttnd.ls.entity.LinkResource}">
                                <span class="tab-space"><a target="_blank" href="${resource.urlDocument}"><small>View full site</small></a></span>
                            </g:if>
                        </td>
                    </tr>
                </g:each>

                </tbody>
            </table>
        </div>
        <div class="box-footer clearfix">
            <ul class="pagination pagination-sm no-margin pull-right">
                <li>
                    <g:paginate max="10" total="${resourceCount}"/>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>