package discmaster



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [login: "POST", create: "POST", save: "POST", update: "PUT", delete: "DELETE"]

    def login() {
        def u = User.findByName(params.name)
        if(u?.password == params.password) {
            session.user = u
        }
        redirect uri: "/" // TODO: do not redirect to main, return to page from which was called
    }

    def logout() {
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

    def register() {}

    def create() {
        def u = new User()
        def c = new CarList(totalItems: 0 , user: u)
        u.properties['name', 'phone', 'realName', 'email', 'password'] = params
        u.car = c
        if(u.password != params.confirm) {
            u.errors.rejectValue("password", "user.password.dontmatch")
            //render "error passwords dont match" // Lanzar excepcion
            return [user:u] // doesn't work, the book is outdated :S
        } else
        if(u.save(failOnError: true)) {
            c.save(failOnError: true)
            session.user = u
            redirect uri: "/"
        } else {
            return [user:u] // Lanzar excepción
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
