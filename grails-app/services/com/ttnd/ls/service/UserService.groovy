package com.ttnd.ls.service

import com.ttnd.ls.dto.LSRequest
import com.ttnd.ls.dto.TopicDto
import com.ttnd.ls.dto.UserDto
import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import grails.transaction.Transactional
import grails.util.Holders
import liquibase.util.file.FilenameUtils

@Transactional
class UserService {

    TopicService topicService
    SubscriptionService subscriptionService
    ResourceService resourceService


    def dashboardData(User user){
            Map map = [:]
            user = fetchUserData(user.id)
            List<Topic> subscribedTopics = topicService.fetchSubscribedTopic(user)
            List<Topic> top5Subscription = []
            if(subscribedTopics.size()>4){
                top5Subscription =subscribedTopics.subList(0,5)
            }else{
                top5Subscription =subscribedTopics
            }

            List<Topic> trendingTopics = topicService.trendingTopics(user)
            List<Topic> top5Trending= []
            if(trendingTopics.size()>4){
                top5Trending =trendingTopics.subList(0,5)
            }else{
                top5Trending =trendingTopics
            }

            map.put("subscribedTopics",subscribedTopics)
            map.put("subscriptions",top5Subscription)
            map.put("trendingTopics",top5Trending)
            map.put("inboxResources",resourceService.fetchUnreadResource(user))
            map.put('userData', user)
            map
    }

    def fetchUserData(long id){
        User user =User.get(id)
        user

    }


}
