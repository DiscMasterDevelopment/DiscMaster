package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(PurchaseOrder)
class PurchaseOrderSpec extends Specification {

    static Map<String, Object> fields = [
            paidPrice: 472,
            totalPrice: 472,
            totalItems: 2,
            status: 'received',
            orderDate: new Date("12/12/2015"),
            shippedDate: new Date("24/12/2015"),
            products: [
                    new ProductQuantity(
                            product: new Product(
                                    name: "Disc 1",
                                    description: new Description(description: "The best description"),
                                    price: 400,
                                    discount: 0.6,
                                    totalInStorage: 21,
                                    limitPerUser: 20,
                                    added: new Date() - 20
                            ),
                            quantity: 1,
                            unitaryPrice: 400,
                            discount: 0
                    ),
                    new ProductQuantity(
                            product: new Product(
                                    name: "Disc 1",
                                    description: new Description(description: "Is this even real, what is real? - What do you mean by real, ohhh"),
                                    price: 150,
                                    discount: 0.2,
                                    totalInStorage: 32,
                                    limitPerUser: 20,
                                    added: new Date() - 30 // current time
                            ),
                            quantity: 1,
                            unitaryPrice: 120,
                            discount: 0.4
                    )
            ]
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating an PurchaseOrder"() {
        given: "creating PurchaseOrder from valid parameters"
        def purchase = new PurchaseOrder(fields)

        expect: "validating object without a problem without any problem"
        purchase.validate()
    }

    void "Creating an (invalid) empty PurchaseOrder"() {
        given: "creating PurchaseOrder with no parameters"
        def purchase = new PurchaseOrder()

        expect: "a failure while saving"
        !purchase.validate()
    }

    @Unroll
    void "Creating (invalid) PurchaseOrders without a field"() {
        given: "an PurchaseOrder object which doesn't have all the required fields"
        def purchase = new PurchaseOrder( TestHelpers.removeAField(fields, fieldToRemove) )

        expect: "failure on validation"
        !purchase.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ["status", "orderDate", "shippedDate"]
    }
}
