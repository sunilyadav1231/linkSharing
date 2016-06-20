package com.ttnd.ls.entity

import spock.util.mop.Use

import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

class User {

    static mapping = {
        sort id: 'desc'
    }


    static hasMany = [topics:Topic,
                      subscriptions:Subscription,
                      resources:Resource,
                      resourceOperations:ResourceOperation ]

    static constraints = {
        email(unique: true,email: true,nullable: false,blank: false)
        userName(unique: true,nullable: false,blank: false)
        /*password(minSize: 5,nullable: false,blank: false)*/
        firstName (nullable: false,blank: false)
        lastName (nullable: false,blank: false)
        photoPath(nullable: true,blank: true)
        active(nullable: true)
        admin(nullable: true)
        verificationToken(nullable: true)
        verificationExpiry(nullable: true)

    }

    User(Long id){
        this.id=id
    }

    String getFullName() {
        return "$firstName $lastName"
    }

    String email
    String userName
    String password
    String firstName
    String lastName
    transient  String fullName
    String verificationToken
    Date verificationExpiry
    Boolean admin=false
    Boolean active=false
    String photoPath
    Date dateCreated
    Date lastUpdated
}
