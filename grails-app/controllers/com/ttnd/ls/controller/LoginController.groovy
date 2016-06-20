package com.ttnd.ls.controller

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.entity.Resource
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.LoginService
import com.ttnd.ls.service.ResourceService
import grails.converters.JSON

class LoginController {

    LoginService loginService
    ResourceService resourceService


    def index() {

        if(session.userData){
            redirect(controller: 'user', action: 'index')
        }else{
            redirect(controller: 'login', action: 'home')
        }
    }


    def showImage(){
        def photo = new File(params.path)
        response.contentType = "image/jpeg"
        response.outputStream << photo.bytes
        response.outputStream.flush()
    }

    def downloadResource(){
        def file = new File(params.path)

        if (file.exists())
        {
            response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
            response.outputStream << file.bytes
            response.outputStream.flush()
        }

    }


    def home(){
        if(session.userData){
            redirect(controller: 'user', action: 'index')
        }
        render(view: 'home',model:loginService.fetchLoginData())
    }

    def loginHandler() {
        def respMap= loginService.validateLogin(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)
        session.userData = respMap.user
        render respMap as JSON

    }



    def logout() {
        session.invalidate()

        redirect(controller: 'login',action: 'home')
    }

    def register() {
        Map respMap =loginService.register(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)
        render respMap as JSON
    }


    def showPost(Resource resource){
        Map map1=[:]
        map1.resource=resource
        map1.user = session.userData
        Map map = resourceService.showPostDetail(map1)
        render(view: 'post',model:map)
    }

    def showTopic(Topic topic){
        Map map1=[:]
        map1.topic=topic
        map1.user = session.userData
        Map map = resourceService.showTopicDetail(map1)
        render(view: 'topic',model:map)
    }

    def fetchUserDetail(String userName){
        Map map=[:]
            map = loginService.fetchUserDetail(userName,session.userData)
        render(view: 'user_profile',model:map)

    }

    def forgetPassword(){
        Map map=[:]
        map = loginService.forgetPassword(params)
        redirect(controller: 'login',action: 'home')
    }

    def validateLink(String token){
        Map map=[:]
        map = loginService.validateLink(token)
        render map as JSON
    }

}
