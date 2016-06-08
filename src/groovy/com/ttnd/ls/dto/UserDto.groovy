package com.ttnd.ls.dto

import com.ttnd.ls.entity.User
import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

/**
 * Created by ttnd on 1/6/16.
 */

@Validateable
class UserDto {

    static constraints = {
        importFrom User
        id(nullable: true)
        proflePicFile(maxFileSize:5000000, blank:false)
        //proflePicFile.size(size:0..5000000)  // to store files upto 5MB approx
    }
    /*static User.constrain*/
    BigInteger id
    String email
    String userName
    String password
    String cPassword
    String firstName
    String lastName
    Boolean admin
    Boolean active
    MultipartFile proflePicFile
    String photoPath
}
