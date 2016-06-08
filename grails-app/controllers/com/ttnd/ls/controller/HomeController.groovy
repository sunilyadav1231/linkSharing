package com.ttnd.ls.controller

class HomeController {


    def index(){

    }

    def home(){
        render(view: '/login/home',model: [])
    }



    def posts(){

        render(view: 'posts',model: [])
    }


    def edit(){

        render(view: 'edit',model: [])
    }
}
