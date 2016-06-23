package com.ttnd.ls.controller

import com.ttnd.ls.service.TopicService
import com.ttnd.ls.service.UserService
import grails.converters.JSON

class UserController {

    UserService userService

    TopicService topicService


    def index(){

        redirect(controller: 'user', action: 'dashboard')

    }


    def dashboard(){
        Map map = userService.dashboardData(session.userData)
        session.userData = map.userData
        render(view: 'dashboard',model:map)
    }

    def sendInvitation(){
        params.user = session.userData
        Map respMap = userService.sendInvitation(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def updateProfile(){
        Map respMap = userService.updateProfile(params)
        session.userData=respMap.user
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON

    }

    def changeUserStatus(){
        Map respMap= userService.changeStatus(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON

    }

    def users(){
        params.max=20
        params.user=session.userData
        Map map= userService.userList(params)
        render(view: '/user/users',model:map)
    }

    def inboxSearch(){
        params.max=5
        params.user=session.userData
        render template: '/templates/resource_brief', collection: userService.inboxSearch(params), var: 'resource'
    }


}
