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

    Map createTopic(Map map) {
        ResponseData respData = null

        Topic topic1=Topic.findByCreatedByAndName(map.createdBy,map.name)
        if(topic1){
            respData = new ResponseData(respCode: LSConstants.FAILURE_CODE ,respMessageCode: LSConstants.TOPIC_ALREADY_EXIST)
        }else{
            Topic topic = new Topic(map)

            Subscription subscription = new Subscription(user: topic.createdBy, topic: topic)
            topic.subscriptions=[subscription]
            topic.save()
            respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.TOPIC_CREATE_SUCCESS)
        }

        Map respMap =  ["respData":respData]
        respMap
    }

    Map changeVisibility(Map map){
        ResponseData respData = null
        Topic topic = Topic.load(map.topicId)
        topic.visibility=map.topicVisibility
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.VISIBILITY_CHANGE_SUCCESS)
        Map respMap =  ["respData":respData]
        respMap
    }

    Map deleteTopic(Map map){
        ResponseData respData = null
        Topic topic = Topic.load(map.id)
        topic.delete()
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.TOPIC_DELETE_SUCCESS)
        Map respMap =  ["respData":respData]
        respMap
    }

    Map updateTopic(Map map){
        ResponseData respData = null
        Topic topic1=Topic.findByCreatedByAndName(map.createdBy,map.name)
        if(topic1){
            respData = new ResponseData(respCode: LSConstants.FAILURE_CODE ,respMessageCode: LSConstants.TOPIC_ALREADY_EXIST)
        }else{
            Topic topic = Topic.load(map.id)
            topic.name=map.name
            topic.merge()
            respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.TOPIC_UPDATE_SUCCESS)
        }

        Map respMap =  ["respData":respData]
        respMap
    }

    Map userTopicList(Map map){
        User user = User.get(map.user.id)

        List<Subscription> subscriptionList = Subscription.createCriteria().list(map) {
            eq('user',map.user)
        }

        [topics:subscriptionList*.topic,topicCount:subscriptionList.size()]
    }

    Map topicSubscribers(Map map){
        User user = User.get(map.user.id)
        Topic topic = Topic.get(map.topicId)
        List<User> users = User.createCriteria().list(map) {
            'subscriptions'{
               eq('topic',topic)
            }
        }
        /*List<Subscription> subscriptionList = Subscription.createCriteria().list(map) {
            eq('topic',Topic.get(map.topicId))
        }*/

        [users:users,userCount:users.totalCount,topicId:map.topicId]
    }

    def topicList(Long userId){
        List<Topic> topicList = Topic.findAllById(userId)
        topicList
    }

    def publicTopics(){
        List<Topic> publicTopic = Topic.findAllByVisibility(Visibility.PUBLIC)
        publicTopic
    }


    def fetchSubscribedTopic(User user){
        user = User.get(user.id)
        List<Topic> topics = user.subscriptions*.topic.sort{
            Topic topic -> topic.resources.lastUpdated
        }
        topics
    }

    def trendingTopics(User user){
        def criteria = Topic.createCriteria()

        List<Topic> topicList = criteria.listDistinct {
            or{

                'subscriptions'{
                    eq('user',user)
                }
                eq('visibility',Visibility.PUBLIC)
            }
        }
        topicList.sort {
            Topic topic -> -topic.resources.size()
        }
        topicList
    }


}
