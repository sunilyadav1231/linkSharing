package com.ttnd.ls.entity

import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

class User {





    static hasMany = [topics:Topic,
                      subscriptions:Subscription,
                      resources:Resource,
                      resourceOperations:ResourceOperation ]

    static constraints = {
        email(unique: true,email: true,nullable: false,blank: false)
        userName(unique: true,nullable: false,blank: false)
        password(minSize: 5,nullable: false,blank: false)
        firstName (nullable: false,blank: false)
        lastName (nullable: false,blank: false)
        photoPath(nullable: true)
        active(nullable: true)
        admin(nullable: true)
        verificationToken(nullable: true)
        verificationExpiry(nullable: true)

    }

    String email
    String userName
    String password
    String firstName
    String lastName
    String verificationToken
    Date verificationExpiry
    Boolean admin
    Boolean active
    String photoPath
    Date dateCreated
    Date lastUpdated
}
