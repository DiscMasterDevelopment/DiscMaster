package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Address)
class AddressSpec extends Specification {

    static def fields = [
        city:    "Bogotá",
        address: "Fake Street 123",
        lastTimeUsed: new Date(),
        contactPhone: "34212345678",
        contactName: "John Smithiests",
        postalCode: 43523
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating a simple Address"() {
        given: "creating Address from valid parameters"
        def address = new Address(fields)

        expect: "validating object without a problem without any problem"
        address.validate()
    }

    void "Creating an (invalid) empty Address"() {
        given: "creating Address with no parameters"
        def address = new Address()

        expect: "a failure while saving"
        !address.validate()
    }

    @Unroll
    void "Creating (invalid) addresses without a field"() {
        expect: "failure on validation"
        def address = new Address( TestHelpers.removeAField(fields, fieldToRemove) )
        !address.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ["city", "address", "lastTimeUsed", "contactPhone", "contactName", "postalCode"]
    }
}
