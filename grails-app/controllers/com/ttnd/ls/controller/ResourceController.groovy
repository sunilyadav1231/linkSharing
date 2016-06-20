package com.ttnd.ls.controller

import com.ttnd.ls.entity.Resource
import com.ttnd.ls.entity.User
import com.ttnd.ls.service.ResourceService
import com.ttnd.ls.service.TopicService
import grails.converters.JSON

class ResourceController {

    ResourceService resourceService
    TopicService topicService

    def createLinkResource(){
        params.createdBy = session.userData
        Map respMap =resourceService.createLinkResource(params)

        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)
        render respMap as JSON
    }

    def createFileResource(){
        params.createdBy = session.userData
        Map respMap =resourceService.createFileResource(params)

        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)
        render respMap as JSON
    }

    def updateResource(){
        Map respMap =resourceService.updateResource(params)

        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)
        render respMap as JSON
    }

    def deleteResource(){
        Map respMap =resourceService.deleteResource(params)

        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)
        render respMap as JSON
    }

    def resourceList(){
        params.max=10
        params.user=session.userData
        Map map = resourceService.userResourceList(params)
        render(view: '/user/resources',model: map)

    }



}
