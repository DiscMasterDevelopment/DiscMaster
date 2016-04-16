package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ProductQuantity)
class ProductQuantitySpec extends Specification {

    static Map<String, Object> fields = [
            product: new Product(
                name: "Disc 1",
                description: new Description(description: "The best description"),
                price: 400,
                discount: 0,
                totalInStorage: 21,
                limitPerUser: 20,
                added: new Date() // current time
            ),
            quantity: 6,
            unitaryPrice: 400,
            discount: 0
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating a ProductQuantity"() {
        given: "creating ProductQuantity from valid parameters"
        def prodQuant = new ProductQuantity(fields)

        expect: "validating object without a problem without any problem"
        prodQuant.validate()
    }

    void "Creating an (invalid) empty ProductQuantity"() {
        given: "creating ProductQuantity with no parameters"
        def prodQuant = new ProductQuantity()

        expect: "a failure while saving"
        !prodQuant.validate()
    }

    @Unroll
    void "Creating (invalid) ProductQuantitys without a field"() {
        given: "an ProductQuantity object which doesn't have all the required fields"
        def prodQuant = new ProductQuantity( TestHelpers.removeAField(fields, fieldToRemove) )

        expect: "failure on validation"
        !prodQuant.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ['product', 'quantity']
    }
}
