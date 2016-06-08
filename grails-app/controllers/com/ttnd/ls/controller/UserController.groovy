package com.ttnd.ls.controller

import com.ttnd.ls.dto.UserDto
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.TopicService
import com.ttnd.ls.service.UserService
import org.apache.tomcat.util.http.ContentType

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class UserController {

    UserService userService

    TopicService topicService


    def index(){

        redirect(controller: 'user', action: 'dashboard')

    }


    def showImage(){

        def photo = new File(params.path)
        byte[] image = photo.bytes
        response.contentType = "image/jpeg"
        response.outputStream << image
        response.outputStream.flush()
    }


    def dashboard(){

        Map map = userService.dashboardData(session.userData)
        session.userData = map.userData
        render(view: 'dashboard',model:map)
    }

}
