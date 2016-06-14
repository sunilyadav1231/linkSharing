package com.ttnd.ls.controller

import com.ttnd.ls.entity.ResourceOperation
import com.ttnd.ls.service.ResourceOperationService
import grails.converters.JSON

class ResourceOperationController {

    //static scaffold = ResourceOperation

    ResourceOperationService resourceOperationService
    def index() { }

    def markRead(){

            resourceOperationService.markRead(params)
        redirect(controller: 'user', action: 'dashboard')
    }

    def rateResource(){
        params.user=session.userData
        ResourceOperation resourceOperation= resourceOperationService.rateResource(params)
        Map map = [:]
        map.averageRating = resourceOperation.getResource().averageRating
        map.ratingUserCount = resourceOperation.getResource().ratingUserCount
        render map as JSON
    }
}
