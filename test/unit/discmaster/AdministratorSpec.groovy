package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Administrator)
class AdministratorSpec extends Specification {

    static Map<String, Object> fields = [
            name: "DiscMaster_root",
            phone: "3412321343",
            password: "aSecretPassword"
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating an Administrator"() {
        given: "creating Administrator from valid parameters"
        def admin = new Administrator(fields)

        expect: "validating object without a problem without any problem"
        admin.validate()
    }

    void "Creating an (invalid) empty Administrator"() {
        given: "creating Administrator with no parameters"
        def admin = new Administrator()

        expect: "a failure while saving"
        !admin.validate()
    }

    @Unroll
    void "Creating (invalid) Admins without a field"() {
        expect: "failure on validation"
        def admin = new Administrator( TestHelpers.removeAField(fields, fieldToRemove) )
        !admin.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ["name", "password"]
    }
}
