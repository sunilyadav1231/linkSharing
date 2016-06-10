package com.ttnd.ls.controller

import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.service.SubscriptionService

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

        render(view: 'home', flash.message )
    }

    def unSubscribe(Subscription subscription){
        params
        subscriptionService.unsubscribe(subscription)
        if(hasErrors()){
            flash.message=errors.toString()
        }else{
            flash.message="Topic subscribed successfully"
        }

        redirect(controller: 'user', action: 'dashboard')
    }
}
