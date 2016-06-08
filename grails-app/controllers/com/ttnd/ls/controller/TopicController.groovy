package com.ttnd.ls.controller

import com.ttnd.ls.dto.TopicDto
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.TopicService

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

        render(view: 'home', flash.message )
    }


}
