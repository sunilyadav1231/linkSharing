package com.ttnd.ls.dto

import com.ttnd.ls.entity.Topic
import com.ttnd.ls.entity.User
import com.ttnd.ls.enumConstant.Visibility

/**
 * Created by ttnd on 2/6/16.
 */
class TopicDto {

    Long id
    String name
    User createdBy
    Visibility visibility
}
