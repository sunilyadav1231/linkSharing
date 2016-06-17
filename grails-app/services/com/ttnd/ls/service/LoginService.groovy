package com.ttnd.ls.service

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.dto.UserDto
import com.ttnd.ls.entity.Resource
import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.enumConstant.Visibility
import grails.transaction.Transactional
import grails.util.Holders
import liquibase.util.file.FilenameUtils

@Transactional
class LoginService {

    TopicService topicService
    ResourceService resourceService

    def validateLogin(Map map){
        def respData = new ResponseData()

        User user =User.findByUserNameOrEmail(map.userName,map.userName)
        if(user && user.password.equals(map.password)){
            if(user.active){
                respData.respCode=LSConstants.SUCCESS_CODE
                respData.respMessageCode=LSConstants.SUCCESS_DESC
            }else{
                respData.respCode=LSConstants.FAILURE_CODE
                respData.respMessageCode=LSConstants.USER_INACTIVE
            }
        }else{
            respData.respCode=LSConstants.FAILURE_CODE
            respData.respMessageCode=LSConstants.INVALID_CREDENTIAL
        }

        Map respMap =  ["respData":respData,"user":user]
    }

    def saveImage(Map userDto){

        File profilePicDir = new File(Holders.config.files.paths.profilePicDir as String)

        String filePath = "${profilePicDir}${File.separator}${userDto.userName}"+"."+"${FilenameUtils.getExtension(userDto.proflePicFile.originalFilename)}"
        userDto.proflePicFile.transferTo(new File(filePath))

        userDto.photoPath=filePath
        userDto
    }

    def saveUser(User user){
        user.save()
    }

    def fetchUserData(Map userDto){
        if(!userDto.password.equals(userDto.confirmPassword)){
            userDto.valid=false
        }
        if(userDto.proflePicFile.size){
            saveImage(userDto)
        }

    }

    def fetchLoginData(){
        Map map =[:]
        map.put("recentShares",resourceService.fetchRecentShare())
        map.put("topPosts",resourceService.fetchTopPosts())
        map
    }

    def fetchUserDetail(String userName,User user){
        User userDetail = User.findByUserName(userName)
        Map map =[:]
        List<Topic> subscribedTopics = []
        List<Topic> topics = []
        if(user&& user.userName.equalsIgnoreCase(userName)){
            subscribedTopics =topicService.fetchSubscribedTopic(userDetail)
        }else{
            subscribedTopics =topicService.fetchSubscribedTopic(userDetail)
            subscribedTopics = subscribedTopics.findAll {
                Topic topic -> topic.visibility==Visibility.PUBLIC ||
                        user?.getSubscriptions().findAll{
                                Subscription subscription->subscription.topic.id==topic.id
                        }
            }
        }



        List<Topic> subscription =subscribedTopics-userDetail.topics
        topics=subscribedTopics-subscription
        List<Resource> resourceList = resourceService.fetchUserResources(userDetail)
        resourceList = resourceList.findAll{
            Resource resource->
                subscription.findAll{
                    resource.topic.id==resource.topic.id
                }
        }

        if(resourceList.size()>4){
            resourceList =resourceList.subList(0,5)
        }
        map.put("subscribedTopics",subscription)
        map.put("topics",topics)
        map.put("userData",userDetail)
        map.put("posts",resourceList)
        map
    }


}
