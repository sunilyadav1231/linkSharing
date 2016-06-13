package com.ttnd.ls.controller

import com.ttnd.ls.entity.ResourceOperation
import com.ttnd.ls.service.ResourceOperationService

class ResourceOperationController {

    //static scaffold = ResourceOperation

    ResourceOperationService resourceOperationService
    def index() { }

    def markRead(){
            resourceOperationService.markRead(params)


        redirect(controller: 'user', action: 'dashboard')
    }
}
