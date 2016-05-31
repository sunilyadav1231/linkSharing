package com.ttnd.ls.entity

class ResourceOperation {

    static constraints = {
        score min: 1,max: 5
        resource unique: 'user',nullable: false
        user nullable: false
    }

    static belongsTo = [ user : User,resource:Resource]

    Resource resource
    User user
    Integer score
    Boolean isRead
}
