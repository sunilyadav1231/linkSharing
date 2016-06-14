package com.ttnd.ls.controller

import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.service.SubscriptionService
import grails.converters.JSON

class SubscriptionController {

    //static scaffold = Subscription
    SubscriptionService subscriptionService

    def index() { }

    def subscribe(Topic topic){
        params.user=session.userData
        params.topic = topic
        subscriptionService.subscribe(params)
        if(hasErrors()){
            flash.message=errors.toString()
        }else{
            flash.message="Topic subscribed successfully"
        }

        redirect(controller: 'user', action: 'dashboard')
    }

    def unSubscribe(Subscription subscription){

        subscriptionService.unsubscribe(subscription)
        if(hasErrors()){
            flash.message=errors.toString()
        }else{
            flash.message="Topic subscribed successfully"
        }

        redirect(controller: 'user', action: 'dashboard')
    }

    def changeSeriousness(){
        Subscription subscription =subscriptionService.changeSeriousness(params)
        Map map = [:]
        render map as JSON
    }
}
