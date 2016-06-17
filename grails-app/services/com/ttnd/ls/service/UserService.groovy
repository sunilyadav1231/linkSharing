package com.ttnd.ls.service

import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import grails.plugin.asyncmail.AsynchronousMailService
import grails.transaction.Transactional

@Transactional
class UserService {

    LoginService loginService
    TopicService topicService
    SubscriptionService subscriptionService
    ResourceService resourceService
    AsynchronousMailService asynchronousMailService
    def groovyPageRenderer


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
            map.put("inboxResources",resourceService.fetchResources(user))
            map.put('userData', user)
            map
    }

    def fetchUserData(long id){
        User user =User.get(id)
        user
    }



    def sendInvitation(map){
        Map respMap = [:]
        String[] sentTo = map.sentTo.split(",")
        Topic topic = Topic.get(map.topicId)
        String url = "http://localhost:8080/login/showTopic?topic.id="+topic.id
        map.topicUrl = url
        map.sendersName = map.user.fullName
        map.topicName = topic.name
        String subject = "Topic Invitation"
        sendMail(sentTo,subject,"send_invitation_mail",map)

        respMap.response="Success"
        respMap

    }

    def updateProfile(Map map){
        User user = User.load(map.id)
        user.firstName=map.firstName
        user.lastName =map.lastName
        user.userName = map.userName
        if(map.proflePicFile.size>0){
            map= loginService.saveImage(map)
            user.photoPath=map.photoPath
        }
        user
    }

    def changePassword(Map map){
        User user = User.get(map.id)
        if(map.currentPassword.equals(user.password)){
            user.password=map.newPassword
        }
        user.merge()
    }

    def sendMail(String[] sentTo, String subjectMsg, String template,Map map){
        asynchronousMailService.sendAsynchronousMail {
            to sentTo
            subject subjectMsg
            html groovyPageRenderer.render(template:"/emails/${template}", model:map)
        }
    }

}
