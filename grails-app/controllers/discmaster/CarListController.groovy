
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

/*    def delete()
    {
        if(session.user)
        {
            try {

                def u = User.get(session.user.id)
                u.car.productList.remove(session)
            }
            catch (Exception e){
                render "go fuck yourself"
            }
        }
    }*/

    def deleteProduct(CarList carListInstance) {

        //def c = new  CarList(user: carListInstance)
        if (carListInstance == null) {
            render "go fuck yourself"
            return
        }

        carListInstance.productList.remove(params)
        //carListInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarList.label', default: 'CarList'), carListInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
}
