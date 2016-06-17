package com.ttnd.ls.controller

import com.ttnd.ls.dto.UserDto
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.TopicService
import com.ttnd.ls.service.UserService
import grails.converters.JSON
import org.apache.tomcat.util.http.ContentType

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

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



}
