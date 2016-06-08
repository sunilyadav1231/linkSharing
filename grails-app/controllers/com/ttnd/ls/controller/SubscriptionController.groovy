package com.ttnd.ls.controller

import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.service.SubscriptionService

class SubscriptionController {

    //static scaffold = Subscription
    SubscriptionService subscriptionService

    def index() { }

    def subscribe(){
        Subscription subscription = new Subscription()
        bindData(subscription,params)
        subscription.user=session.user

        subscriptionService.save(subscription)
        if(hasErrors()){
            flash.message=errors.toString()
        }else{
            flash.message="Topic subscribed successfully"
        }

        render(view: 'home', flash.message )
    }

    def unSubscribe(){
        subscriptionService.delete(params.id)
        if(hasErrors()){
            flash.message=errors.toString()
        }else{
            flash.message="Topic subscribed successfully"
        }

        render(view: 'home', flash.message )
    }
}
