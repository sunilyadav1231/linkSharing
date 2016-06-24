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
		<asset:stylesheet src="bootstrap-toggle.min.css"/>

		<asset:stylesheet src="font-awesome.min.css"/>
		<asset:javascript src="jquery.min.js"/>
		<asset:javascript src="bootstrap.min.js"/>
		<asset:javascript src="bootstrap-toggle.min.js"/>
		<asset:javascript src="jquery.validate.js"/>
		<asset:javascript src="jquery.validate.additional-methods.min.js"/>
		<asset:javascript src="register-validation.js"/>

		<asset:javascript src="jquery.timeago.js"/>
		<asset:javascript src="star-rating.js"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	<script>
		var signUrl = "${g.createLink(controller:'login',action:'loginHandler')}"
		var homeUrl = "${g.createLink(controller:'user',action:'dashboard')}"
		var registerUrl = "${g.createLink(controller:'login',action:'register')}"
		var validateUserNameUrl = "${g.createLink(controller:'login',action:'validateUserName')}"
		var validateEmailUrl= "${g.createLink(controller:'login',action:'validateEmail')}"
		var saveTopicUrl = "${g.createLink(controller:'topic',action:'save')}"
		var changeVisiblityUrl = "${g.createLink(controller:'topic',action:'changeVisiblity')}"
		var deleteTopicUrl = "${g.createLink(controller:'topic',action:'deleteTopic')}"
		var updateTopicUrl = "${g.createLink(controller:'topic',action:'updateTopic')}"
		var subscribeUrl = "${g.createLink(controller:'subscription',action:'subscribe')}"
		var unsubscribeUrl = "${g.createLink(controller:'subscription',action:'unSubscribe')}"
		var changeSeriousnessUrl = "${g.createLink(controller:'subscription',action:'changeSeriousness')}"
		var createLinkResourceURL= "${g.createLink(controller:'resource',action:'createLinkResource')}"
		var createDocumentResourceURL= "${g.createLink(controller:'resource',action:'createFileResource')}"
		var updateResourceUrl= "${g.createLink(controller:'resource',action:'updateResource')}"
		var deleteResourceUrl= "${g.createLink(controller:'resource',action:'deleteResource')}"
		var sendInvitationUrl ="${g.createLink(controller:'user',action:'sendInvitation')}"
		var changeUserStatusUrl="${g.createLink(controller:'user',action:'changeUserStatus')}"
		var updateUserProfileUrl="${g.createLink(controller:'user',action:'updateProfile')}"
		var changePasswordUrl="${g.createLink(controller:'login',action:'changePassword')}"
		var rateResourceUrl="${g.createLink(controller:'resourceOperation',action:'rateResource')}"
		var forgetPasswordUrl="${g.createLink(controller:'login',action:'forgetPassword')}"
		var markResourceReadUrl="${g.createLink(controller:'resourceOperation',action:'markRead')}"
		var inboxSearchUrl="${g.createLink(controller:'user',action:'inboxSearch')}"
		var userTopicSearchUrl="${g.createLink(controller:'user',action:'userTopicSearch')}"

		var errorMsg = "Cannot process your request at this moment. Please try again later"
		var success =1
		var failure = 0
		$(document).ready(function(){


			<g:if test="${session.userData}">
			$(".resource-rating").rating('create',{coloron:'green',limit:5,glyph:'glyphicon-heart'});
			$(".resource-rating").addClass('clickable');
			</g:if>
			<g:else>
			$(".resource-rating").rating('show',{coloron:'green',limit:5,glyph:'glyphicon-heart'});
			</g:else>

			$(".clickable").click(function(){
				var rating = $(this).rating('get');
				var id = $(this).attr('identity');
				$.ajax({
					url:rateResourceUrl,
					dataType: 'json',
					type : 'POST',
					data: {
						'resourceId':id,
						'resourceScore':$(this).rating('get')
					},
					success: function(respMap) {
						$("#resp_model").modal();
						$("#resp_message").text(respMap.respData.respMessageCode)
					},
					error: function(request, status, error) {
						$("#resp_model").modal();
						$("#resp_message").text(errorMsg)
					}
				});
			});

			$('#mainSearchClick').click(function(){
				var search = $('#mainSearch').val()
				if(search==""){
					$("#resp_model").modal();
					$("#resp_message").text("Please enter text to search")
				}else{
					$('#searchKey').val(search);
					$( "#mainSearchForm" ).submit();
				}
			});

		});



	</script>
	</head>
	<body class="container layout">


			<div class="row header">
				<div class="panel">
					<div class="panel-body header">
						<div class="col-xs-8">
							<div class="row">
								<div class="col-xs-4">
									<g:link controller="login" action="index" >
										<asset:image height="50%" width="50%"  src="logo_2099511_web.png"/>
									</g:link>
								</div>
								<div class="col-xs-8 heading">
									<h1>Link Sharing</h1>
									<h4 class="pull-right">share your views...</h4>
								</div>
							</div>

						</div>
						<div class="col-xs-4">
							<g:render  template="/templates/forget_password"/>
							<g:if test="${session.userData}">
								<g:render  template="/templates/create_topic"/>
								<g:render  template="/templates/share_link"/>
								<g:render  template="/templates/share_document"/>
								<g:render  template="/templates/send_invitation"/>
								<g:render template="/templates/update_profile"/>
								<g:render template="/templates/delete_topic"/>
								<g:render template="/templates/delete_resource"/>
								<div class="row  pull-right ">
									<div class="col-xs-12 pull-right">
										<a href="#" title="Create Topic"  data-toggle="modal" data-target="#create_topic"><i class="fa fa-comment "></i></a>
										<g:if test="${session.userData.subscriptions}">
											<a title="Send Invitation" class="tab-space invitation_modal" data-toggle="modal" data-target="#send_invitation"  href="#"><i class="fa fa-envelope-o "></i></a>
											<a href="#" title="Share Link" data-toggle="modal" data-target="#share_link" class="tab-space"><i class="fa fa-link "></i></a>
											<a href="#" title="Share Document" data-toggle="modal" data-target="#share_document" class="tab-space"><i class="fa fa-file-o "></i></a>
										</g:if>

										%{--<span class="tab-space"></span>--}%
										<span class="tab-space">
											<g:link controller="login" action="fetchUserDetail" params= "['userName':session.userData.userName]">
												<g:if test="${session.userData.photoPath}">
													<img  height="7%" width="7% "  src="${createLink(controller:'login', action:'showImage',params: [path: "${session.userData.photoPath}"] )}" />
												</g:if>
												<g:else>
													<asset:image height="8%" width="8% "  src="personIcon.png"></asset:image>
												</g:else>

												<span>${session.userData.fullName}</span>
											</g:link>
											<g:if test="${session.userData.admin}">
												<g:link controller="user" action="users" class="tab-space" ><i class="fa fa-users"></i></g:link>

											</g:if>
											<g:link controller="login" action="logout" class="tab-space" ><i class="fa fa-sign-out "></i></g:link>

										</span>
									</div>
								</div>
								<div class=" row padd-bottom"></div>
							</g:if>
							<div class="row">
								<div class="col-xs-12 pull-right">
									<div class="input-group">
										<g:form controller="login" action="mainSearch" id="mainSearchForm" name="mainSearchForm">
											<input type="hidden" id="searchKey" name="searchKey"/>
										</g:form>
										<input id="mainSearch" type="text" class="form-control" placeholder="Search" name="q">
										<span class="input-group-addon">
											<a href="#" id="mainSearchClick" name="mainSearchClick">
												<i class="glyphicon glyphicon-search"></i>
											</a>
										</span>

									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
			<g:layoutBody/>
			<div class="row" id="footer">

			</div>








	<div class="modal fade" id="resp_model" role="alert">
		<div class="modal-dialog">
			<form>
			<!-- Modal content-->
			<div class="modal-content alert alert-info text-center">
				<div class="modal-header">
					<button type="button" class="close refresh" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						Message
					</h4>

				</div>
				<div class="model-body">

					<h5 id="resp_message"></h5>
					<button type="submit" class="btn btn-default refresh" data-dismiss="modal">Ok</button>
				</div>

				%{--<div class="modal-footer">

				</div>--}%
			</div>
			</form>

		</div>
	</div>

	<div class="modal fade" id="resp_model_home" role="alert">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close goTohome" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="resp_message_home"></h4>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default goTohome" data-dismiss="modal">Ok</button>
				</div>
			</div>

		</div>
	</div>
	</body>
</html>
