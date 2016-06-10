package com.ttnd.ls.controller

import com.ttnd.ls.entity.Resource
import com.ttnd.ls.service.ResourceService

class ResourceController {

    ResourceService resourceService

    def createLinkResource(){
        params.createdBy = session.userData
        resourceService.createLinkResource(params)
    }

    def createFileResource(){
        params.createdBy = session.userData
        resourceService.createFileResource(params)
    }



}
