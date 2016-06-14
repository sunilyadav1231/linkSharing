package com.ttnd.ls.entity

import org.codehaus.groovy.grails.orm.hibernate.cfg.IdentityEnumType

class Resource {

    static hasMany = [
                      resourceOperations:ResourceOperation
    ]

    static mapping = {
        createdBy lazy: false
        topic lazy: false

    }

    static belongsTo = [ createdBy : User,topic:Topic]


    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    transient int averageRating=0
    transient int ratingUserCount
    int getAverageRating(){
        if(id){

            int ratingCount = 0;
            int ratingUser = 0;
            if(resourceOperations){
                resourceOperations.forEach{ResourceOperation resourceOperation ->
                    if(resourceOperation.score>0){
                        ratingCount+=resourceOperation.score
                        ratingUser+=1
                    }
                }
                if(ratingUser && ratingCount){
                    ratingUserCount = ratingUser
                    def avg = ratingCount/ratingUser
                    averageRating=(Math.round(avg * 100) / 100).intValue()

                }
            }


        }
        averageRating
    }

}
