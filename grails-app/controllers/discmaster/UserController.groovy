package discmaster
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.facebooksdk.FacebookContext
import grails.plugin.facebooksdk.FacebookGraphClient
import com.restfb.exception.FacebookOAuthException

//@Transactional(readOnly = true) // getting problems with postgresql TODO: search how to use this library
class UserController {

    FacebookContext facebookContext
    //static defaultAction = 'register'

    static allowedMethods = [login: "POST", create: "POST", save: "POST", update: "PUT", delete: "DELETE"]

    def login() {
        if( params.name ==~ /DiscMaster_.+/) {
            def admin = Administrator.findByName(params.name)
            if (admin?.password == params.password) {
                session.admin = admin
            }
        }else {
            def u = User.findByName(params.name)
            if (u?.password == params.password) {
                session.user = u
            }
        }
        redirect uri: "/" // TODO: do not redirect to main, return to page from which was called
    }

    def logout() {
        session.admin = null
        session.user = null
        redirect uri: "/"
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def register() {
        def user
        List permissions = []
        List userFriends = []
        if (facebookContext.authenticated) {
            String token = facebookContext.user.token
            if (token) {
                FacebookGraphClient facebookGraphClient = new FacebookGraphClient(token)
                try {
                    user = facebookGraphClient.fetchObject(facebookContext.user.id.toString())
                    permissions = facebookGraphClient.fetchConnection("${facebookContext.user.id}/permissions")
                    if (permissions.find { it.permission == 'user_friends' && it.permission == 'granted' } ) {
                        userFriends = facebookGraphClient.fetchConnection("${facebookContext.user.id}/friends", [limit:10])
                    }
                } catch (FacebookOAuthException exception) {
                    facebookContext.user.invalidate()
                }
            }
        }

        [
                facebookContext: facebookContext,
                permissions: permissions,
                user: user,
                userFriends: userFriends
        ]
    }

    def profile() {
        if(!session?.user)
            redirect action: "register"
    }
    def create() {
        def u = new User()
        def c = new CarList(user: u)
        def w = new WishList(user: u)
        u.properties['name', 'phone', 'realName', 'email', 'password', 'age'] = params
        u.car = c
        u.wishList = w
        if(u.password != params.confirm) {
            u.errors.rejectValue("password", "user.password.dontmatch")
            //render "error passwords dont match" // Lanzar excepcion
            return [user:u] // doesn't work, the book is outdated :S
        } else
        if(u.save(failOnError: true)) {
            c.save(failOnError: true)
            w.save(failOnError: true)
            session.user = u
            redirect uri: "/"
        } else {
            render u.errors
        }
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
