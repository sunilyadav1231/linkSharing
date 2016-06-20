package com.ttnd.ls.controller

import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.service.SubscriptionService
import grails.converters.JSON

class SubscriptionController {

    //static scaffold = Subscription
    SubscriptionService subscriptionService

    def index() { }

    def subscribe(){
        params.user=session.userData
        Map respMap =subscriptionService.subscribe(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def unSubscribe(){
        Map respMap =subscriptionService.unsubscribe(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }

    def changeSeriousness(){
        Map respMap =subscriptionService.changeSeriousness(params)
        respMap.respData.respMessageCode = message(code: respMap.respData.respMessageCode)

        render respMap as JSON
    }
}
