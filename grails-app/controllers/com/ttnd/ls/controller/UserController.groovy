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
        Map map = userService.sendInvitation(params)
        render map as JSON
    }

    def updateProfile(){
        userService.updateProfile(params)
        redirect(controller: 'user', action: 'dashboard')

    }

    def changePassword(){
        userService.changePassword(params)
        session.invalidate()
        redirect(controller: 'login', action: 'index')

    }

    def users(){
        Map map= userService.userList()
        render(view: 'users',model:map)

    }


    def changeUserStatus(){
        Map map= userService.changeStatus(params)
        render map as JSON

    }



}
