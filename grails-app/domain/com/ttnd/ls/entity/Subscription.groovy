package com.ttnd.ls.entity

import com.ttnd.ls.enumConstant.Seriousness
import org.codehaus.groovy.grails.orm.hibernate.cfg.IdentityEnumType

class Subscription {


    static constraints = {
        seriousness type: IdentityEnumType, nullable: false
        user nullable: false, unique: 'topic'
        topic nullable: false
    }


    static mapping = {
        topic lazy: false
        user lazy:false
    }

    static belongsTo = [ user : User,topic:Topic]

    Topic topic
    User user
    Date dateCreated
    Seriousness seriousness=Seriousness.SERIOUS

}
