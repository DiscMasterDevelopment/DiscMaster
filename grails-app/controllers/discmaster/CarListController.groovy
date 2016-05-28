
package discmaster
//@Transactional(readOnly = true)
class CarListController {

    //static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def show(){
        if(session.user) {
            // this is necessary because the hibernate session close itself really quickly, so we need to make a query again
            def carList = User.get(session.user.id).car // TODO: use sql join to improve querying times
            int totalWithoutDisccount = carList.productList.collect {p -> p.unitaryPrice * p.quantity}.sum(0)
            int totalToPay = carList.productList.collect {p -> p.unitaryPrice * p.quantity * p.discount}.sum(0)
            return [carList: carList, totalToPay: totalToPay, totalWithoutDisccount: totalWithoutDisccount]

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

        if(session.user) {
            CarList c = CarList.get(carListInstance.id)
            ProductQuantity pq = ProductQuantity.get(params.idToDelete)
            c.removeFromProductList(pq)
            pq.delete()
            c.save(flush: true)

            redirect action: "show"
        } else {
            redirect controller: "user", action: "register"
        }

        //request.withFormat {
        //    form multipartForm {
        //        flash.message = message(code: 'default.deleted.message', args: [message(code: 'CarList.label', default: 'CarList'), carListInstance.id])
        //        redirect action:"index", method:"GET"
        //    }
        //    '*'{ render status: NO_CONTENT }
        //}
    }

    def addProduct(Product p) {
        if(session.user) {
            def carList = User.get(session.user.id).car

            if(! carList.productList.find { it.product == p } ) {
                int n = params.quantity ? params.quantity.toInteger() : 1
                def pq = new ProductQuantity(product: p, quantity: n, unitaryPrice: p.price, discount: p.discount)

                carList.addToProductList(pq)
                pq.save()
                carList.save(flush: true)
            }

            redirect action: "show"
            
        } else {
            redirect controller: "user", action: "register"
        }
    }
}
