package com.ttnd.ls.controller

import com.ttnd.ls.dto.TopicDto
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.TopicService
import grails.converters.JSON

class TopicController {
    //static scaffold = Topic

    TopicService topicService

    /*def show(){
        Topic topic=Topic.read(params.topicId)
        if(topic){

        }
    }*/

    def save() {
        params.createdBy=session.userData
        Map respMap =topicService.createTopic(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def changeVisiblity(){
        Map respMap =topicService.changeVisibility(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def deleteTopic(){
        Map respMap =topicService.deleteTopic(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def updateTopic(){
        params.createdBy=session.userData
        Map respMap =topicService.updateTopic(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def userTopicList(){
        params.max=10
        params.user=session.userData
        Map map = topicService.userTopicList(params)
        render(view: '/user/topics',model: map)
    }

}
