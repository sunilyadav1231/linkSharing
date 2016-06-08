package com.ttnd.ls.service

import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import grails.transaction.Transactional
import org.hibernate.FetchMode

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }

    def save(Subscription subscription){
        subscription.save()
    }

    def delete(Long id){
        Subscription.load(id).delete()
    }

    def fetchSubscriptions(User user){

        List<Subscription> subscriptions = Subscription.findAllByUser(user)
        subscriptions
    }
}
