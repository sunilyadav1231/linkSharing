package com.ttnd.ls.controller

import com.ttnd.ls.entity.ResourceOperation
import com.ttnd.ls.service.ResourceOperationService
import grails.converters.JSON

class ResourceOperationController {

    //static scaffold = ResourceOperation

    ResourceOperationService resourceOperationService
    def index() { }

    def markRead(){
        params.user=session.userData
        Map respMap= resourceOperationService.markRead(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def rateResource(){
        params.user=session.userData
        Map respMap = resourceOperationService.rateResource(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }
}
