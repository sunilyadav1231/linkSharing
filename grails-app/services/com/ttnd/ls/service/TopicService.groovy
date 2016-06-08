package com.ttnd.ls.service

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.enumConstant.Visibility
import grails.transaction.Transactional

@Transactional
class TopicService {

    def createTopic(Topic topic) {
        def respData = new ResponseData()

        Subscription subscription = new Subscription(user: topic.createdBy, topic: topic)
        topic.subscriptions=[subscription]
        topic.save()
        if(topic.id){
            respData.respCode=LSConstants.SUCCESS_CODE
            respData.respMessageCode=LSConstants.SUCCESS_DESC
        }else{
            respData.respCode=LSConstants.FAILURE_CODE
            respData.respMessageCode=LSConstants.FAILURE_CODE
        }

    }

    def topicList(Long userId){

        List<Topic> topicList = Topic.findAllById(userId)

        topicList
    }

/*    def subscribedTopics(User user){
        List<Topic> subscribedTopics = Subscription.findAllByUser(user)*.topic
        subscribedTopics
    }*/


    def publicTopics(){
        List<Topic> publicTopic = Topic.findAllByVisibility(Visibility.PUBLIC)
        publicTopic
    }
}
