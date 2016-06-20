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

		<asset:javascript src="jquery.timeago.js"/>
		<asset:javascript src="star-rating.js"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	<script>
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
					url:"${g.createLink(controller:'resourceOperation',action:'rateResource')}",
					dataType: 'json',
					type : 'POST',
					data: {
						'resourceId':id,
						'resourceScore':$(this).rating('get')
					},
					success: function(data) {
						$("#alert_model").modal();
						$("#res_avg_count_"+id).rating('set',data.averageRating);
						$("#res_user_count_"+id).text(data.ratingUserCount)

					},
					error: function(request, status, error) {
						$(this).rating('set',rating)
					}
				});
			});

			$(".user_status").change(function(){
				var userStatus = false;
				if($(this). prop("checked") == true){
					userStatus = true
				}else{
					userStatus = false
				}
				$.ajax({
					url:"${g.createLink(controller:'user',action:'changeUserStatus')}",
					dataType: 'json',
					type : 'POST',
					data: {
						'id':$(this).attr('identity'),
						'status':userStatus
					},
					success: function(data) {
						//$(".visible_"+data.id).val(data.visibility);
						$("#user_alert_model").modal();
					},
					error: function(request, status, error) {

					}
				});
			});


				$(".topic_visibility").change(function(){
					var topicVisibility = "";
					if($(this). prop("checked") == true){
						topicVisibility = "PUBLIC"
					}else{
						topicVisibility = "PRIVATE"
					}
					$.ajax({
					 url:"${g.createLink(controller:'topic',action:'changeVisiblity')}",
					 dataType: 'json',
					 type : 'POST',
					 data: {
					 'topicId':$(this).attr('identity'),
					 'topicVisibility':topicVisibility
					 },
					 success: function(data) {
					 //$(".visible_"+data.id).val(data.visibility);
					 $("#visiblity_alert_model").modal();
					 },
					 error: function(request, status, error) {

					 }
					 });
				});

				$(".topic_seriousness").change(function(){
					$.ajax({
						url:"${g.createLink(controller:'subscription',action:'changeSeriousness')}",
						dataType: 'json',
						type : 'POST',
						data: {
							'subscriptionId':$(this).attr('identity'),
							'topicSeriousness':$(this).val()
						},
						success: function(data) {
							$("#seriousness_alert_model").modal();
						},
						error: function(request, status, error) {

						}
					});
				});

				$("#sendInvitation").click(function(){
					$.ajax({
						url:"${g.createLink(controller:'user',action:'sendInvitation')}",
						dataType: 'json',
						type : 'POST',
						data: {
							'topicId':$(".topicToInvite").val(),
							'sentTo':$("#sentTo").val()
						},
						success: function(data) {
							$('#send_invitation').modal('toggle');
							$("#send_invitation_model").modal();
						},
						error: function(request, status, error) {

						}
					});
				});

				$(".invitation_modal").click(function(){
					$('.topicToInvite').prop('disabled', false);
					var ident = $(this).attr('identity');
					if(ident){
						$(".topicToInvite").val(ident);
						$('.topicToInvite').prop('disabled', true);
					}

				});

				$(".delete_topic").click(function(){
					var ident = $(this).attr('identity');
						$("#deleteTopicId").val(ident)
						$("#delete_topic").modal();

				});

				$(".delete_resource").click(function(){
					var ident = $(this).attr('identity');
					$("#deleteResourceId").val(ident)
					$("#delete_resource").modal();

				});

			$(".refresh").click(function(){
				window.location.reload(true);

			});
		});



	</script>
	</head>
	<body class="container layout">


			<div class="row header">
				<div  class=" panel panel-default">
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
										<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
										<input type="text" class="form-control" placeholder="Search" name="q">

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


	<div class="modal fade" id="send_invitation_model" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-center">Invitation Sent</h4>
				</div>
				<div class="modal-body text-center">
					<p>Invitation sent successfully</p>
				</div>
				<div class="modal-footer text-center">
					<center><button type="submit" class="btn btn-default" data-dismiss="modal">Ok</button></center>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="visiblity_alert_model" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-center">Visibility Changed Successfully</h4>
				</div>

				<div class="modal-footer">
					<center><button type="submit" class="btn btn-default" data-dismiss="modal">Ok</button></center>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="seriousness_alert_model" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-center">Seriousness changed successfully!!</h4>
				</div>
				<div class="modal-footer text-center">
					<center><button type="submit" class="btn btn-default" data-dismiss="modal">Ok</button></center>
				</div>
			</div>

		</div>
	</div>


	<div class="modal fade" id="alert_model" role="alert">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Post Rated Successfully</h4>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default" data-dismiss="modal">Ok</button>
				</div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="user_alert_model" role="alert">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">User status changed succesfully</h4>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default refresh" data-dismiss="modal">Ok</button>
				</div>
			</div>

		</div>
	</div>
	</body>
</html>
