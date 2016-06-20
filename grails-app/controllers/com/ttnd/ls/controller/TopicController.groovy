package com.ttnd.ls.controller

import com.ttnd.ls.dto.TopicDto
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.TopicService
import grails.converters.JSON

class TopicController {
    //static scaffold = Topic

    TopicService topicService

    def show(){
        Topic topic=Topic.read(params.topicId)
        if(topic){

        }
    }

    def showAll(){

    }


    def save() {
        Topic topic = new Topic(params)

        topic.createdBy=session.userData

        topicService.createTopic(topic)
        if(hasErrors()){
            flash.message=errors.toString()
        }else{
            flash.message="Topic saved successfully"
        }

        redirect(controller: 'user', action: 'dashboard')
    }

    def changeVisiblity(){
        Topic topic =topicService.changeVisibility(params)
        render topic as JSON
    }

    def deleteTopic(){
        Topic topic =topicService.deleteTopic(params)
        redirect(controller: 'user', action: 'dashboard')
    }

    def updateTopic(){
        topicService.updateTopic(params)
        redirect(controller: 'user', action: 'dashboard')
    }

}
