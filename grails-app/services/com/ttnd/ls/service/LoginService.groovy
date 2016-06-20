package com.ttnd.ls.service

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.entity.Resource
import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.enumConstant.Visibility
import grails.transaction.Transactional
import grails.util.Holders
import groovy.time.TimeCategory
import liquibase.util.file.FilenameUtils

@Transactional
class LoginService {

    TopicService topicService
    ResourceService resourceService
    UserService userService

    Map validateLogin(Map map){
        ResponseData respData = new ResponseData()
        Map respMap =  [:]
        User user =User.findByUserNameOrEmail(map.userName,map.userName)
        if(user && user.password.equals(map.password.encodeAsSHA256())){
            if(user.active){
                respData.respCode=LSConstants.SUCCESS_CODE
                respData.respMessageCode= LSConstants.SUCCESS_DESC
                respMap.put("user",user)
            }else{
                respData.respCode=LSConstants.FAILURE_CODE
                respData.respMessageCode=LSConstants.USER_INACTIVE
            }
        }else{
            respData.respCode=LSConstants.FAILURE_CODE
            respData.respMessageCode=LSConstants.INVALID_CREDENTIAL
        }
        respMap.put("respData",respData)
        respMap
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

    Map register(Map userDto){
        ResponseData respData = null;
        User user=null
        String pass = userDto.password.encodeAsSHA256()

            if(userDto.proflePicFile?.size){
                saveImage(userDto)
            }
            userDto.password=pass
        user = new User(userDto)
            user.save()
        user
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.REGISTER_SUCCESS)
        Map respMap =  ["respData":respData,"user":user]
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

    def forgetPassword(Map map){
        User user =User.findByUserNameOrEmail(map.userName,map.userName)
        if(user){
            Date date = new Date()

            use(TimeCategory) {
                date = date + 2.days
            }
            String uniqueToken=UUID.randomUUID().toString()
            user.verificationExpiry=date
            user.verificationToken=uniqueToken
            String url = "http://localhost:8080/login/showTopic?token="+uniqueToken
            Map mailMap = [:]
            mailMap.fullName=user.fullName
            mailMap.forgetPasswordUrl=url
            userService.sendMail([user.email], "Forget Password", "_forget_password_mail",mailMap)
            map
        }
    }

    def validateLink(String token){
        User user = User.findByVerificationToken(token)
        if (user){
            if(new Date()<user.verificationExpiry){
                true
            }else{
                false
            }
        }else{
            false
        }

    }


}
