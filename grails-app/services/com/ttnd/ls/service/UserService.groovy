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


    def dashboardData(User user){
            Map map = [:]
            map.put("subscribedTopics",subscriptionService.fetchSubscriptions(user).topic)
            map.put("subscriptions",subscriptionService.fetchSubscriptions(user))
            map.put("trendingTopics",topicService.publicTopics())
            map.put('userData', fetchUserData(user.id))
            map
    }

    def fetchUserData(long id){
        User user =User.get(id)
        user

    }


}
