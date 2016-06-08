<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:stylesheet src="bootstrap.min.css"/>
		<asset:stylesheet src="bootstrap-theme.min.css"/>
		<asset:stylesheet src="font-awesome.min.css"/>
		<asset:javascript src="jquery.min.js"/>
		<asset:javascript src="bootstrap.min.js"/>
		%{--<asset:javascript src="application.js"/>--}%
		<g:layoutHead/>
	</head>
	<body class="container">


			<div class="row">
				<div  class=" panel panel-default">
					<div class="panel-body">
						<div class="col-xs-8">
							<h3><a href="#">Link Sharing</a></h3>
						</div>
						<div class="col-xs-4">
							<g:if test="${session.userData}">
								<g:render  template="/templates/create_topic"/>
								<g:render  template="/templates/share_link"/>
								<g:render  template="/templates/share_document"/>
								<g:render  template="/templates/send_invitation"/>
								<div class="row  pull-right ">
									<div class="col-xs-12 pull-right">


										<a href="#" title="Create Topic"  data-toggle="modal" data-target="#create_topic"><i class="fa fa-comment fa-lg"></i></a>
										<a title="Send Invitation" class="tab-space" data-toggle="modal" data-target="#send_invitation"  href="#"><i class="fa fa-envelope-o fa-lg"></i></a>
										<a href="#" title="Share Link" data-toggle="modal" data-target="#share_link" class="tab-space"><i class="fa fa-link fa-lg"></i></a>
										<a href="#" title="Share Document" data-toggle="modal" data-target="#share_document" class="tab-space"><i class="fa fa-file-o fa-lg"></i></a>

										<span class="tab-space"></span>
										<span class="tab-space">
											<asset:image src="personIcon.png" height="8%" width="8%"></asset:image>
											<span>${session.userData.fullName}</span>
											<g:link controller="login" action="logout" class="tab-space" href="#"><i class="fa fa-sign-out fa-lg"></i></g:link>

										</span>
									</div>
								</div>
								<div class=" row padd-bottom"></div>
							</g:if>
							<div class="row">
								<div class="col-xs-12 pull-right">
									<div class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
										<input type="text" class="form-control" placeholder="Search" name="q">

									</div>
								</div>
							</div>

						</div>


						%{--<div class="col-xs-6">
							<div class="row">
								<div class="col-xs-4 ">
									<div class="input-group">
										<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
										<input type="text" class="form-control" placeholder="Search" name="q">

									</div>
								</div>
								<div class="col-xs-8">
									<div class="row">
										<div class="col-xs-6">
											<a  href="#"><i class="fa fa-envelope-o fa-lg"></i></a>
											<a class="tab-space" href="#"><i class="fa fa-comment fa-lg"></i></a>
											<a class="tab-space" href="#"><i class="fa fa-link fa-lg"></i></a>
											<a class="tab-space" href="#"><i class="fa fa-file-o fa-lg"></i></a>
										</div>
										<div class="col-xs-6">

											<asset:image src="personIcon.png" height="20%" width="20%"></asset:image>
											<span>Udday</span>
											<div class="btn-group">
												<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">

													<span class="caret"></span>
												</a>
												<ul class="dropdown-menu">
													--}%%{--<li>Hello</li>--}%%{--
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>--}%


					</div>
				</div>
			</div>
			<g:layoutBody/>
			<div class="row" id="footer">

			</div>

	</body>
</html>
