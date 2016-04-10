package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Address)
class AddressSpec extends Specification {

    def fields = [
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

    void "Creating a simple address"() {
        given: "valid parameters"
        def address = new Address(fields)

        expect: "creating class without any problem"
        address.validate()
    }

    void "Creating an invalid address"() {
        given: "an invalid address"
        def address = new Address()

        expect: "a failure while saving"
        !address.validate()
    }
}
