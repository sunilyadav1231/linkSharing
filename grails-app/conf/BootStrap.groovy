import grails.util.Holders

class BootStrap {

    def init = { servletContext ->

        String profilePicPath = Holders.config.files.paths.profilePicDir
        String fileDocPath = Holders.config.files.paths.fileDocDir

        File profilePicDir = new File(profilePicPath as String)
        if (!profilePicDir.exists()) {
            profilePicDir.mkdirs()
            log.info "***********Creating Profile Pic Folders***********"
            log.info "$profilePicDir created! "
        }

        File fileDocDir = new File(fileDocPath as String)
        if (!fileDocDir.exists()) {
            fileDocDir.mkdirs()
            log.info "***********Creating Document Folders***********"
            log.info "$fileDocDir created! "
        }

    }
    def destroy = {
    }
}
