package com.ttnd.ls.entity

import org.codehaus.groovy.grails.orm.hibernate.cfg.IdentityEnumType

class Resource {

    static hasMany = [
                      resourceOperations:ResourceOperation
    ]

    static constraints = {
        documentResourceUrl nullable: true
        linkResourceUrl nullable: true
    }

    static belongsTo = [ createdBy : User,topic:Topic]


    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    String documentResourceUrl
    String linkResourceUrl
    float averageRating

}
