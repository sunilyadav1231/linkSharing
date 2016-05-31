package com.ttnd.ls.entity

import org.codehaus.groovy.grails.orm.hibernate.cfg.IdentityEnumType

class Subscription {

    enum Seriousness{
        SERIOUS(1),VERY_SERIOUS(2),CASUAL(3)
        int seriousness
        Seriousness(int serious){
            this.seriousness=serious
        }
    }
    static constraints = {
        seriousness type: IdentityEnumType, nullable: false
        user nullable: false, unique: 'topic'
        topic nullable: false
    }

    static belongsTo = [ user : User,topic:Topic]

    Topic topic
    User user
    Date dateCreated
    Seriousness seriousness

}
