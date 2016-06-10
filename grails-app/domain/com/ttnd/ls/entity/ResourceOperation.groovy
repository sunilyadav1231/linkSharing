package com.ttnd.ls.entity

class ResourceOperation {

    static constraints = {
        score max: 5
        resource unique: 'user',nullable: false
        user nullable: false
    }

    static mapping = {
        resource lazy: false
        user lazy: false
    }

    static belongsTo = [ user : User,resource:Resource]

    Resource resource
    User user
    int score= -1
    Boolean isRead=false
}
