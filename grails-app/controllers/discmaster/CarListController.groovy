package discmaster


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
class CarListController {

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def aCarList(){
        if(session.user) {
            // this is necessary because the hibernate session close itself really quickly, so we need to make a query again
            def u = User.get(session.user.id) // TODO: use sql join to improve querying times
            return [carList: u.car]
        } else { // if there is no user logged, redirect to register
            redirect controller: "user", action: "register"
        }
    }
}
