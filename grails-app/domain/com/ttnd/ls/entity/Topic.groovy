package com.ttnd.ls.entity

import org.codehaus.groovy.grails.orm.hibernate.cfg.IdentityEnumType

class Topic {

    enum VisibilityEnum {
        PUBLIC(1),PRIVATE(2)

        int visiblity
        VisibilityEnum(int visible){
            this.visiblity=visible
        }
    }

    static hasMany = [
                      subscriptions:Subscription,
                      resources:Resource,
                      ]
    static belongsTo = [ createdBy : User]

    static constraints = {
        visibility type: IdentityEnumType
        name unique: 'createdBy',nullable: false,blank: false
        visibility nullable: false,blank: false
        createdBy nullable: false
    }

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    VisibilityEnum visibility

}
