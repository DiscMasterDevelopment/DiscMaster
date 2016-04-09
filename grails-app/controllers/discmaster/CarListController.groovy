package discmaster


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarListController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def aCarList(){
        def CarListList = CarList.list()
        [CarListList: CarListList]
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CarList.list(params), model: [carListInstanceCount: CarList.count()]
    }

    def show(CarList carListInstance) {
        respond carListInstance
    }

    def create() {
        respond new CarList(params)
    }

    @Transactional
    def save(CarList carListInstance) {
        if (carListInstance == null) {
            notFound()
            return
        }

        if (carListInstance.hasErrors()) {
            respond carListInstance.errors, view: 'create'
            return
        }

        carListInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carList.label', default: 'CarList'), carListInstance.id])
                redirect carListInstance
            }
            '*' { respond carListInstance, [status: CREATED] }
        }
    }

    def edit(CarList carListInstance) {
        respond carListInstance
    }

    @Transactional
    def update(CarList carListInstance) {
        if (carListInstance == null) {
            notFound()
            return
        }

        if (carListInstance.hasErrors()) {
            respond carListInstance.errors, view: 'edit'
            return
        }

        carListInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CarList.label', default: 'CarList'), carListInstance.id])
                redirect carListInstance
            }
            '*' { respond carListInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CarList carListInstance) {

        if (carListInstance == null) {
            notFound()
            return
        }

        carListInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarList.label', default: 'CarList'), carListInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carList.label', default: 'CarList'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
