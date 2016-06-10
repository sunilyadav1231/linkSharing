package com.ttnd.ls.entity

import com.ttnd.ls.enumConstant.Visibility
import org.codehaus.groovy.grails.orm.hibernate.cfg.IdentityEnumType

class Topic {

    static mapping = {
        sort name: 'asc'
        createdBy lazy: false
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
    Visibility visibility

}
