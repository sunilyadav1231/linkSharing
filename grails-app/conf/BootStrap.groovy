import com.ttnd.ls.entity.User
import grails.util.Holders

class BootStrap {

    def init = { servletContext ->

        User user = new User(email: 'sunil.yadav@tothenew.com', username: 'sunilyadav1231', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil',lastName: 'Yadav  ',admin: true,active: true).save()

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
