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


    static constraints = {
        visibility(type: IdentityEnumType)
    }

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    VisibilityEnum visibility

}
