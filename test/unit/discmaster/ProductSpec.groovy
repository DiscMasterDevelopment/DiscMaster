package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Product)
class ProductSpec extends Specification {

    static Map<String, Object> fields = [
            name: "Disc 1",
            price: 400,
            discount: 0,
            totalInStorage: 21,
            description: new Description(description: "The best description"),
            limitPerUser: 20,
            added: new Date() // current time
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating a Product"() {
        given: "creating Product from valid parameters"
        def product = new Product(fields)

        expect: "validating object without a problem without any problem"
        product.validate()
    }

    void "Creating an (invalid) empty Product"() {
        given: "creating Product with no parameters"
        def product = new Product()

        expect: "a failure while saving"
        !product.validate()
    }

    @Unroll
    void "Creating (invalid) Products without a field"() {
        given: "an Product object which doesn't have all the required fields"
        def product = new Product( TestHelpers.removeAField(fields, fieldToRemove) )

        expect: "failure on validation"
        !product.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ["name", "description", "added"]
    }
}
