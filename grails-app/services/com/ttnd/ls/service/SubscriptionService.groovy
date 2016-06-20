package com.ttnd.ls.service

import com.ttnd.ls.constants.LSConstants
import com.ttnd.ls.dto.ResponseData
import com.ttnd.ls.entity.Resource
import com.ttnd.ls.entity.Subscription
import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.enumConstant.Seriousness
import com.ttnd.ls.enumConstant.Visibility
import grails.transaction.Transactional
import org.hibernate.FetchMode

@Transactional
class SubscriptionService {

    Map subscribe(Map map){
        ResponseData respData = null
        Subscription subscription = new Subscription(user: map.user, topic: Topic.load(map.topicId) )
        subscription.save()
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.SUBSCRIPTION_SUCCESS)
        Map respMap =  ["respData":respData]
        respMap
    }

    Map unsubscribe(Map map){
        ResponseData respData = null
        Subscription subscription = Subscription.get(map.id)
        subscription.delete()
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.UNSUBSCRIPTION_SUCCESS)
        Map respMap =  ["respData":respData]
        respMap
    }

    Map changeSeriousness(Map map){
        ResponseData respData = null
        Subscription subscription = Subscription.load(map.subscriptionId)
        subscription.seriousness=map.topicSeriousness
        subscription.merge()
        respData = new ResponseData(respCode: LSConstants.SUCCESS_CODE ,respMessageCode: LSConstants.SERIOUSNESS_CHANGE_SUCCESS)
        Map respMap =  ["respData":respData]
        respMap
    }



/*    def fetchSubscriptions(User user){
        def criteria = Subscription.createCriteria()
        List<Subscription> subscriptionList = (criteria.list{
            maxResults(5)
            eq('user',user)
        }).sort{
            Subscription subscription -> subscription.topic.resources.dateCreated
        }
        subscriptionList

    }*/

/*    def trendingTopics(User user){
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
        List result
        if(subscriptionList.size()>4){
            result =subscriptionList.subList(0,5)
        }else{
            result =subscriptionList
        }
        result
    }*/
}
