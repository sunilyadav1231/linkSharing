package com.ttnd.ls.entity

import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

class User {

    byte[] photo

    static mapping = {
        columns {
            photo sqlType:'blob'
        }

    }


    String email
    String userName
    String password
    String firstName
    String lastName

    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
}
