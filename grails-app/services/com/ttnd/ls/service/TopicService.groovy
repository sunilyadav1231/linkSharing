package com.ttnd.ls.service

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.entity.Resource
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


    def fetchSubscribedTopic(User user){
        user = User.get(user.id)
        List<Topic> topics = user.subscriptions*.topic.sort{
            Topic topic -> topic.resources.dateCreated
        }

        topics
        /*def criteria = Subscription.createCriteria()*/
/*        List<Subscription> subscriptionList = (criteria.list{
            maxResults(5)
            eq('user',user)
            *//*'topic' {
                'resources' {
                    order('dateCreated', 'asc')
                }
            }*//*
        }).sort{
            Subscription subscription -> subscription.topic.resources.dateCreated
        }
        subscriptionList*/

    }

    def trendingTopics(User user){

        List<Topic> topics = Topic.findAllByCreatedByOrVisibility(User.load(user.id),Visibility.PUBLIC)
        topics.sort{
            Topic topic -> -topic.resources.size()
        }
        topics

        /*List<Subscription> subscriptionList = (criteria.list{
            or{
                'topic'{
                    eq("visibility",Visibility.PUBLIC)
                }
                eq('user',user)
            }


        }).sort{
            Subscription subscription-> -subscription.topic.resources.size()
        }

        subscriptionList = subscriptionList.unique{a,b ->
            a.topic.id<=>  b.topic.id
        }*/
        //subscriptionList = subscriptionList.unique()
        /*List result
        if(subscriptionList.size()>4){
            result =subscriptionList.subList(0,5)
        }else{
            result =subscriptionList
        }
        result*/
    }
}
