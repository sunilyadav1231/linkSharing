package com.ttnd.ls.enumConstant

/**
 * Created by ttnd on 2/6/16.
 */
enum Seriousness{
    SERIOUS(1),VERY_SERIOUS(2),CASUAL(3)
    int seriousness
    Seriousness(int serious){
        this.seriousness=serious
    }
}