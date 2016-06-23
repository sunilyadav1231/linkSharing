import com.ttnd.ls.entity.User
import grails.util.Holders

class BootStrap {

    def init = { servletContext ->

        User user = new User(email: 'sunil.yadav@tothenew.com', userName:'sunilyadav1231', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil',lastName: 'Yadav  ',admin: true,active: true).save()
        new User(email: 'sunil.yadav1@tothenew.com', userName:'sunilyadav123', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil1',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav2@tothenew.com', userName:'sunilyadav192', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil2',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav3@tothenew.com', userName:'sunilyadav121', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil3',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav4@tothenew.com', userName:'sunilyadav119', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil4',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav5@tothenew.com', userName:'sunilyadav31', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil5',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav6@tothenew.com', userName:'sunilyadav2931', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil6',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav7@tothenew.com', userName:'sunilyadav191', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil7',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav8@tothenew.com', userName:'sunilyadav1', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil8',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav9@tothenew.com', userName:'sunilyadav1213', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil9',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav10@tothenew.com', userName:'sunilyadav7431', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil10',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav11@tothenew.com', userName:'sunilyadav1431', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil11',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav12@tothenew.com', userName:'sunilyadav1981', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil12',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav13@tothenew.com', userName:'sunilyadav741', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil13',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav14@tothenew.com', userName:'sunilyadav81431', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil14',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav15@tothenew.com', userName:'sunilyadav19331', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil15',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav16@tothenew.com', userName:'sunilyadav12231', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil16',lastName: 'Yadav  ',admin: false,active: false).save()
        new User(email: 'sunil.yadav17@tothenew.com', userName:'sunilyadav19311', password: 'Admin@123'.encodeAsSHA256(),firstName: 'Sunil17',lastName: 'Yadav  ',admin: false,active: false).save()



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
