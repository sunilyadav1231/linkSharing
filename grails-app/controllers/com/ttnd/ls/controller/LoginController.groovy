package com.ttnd.ls.controller

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.dto.UserDto
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.LoginService

class LoginController {

    LoginService loginService

    def index() {

        if(session.userData){
            redirect(controller: 'user', action: 'index')
        }else{
            redirect(controller: 'login', action: 'home')
        }
    }


    def home(){

        render(view: 'home',model:[ publicTopics:loginService.fetchLoginData()])
    }

    def loginHandler() {
        def respMap= loginService.validateLogin(params)
        if(respMap.respData.respCode==LSConstants.SUCCESS_CODE){
                session.userData = respMap.user
            redirect(controller: 'user', action: 'index')
        }else{
            flash.error = respMap.respData.respMessageCode
            render(view: 'home', flash.error )
        }
    }



    def logout() {
        session.invalidate()

        redirect(controller: 'login',action: 'home')
    }

    def register() {

        loginService.fetchUserData(params)
        User user = new User()
        bindData(user,params)
        loginService.saveUser(user)

        params.user=user

        session.userData=user

        redirect(controller: 'user', action: 'index')

    }


}
