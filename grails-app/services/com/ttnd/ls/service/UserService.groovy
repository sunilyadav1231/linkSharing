package com.ttnd.ls.service

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.entity.Resource
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

            List<Resource> resources = resourceService.fetchUnreadResources(user)
            List<Resource> top5UnreadResource= []
            if(resources.size()>4){
                top5UnreadResource =resources.subList(0,5)
            }else{
                top5UnreadResource =resources
            }


            map.put("subscribedTopics",subscribedTopics)
            map.put("subscriptions",top5Subscription)
            map.put("trendingTopics",top5Trending)
            map.put("inboxResources",top5UnreadResource)
            map.put('userData', user)
            map
    }

    def fetchUserData(long id){
        User user =User.get(id)
        user
    }



    Map sendInvitation(map){
        ResponseData respData = null

        String[] sentTo = map.sentTo.split(",")
        Topic topic = Topic.get(map.topicId)
        String url = "http://localhost:8080/login/showTopic?topic.id="+topic.id
        map.topicUrl = url
        map.sendersName = map.user.fullName
        map.topicName = topic.name
        String subject = "Topic Invitation"
        sendMail(sentTo,subject,"send_invitation_mail",map)

        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.TOPIC_INVITATION_SENT_SUCCESS)
        Map respMap =  ["respData":respData]
        respMap

    }

    Map updateProfile(Map map){
        ResponseData respData = null
        User user = User.load(map.id)
        user.firstName=map.firstName
        user.lastName =map.lastName
        user.userName = map.userName
        if(map.proflePicFile?.size>0){
            if(user.photoPath){
                new File(user.photoPath).delete()
            }
            map= loginService.saveImage(map)
            user.photoPath=map.photoPath
        }
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.USER_PROFILE_UPDATE_SUCCESS)
        Map respMap =  ["respData":respData,"user":user]
        respMap
    }

    Map changeStatus(Map map){
        ResponseData respData = null
        User user = User.load(map.id)
        user.active=map.status.toBoolean()
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.USER_STATUS_CHANGE_SUCCESS)
        Map respMap =  ["respData":respData]
        respMap

    }



    def userList(Map map){
        List<User> users1 =User.findAll()
        List<User> users = User.createCriteria().list(map) {
            eq('admin',false)
        }
        [users:users,userCount:users.totalCount]
    }

    def inboxSearch(Map map){
        def criteria = Resource.createCriteria()
        List<Resource> resources=[]
        List<Resource> resourceList = criteria.list {
            'topic' {
                'subscriptions' {
                    eq('user', map.user)
                }
            }
            or{
                ilike('description','%'+map.searchKey+'%')
                'topic'{
                    ilike('name','%'+map.searchKey+'%')
                }
            }
        }
        resourceList.forEach{Resource resource->
            if(resource.resourceOperations){
                boolean stat = true
                resource.resourceOperations?.forEach{
                    if(it.user==map.user ){
                        if(!it.isRead){
                            resource.resourceOperations=[it]
                            resources.add(resource)
                        }
                        stat = false
                    }
                }
                if(stat){
                    resource.resourceOperations=[]
                    resources.add(resource)
                }
            }else{
                resources.add(resource)
            }
        }
        resources
    }


    def userTopicSearch(Map map){
        def criteria = Topic.createCriteria()
        List<Topic> topics = criteria.list {
            eq('createdBy',map.user)
            ilike('name','%'+map.searchKey+'%')
        }
        topics
    }



    def sendMail(String[] sentTo, String subjectMsg, String template,Map map){
        asynchronousMailService.sendAsynchronousMail {
            log.info("Sending mail for"+subjectMsg)
            to sentTo
            subject subjectMsg
            html groovyPageRenderer.render(template:"/emails/${template}", model:map)
        }
    }

}
