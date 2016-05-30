package com.ttnd.ls.entity

import org.codehaus.groovy.grails.orm.hibernate.cfg.IdentityEnumType

class Resource {

    enum ResourceType{
        LINK_RESOURCE(1),DOCUMENT_RESOURCE(2)
        int resourceType
        ResourceType(int rescType){
            this.resourceType=rescType
        }
    }

    static constraints = {
        resourceType(type:IdentityEnumType)
    }


    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    String resourcePath
    ResourceType resourceType

}
