package com.ttnd.ls.service

import com.ttnd.ls.entity.Resource
import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.enumConstant.Visibility
import grails.transaction.Transactional
import org.hibernate.FetchMode

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }

    def subscribe(Map map){
        Subscription subscription = new Subscription(user: map.user, topic: map.topic)
        subscription.save(flush: true)
        subscription
    }

    def unsubscribe(Subscription subscription){
        subscription.delete()
    }

    def fetchSubscriptions(User user){
        def criteria = Subscription.createCriteria()
        List<Subscription> subscriptionList = (criteria.list{
            maxResults(5)
            eq('user',user)
            /*'topic' {
                'resources' {
                    order('dateCreated', 'asc')
                }
            }*/
        }).sort{
            Subscription subscription -> subscription.topic.resources.dateCreated
        }
//        List<Subscription> subscriptions = Subscription.findAllByUser(user)
        subscriptionList

    }

    def trendingTopics(User user){
        def criteria = Subscription.createCriteria()
        List<Subscription> subscriptionList = (criteria.list{
            or{
                'topic'{
                    eq("visibility",Visibility.PUBLIC)
                }
                eq('user',user)
            }
        }).sort{
            Subscription subscription-> -subscription.topic.resources.size()
        }
        subscriptionList = subscriptionList.unique{a,b ->
             a.topic.id<=>  b.topic.id
        }
        //subscriptionList = subscriptionList.unique()
        List result
        if(subscriptionList.size()>4){
            result =subscriptionList.subList(0,5)
        }else{
            result =subscriptionList
        }
        result
    }
}
