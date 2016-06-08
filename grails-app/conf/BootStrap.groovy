import grails.util.Holders

class BootStrap {

    def init = { servletContext ->

        String profilePicPath = Holders.config.files.paths.profilePicDir
        File profilePicDir = new File(profilePicPath as String)
        if (!profilePicDir.exists()) {
            profilePicDir.mkdirs()
            log.info "***********Creating Folders***********"
            log.info "$profilePicDir created! "
        }

    }
    def destroy = {
    }
}
