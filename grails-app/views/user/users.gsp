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
                        <g:sortableColumn property="userName" title="Username" />
                        <g:sortableColumn property="email" title="Email" />
                        <g:sortableColumn property="firstName" title="First Name" />
                        <g:sortableColumn property="lastName" title="Last Name" />
                        <g:sortableColumn property="active" title="Status" />
                    </tr>
                    </thead>
                    <tbody>
                        <g:each in="${users}" var="user">
                            <g:if test="${user.active}">
                                <tr class="success">
                            </g:if>
                            <g:else>
                                <tr class="danger">
                            </g:else>
                            <td>${user.id}</td>
                            <td>${user.userName}</td>
                            <td>${user.email}</td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>
                                <g:if test="${user.active}">
                                    <input type="checkbox" identity="${user.id}" class="user_status" data-on="Active" data-off="Inactive" checked data-toggle="toggle" data-size="mini">
                                </g:if>
                                <g:else>
                                    <input type="checkbox" identity="${user.id}" class="user_status" data-on="Active" data-off="Inactive" data-toggle="toggle" data-size="mini"  >
                                </g:else>
                            </td>
                            </tr>
                        </g:each>

                    </tbody>
                </table>
            </div>
            <div class="box-footer clearfix">
                <ul class="pagination pagination-sm no-margin pull-right">
                    <li>
                        <g:paginate max="10" total="${userCount}"/>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>