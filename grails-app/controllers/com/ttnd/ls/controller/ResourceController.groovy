package com.ttnd.ls.controller

import com.ttnd.ls.entity.Resource
import com.ttnd.ls.service.ResourceService
import com.ttnd.ls.service.TopicService

class ResourceController {

    ResourceService resourceService
    TopicService topicService

    def createLinkResource(){
        params.createdBy = session.userData
        resourceService.createLinkResource(params)

        redirect(controller: 'user', action: 'dashboard')
    }

    def createFileResource(){
        params.createdBy = session.userData
        resourceService.createFileResource(params)

        redirect(controller: 'user', action: 'dashboard')
    }

    def deleteResource(){
        resourceService.deleteResource(params)
        redirect(controller: 'user', action: 'dashboard')
    }




}
