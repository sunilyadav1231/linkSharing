<%--
  Created by IntelliJ IDEA.
  User: ttnd
  Date: 14/6/16
  Time: 5:03 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>

<body class="container">
<div class="row">
    <div class="col-xs-12">
        Hi ${fullName},
        Thank you for connecting with link sharing.
        Kindly click on the below link to activate your account.


        <a href="${verifyLink}" type="button" id="sendInvitation" class="btn btn-default">Invite</a>
    </div>

</div>

</body>
</html>