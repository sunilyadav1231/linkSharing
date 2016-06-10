package com.ttnd.ls.service

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.dto.UserDto
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
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
        if(userDto.proflePicFile.size){
            saveImage(userDto)
        }

        if(!userDto.password.equals(userDto.confirmPassword)){
            userDto.valid=false
        }
    }

    def fetchLoginData(){
        Map map =[:]
        map.put("recentShares",resourceService.fetchRecentShare())
        map.put("topPosts",resourceService.fetchTopPosts())
        map
    }


}
