package filters

class LoginFilters {

    def filters = {
        allExcept(controller:'login',invert:true) {
            before = {
                if(!session.userData){
                    redirect(controller: 'login', action: 'index')
                    return false
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
