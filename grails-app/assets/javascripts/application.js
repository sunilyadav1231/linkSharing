// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require_self

$(document).ready(function() {
	$("time.timeago").timeago();

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
});

