$().ready(function(){

    // Setup form validation on the #register-form element
    $("#login-form").validate({
        rules: {
            loginUsername: {
                required: true,
                minlength: 8,
                maxlength:50
            },
            loginPassword: {
                required: true,
                minlength: 8,
                maxlength: 15
            }
        },
        messages: {
            loginUsername: {required:"Please enter username name",
                minlength: "Username should contain atleast 8 characters",
                maxlength:"Username should contain at most 50 characters"},
            loginPassword: {
                required: "This field is required",
                minlength: "Your password must be at least 5 characters long",
                maxlength:"Your password should contain at most 15 characters"}
            },
        submitHandler: function(form) {
            $.ajax({
                url:signUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'userName':$("#loginUsername").val(),
                    'password':$("#loginPassword").val()
                },
                success: function(respMap) {
                    if(respMap.respData.respCode==1){
                        window.open(homeUrl,"_self");
                    }else{
                        $("#resp_model").modal();
                        $("#resp_message").text(respMap.respData.respMessageCode)
                    }
                },
                error: function(request, status, error) {
                    $("#resp_model").modal();
                    $("#resp_message").text(errorMsg)
                }
            });
        }
    });

    // Setup form validation on the #register-form element
    $("#register-form").validate({
        rules: {
            firstName: {
                required: true,
                maxlength: 15
            },
            lastName: {
                required: true,
                maxlength: 15
            },
            email: {
                required: true,
                email: true,
                remote: {
                    url: validateEmailUrl,
                    type: "post",
                    data: {
                        email: function() {
                            return $( "#email" ).val();
                        }
                    }
                }
            },
            userName: {
                required: true,
                minlength: 8,
                maxlength:15,
                remote: {
                    url: validateUserNameUrl,
                    type: "post",
                    data: {
                        username: function() {
                            return $( "#userName" ).val();
                        }
                    }
                }
            },
            password: {
                required: true,
                minlength: 8,
                maxlength: 15
            },
            confirmPassword: {
                required: true,
                equalTo:"#password"
            }
        },
        messages: {
            firsName: {required:"Please enter first name",
                maxlength:"First name cannot be more then 15 characters"},
            lastName: {required:"Please enter last name",
                maxlength:"Last name cannot be more then 15 characters"},
            email: {required:"Please enter email",
                remote:"Email Id already registered"},
            userName: {required:"Please enter username name",
                minlengt: "Username should contain atleast 8 characters",
                maxlength:"Username can contain at most 15 characters",
                remote:"Username already exist"},
            password: {
                required: "Please enter a password",
                minlength: "Your password must be at least 5 characters long",
                maxlength:"Your password should contain at most 15 characters"},
            confirmPassword: {
                required: "Please enter confirm password",
                equalTo:"Cnfirm password should be same as password"}
        },

        submitHandler: function(form) {
            var oData = new FormData(document.forms.namedItem("register-form"));
            $.ajax({
                url:registerUrl,
                dataType: 'json',
                type : 'POST',
                data: oData,
                processData: false,  // tell jQuery not to process the data
                contentType: false,
                success: function(respMap) {
                    $("#resp_model").modal();
                    $("#resp_message").text(respMap.respData.respMessageCode)
                },
                error: function(request, status, error) {
                    $("#resp_model").modal();
                    $("#resp_message").text(errorMsg)
                }
            });
        }
    });

    $("#create-topic-form").validate({
        rules: {
            name: {
                required: true,
                maxlength:20
            }
        },
        messages: {
            name: {required:"Please enter topic name",
                maxlength:"Topic name should not be more then 20 characters"}
        },
        submitHandler: function(form) {
            $.ajax({
                url:saveTopicUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'name':$("#name").val(),
                    'visibility':$('select[name=visibility]').val()
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
        }
    });

    $(".topic_visibility").change(function(){
        var topicVisibility = "";
        if($(this). prop("checked") == true){
            topicVisibility = "PUBLIC"
        }else{
            topicVisibility = "PRIVATE"
        }
        $.ajax({
            url:changeVisiblityUrl,
            dataType: 'json',
            type : 'POST',
            data: {
                'topicId':$(this).attr('identity'),
                'topicVisibility':topicVisibility
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


    $("#deleteTopic").validate({
        submitHandler: function(form) {
            $.ajax({
                url:deleteTopicUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'id':$('#deleteTopicId').val()
                },
                success: function(respMap) {
                    $("#resp_model_home").modal();
                    $("#resp_message_home").text(respMap.respData.respMessageCode)
                },
                error: function(request, status, error) {
                    $("#resp_model").modal();
                    $("#resp_message").text(errorMsg)
                }
            });
        }
    });

    $("#updateTopic").validate({
        rules: {
            name: {
                required: true,
                maxlength:20
            }
        },
        messages: {
            name: {required:"Please enter topic name",
                maxlength:"Topic name should not be more then 20 characters"}
        },
        submitHandler: function(form) {
            $.ajax({
                url:updateTopicUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'name':$("#topic_name").val(),
                    'id':$("#id").val()
                },
                success: function(respMap) {
                    if(respMap.respData.respCode==1){
                        $("#resp_model").modal();
                        $("#resp_message").text(respMap.respData.respMessageCode)
                    }

                },
                error: function(request, status, error) {
                    $("#resp_model").modal();
                    $("#resp_message").text(errorMsg)
                }
            });
        }
    });

    $(".subscibe_link").click(function(){
        $.ajax({
            url:subscribeUrl,
            dataType: 'json',
            type : 'POST',
            data: {
                'topicId':$(this).attr('identity')
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

    $(".unsubscibe_link").click(function(){
        $.ajax({
            url:unsubscribeUrl,
            dataType: 'json',
            type : 'POST',
            data: {
                'id':$(this).attr('identity')
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


    $(".topic_seriousness").change(function(){
        $.ajax({
            url:changeSeriousnessUrl,
            dataType: 'json',
            type : 'POST',
            data: {
                'subscriptionId':$(this).attr('identity'),
                'topicSeriousness':$(this).val()
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


    $("#sendInvitation_form").validate({
        rules: {
            sentTo: {
                required: true,
            }
        },
        messages: {
            sentTo: {required:"Please enter invitee email(s)"}
        },
        submitHandler: function(form) {
            $.ajax({
                url:sendInvitationUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'topicId':$(".topicToInvite").val(),
                    'sentTo':$("#sentTo").val()
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
        }
    });

    $(".invitation_modal").click(function(){
        $('.topicToInvite').prop('disabled', false);
        var ident = $(this).attr('identity');
        if(ident){
            $(".topicToInvite").val(ident);
            $('.topicToInvite').prop('disabled', true);
        }

    });



    $("#update-profile-form").validate({
        rules: {
            firstName: {
                required: true,
                maxlength: 15
            },
            lastName: {
                required: true,
                maxlength: 15
            },
            userName: {
                required: true,
                minlength: 8,
                maxlength:15,
                remote: {
                    url: validateUserNameUrl,
                    type: "post",
                    data: {
                        username: function() {
                            return $( "#userName" ).val();
                        }
                    }
                }
            }
        },
        messages: {
            firsName: {required:"Please enter first name",
                maxlength:"First name cannot be more then 15 characters"},
            lastName: {required:"Please enter last name",
                maxlength:"Last name cannot be more then 15 characters"},
            userName: {required:"Please enter username name",
                minlengt: "Username should contain atleast 8 characters",
                maxlength:"Username can contain at most 15 characters",
                remote:"Username already exist"}
        },

        submitHandler: function(form) {
            var oData = new FormData(document.forms.namedItem("update-profile-form"));
            $.ajax({
                url:updateUserProfileUrl,
                dataType: 'json',
                type : 'POST',
                data: oData,
                processData: false,  // tell jQuery not to process the data
                contentType: false,
                success: function(respMap) {
                    $("#resp_model").modal();
                    $("#resp_message").text(respMap.respData.respMessageCode)
                },
                error: function(request, status, error) {
                    $("#resp_model").modal();
                    $("#resp_message").text(errorMsg)
                }
            });
        }
    });


    $("#createLinkResource_form").validate({
        rules: {
            urlDocument: {
                required: true,
                maxlength: 500
            },
            description: {
                required: true,
                minlength: 100,
                maxlength: 1000
            }
        },
        messages: {
            urlDocument: {required:"Please enter Url",
                maxlength:"Url can't exceed 500 character"},
            description: {required:"Please add some description",
                minlength:"Description should contain atleast 100 characters",
                maxlength:"Description can't exceed 1000 characters"}
        },

        submitHandler: function(form) {
            $.ajax({
                url:createLinkResourceURL,
                dataType: 'json',
                type : 'POST',
                data: {
                    'urlDocument':$("#urlDocument").val(),
                    'description':$("#description").val(),
                    'topic':$('select[name=topic]').val()
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
        }
    });

    $("#createFileResource_form").validate({
        rules: {

            description: {
                required: true,
                minlength: 100,
                maxlength: 1000
            }
        },
        messages: {
            description: {required:"Please add some description",
                minlength:"Description should contain atleast 100 characters",
                maxlength:"Description can't exceed 1000 characters"}
        },

        submitHandler: function(form) {
            var oData = new FormData(document.forms.namedItem("createFileResource_form"));
            $.ajax({
                url:createDocumentResourceURL,
                dataType: 'json',
                type : 'POST',
                data: oData,
                processData: false,  // tell jQuery not to process the data
                contentType: false,
                success: function(respMap) {
                    $("#resp_model").modal();
                    $("#resp_message").text(respMap.respData.respMessageCode)
                },
                error: function(request, status, error) {
                    $("#resp_model").modal();
                    $("#resp_message").text(errorMsg)
                }
            });
        }
    });

    $("#updateResource_form").validate({
        rules: {

            description: {
                required: true,
                minlength: 100,
                maxlength: 1000
            }
        },
        messages: {
            description: {required:"Please add some description",
                minlength:"Description should contain atleast 100 characters",
                maxlength:"Description can't exceed 1000 characters"}
        },

        submitHandler: function(form) {
            $.ajax({
                url:updateResourceUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'description':$('#update_description').val(),
                    'id':$('#resource_id').val()

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
        }
    });


    $("#deleteResource_form").validate({
        submitHandler: function(form) {
            $.ajax({
                url:deleteResourceUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'id':$('#deleteResourceId').val()
                },
                success: function(respMap) {
                    if(respMap.respData.respCode==1){
                        window.open(homeUrl,"_self");
                    }else{
                        $("#resp_model").modal();
                        $("#resp_message").text(respMap.respData.respMessageCode)
                    }
                },
                error: function(request, status, error) {
                    $("#resp_model").modal();
                    $("#resp_message").text(errorMsg)
                }
            });
        }
    });

    $(".refresh").click(function(){
        window.location.reload(true);

    });

    $(".goTohome").click(function(){
        window.open(homeUrl,"_self");

    });


    $(".user_status").change(function(){
        var userStatus = false;
        if($(this). prop("checked") == true){
            userStatus = true
        }else{
            userStatus = false
        }
        $.ajax({
            url:changeUserStatusUrl,
            dataType: 'json',
            type : 'POST',
            data: {
                'id':$(this).attr('identity'),
                'status':userStatus
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


    $("#change_password_form").validate({
        rules: {
            currentPassword: {
                required: true,
                minlength: 8,
                maxlength: 15
            } ,
            newPassword: {
                required: true,
                minlength: 8,
                maxlength: 15
            },
            confirmPassword: {
                required: true,
                equalTo:"#newPassword"
            }
        },
        messages: {
            currentPassword: {
                required: "Please enter current password",
                minlength: "Your password must be at least 5 characters long",
                maxlength:"Your password should contain at most 15 characters"},
            newPassword: {
                required: "Please enter new password",
                minlength: "Your password must be at least 5 characters long",
                maxlength:"Your password should contain at most 15 characters"},
            confirmPassword: {
                required: "Please enter confirm password",
                equalTo:"Cnfirm password should be same as password"}
        },

        submitHandler: function(form) {
            $.ajax({
                url:changePasswordUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'userName':$("#ChangePassUserName").val(),
                    'currentPassword':$("#currentPassword").val(),
                    'newPassword':$("#newPassword").val(),
                    'confirmPassword':$("#confirmPassword").val()
                },
                success: function(respMap) {
                    $("#resp_model_home").modal();
                    $("#resp_message_home").text(respMap.respData.respMessageCode)
                },
                error: function(request, status, error) {
                    $("#resp_model_home").modal();
                    $("#resp_message_home").text(errorMsg)
                }
            });
        }
    });

    $("#forget_password_change_password_form").validate({
        rules: {
            newPassword: {
                required: true,
                minlength: 8,
                maxlength: 15
            },
            confirmPassword: {
                required: true,
                equalTo:"#newPassword"
            }
        },
        messages: {
            newPassword: {
                required: "Please enter new password",
                minlength: "Your password must be at least 5 characters long",
                maxlength:"Your password should contain at most 15 characters"},
            confirmPassword: {
                required: "Please enter confirm password",
                equalTo:"CoWnfirm password should be same as password"}
        },

        submitHandler: function(form) {
            $.ajax({
                url:changePasswordUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'userName':$("#ChangePassUserName").val(),
                    'newPassword':$("#newPassword").val(),
                    'confirmPassword':$("#confirmPassword").val()
                },
                success: function(respMap) {
                    $("#resp_model_home").modal();
                    $("#resp_message_home").text(respMap.respData.respMessageCode)
                },
                error: function(request, status, error) {
                    $("#resp_model_home").modal();
                    $("#resp_message_home").text(errorMsg)
                }
            });
        }
    });



    $("#forgetPassword_form").validate({
        rules: {
            userName: {
                required: true,
                minlength: 8,
                maxlength:50
            }
        },
        messages: {
            userName: {required:"Please enter username/email",
                minlength: "Username should contain atleast 8 characters",
                maxlength:"Username should contain at most 50 characters"}
        },
        submitHandler: function(form) {
            $.ajax({
                url:forgetPasswordUrl,
                dataType: 'json',
                type : 'POST',
                data: {
                    'userName':$("#userName").val()
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
        }
    });

    $(".inbox-search-button").click(function(){
        var searchKey=$('#inbox_search').val()
            $.ajax({
                url: inboxSearchUrl,
                type: 'POST',
                data: {
                    'searchKey': searchKey
                },
                success: function (data) {
                    $('#inbox_heading').text("Search for '"+searchKey+"'")
                    $('#inboxContent').html(data)
                }

            });
    });


    $(".markRead").click(function(){
        console.log($(this).attr('id'))
        var resOpId =($(this).attr('id')).split("_")[1]
        $.ajax({
            url:markResourceReadUrl,
            dataType: 'json',
            type : 'POST',
            data: {
                'resourceOperationId':resOpId,
                'resourceId':$(this).attr('value')
            },
            success: function(respMap) {
                window.location.reload(true);
            },
            error: function(request, status, error) {
                $("#resp_model").modal();
                $("#resp_message").text(errorMsg)
            }
        });
    });



});
