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

import java.text.SimpleDateFormat

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

    Boolean validateUserName(Map map){
        ResponseData respData = new ResponseData()
        Map respMap =  [:]
        User user =User.findByUserName(map.userName)
        if(user ){
            if(map.user && user.userName.equals(map.userName)){
                true
            }else{
                false
            }
        }else{
            return true


        }
    }

    Boolean validateEmail(Map map){
        ResponseData respData = new ResponseData()
        Map respMap =  [:]
        User user =User.findByEmail(map.email)
        if(user){
            return false
        }else{
            true
        }
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

        String uniqueToken=UUID.randomUUID().toString()
        user.verificationExpiry=date
        user.verificationToken=uniqueToken
        String url = "http://localhost:8080/login/activateAccount?token="+uniqueToken
        Map mailMap = [:]
        mailMap.fullName=user.fullName
        mailMap.activationAcoountUrl=url
        println(user.email.split(","))
        userService.sendMail(user.email.split(","), "Forget password link", "forget_password_mail",mailMap)
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
        ResponseData respData = null
        User user =User.findByUserNameOrEmail(map.userName,map.userName)
        if(user){
            Date date =getCurrentUTCDate()
            use(TimeCategory) {
                date = date + 2.days
            }
            String uniqueToken=UUID.randomUUID().toString()
            user.verificationExpiry=date
            user.verificationToken=uniqueToken
            String url = "http://localhost:8080/login/validateLink?token="+uniqueToken
            Map mailMap = [:]
            mailMap.fullName=user.fullName
            mailMap.forgetPasswordUrl=url
            println(user.email.split(","))
            userService.sendMail(user.email.split(","), "Forget password link", "forget_password_mail",mailMap)

            respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.FORGET_PASSWORD_SUCCESS)
        }else{
            respData = new ResponseData(respCode: LSConstants.FAILURE_CODE ,respMessageCode: LSConstants.USERNAME_NOT_EXIST)
        }
        Map respMap =  ["respData":respData]
        respMap
    }

    Map validateLink(String token){
        ResponseData respData = null
        Map respMap = [:]
        User user = User.findByVerificationToken(token)
        if (user){
            if(getCurrentUTCDate()<user.verificationExpiry){
                respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.FORGET_PASSWORD_SUCCESS)
                respMap.userName=user.userName

                user.verificationExpiry=null
                user.verificationToken=null
                user.merge()
            }else{
                respData = new ResponseData(respCode: LSConstants.FAILURE_CODE ,respMessageCode: LSConstants.FORGET_PASSWORD_LINK_EXPIRED)
            }
        }else{
            respData = new ResponseData(respCode: LSConstants.FAILURE_CODE ,respMessageCode: LSConstants.FORGET_PASSWORD_INVALID_URL)
        }
        respMap.put('respData',respData)
        respMap
    }

    def activateAccount(String token){

    }

    def changePassword(Map map){
        ResponseData respData = null
        User user = User.findByUserName(map.userName)
        if(map.user){
            if(map.currentPassword.encodeAsSHA256().equals(user.password)){
                user.password=map.newPassword.encodeAsSHA256()
                user.merge()
                respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.USER_PASSWORD_CHANGE_SUCCESS)
            }else{
                respData = new ResponseData(respCode: LSConstants.FAILURE_CODE ,respMessageCode: LSConstants.CURRENT_PASSWORD_INCCORECT)
            }
        }else{
            user.password=map.newPassword.encodeAsSHA256()
            user.merge()
            respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.USER_PASSWORD_CHANGE_SUCCESS)
        }


        Map respMap =  ["respData":respData]
        respMap
    }

    def mainSearch(Map map){

    }

    def getCurrentUTCDate(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss")
        dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"))

        dateFormat.parse(dateFormat.format(new Date()))
    }


}
