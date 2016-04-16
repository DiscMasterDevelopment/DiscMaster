package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserSpec extends Specification {

    static Map<String, Object> fields = [
            name: "john",
            phone: "123456789",
            realName: "John (Kyon) Smith",
            email: "anemail@candykingdom.ck",
            password: "123456789",
            age: 18,
            car: new CarList(),
            wishList: new WishList()
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating an User"() {
        given: "creating User from valid parameters"
        def user = new User(fields)

        expect: "validating object without a problem without any problem"
        user.validate()
    }

    void "Creating an (invalid) empty User"() {
        given: "creating User with no parameters"
        def user = new User()

        expect: "a failure while saving"
        !user.validate()
    }

    @Unroll
    void "Creating (invalid) Users without a field"() {
        given: "an User object which doesn't have all the required fields"
        def user = new User( TestHelpers.removeAField(fields, fieldToRemove) )

        expect: "failure on validation"
        !user.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ['name', 'phone', 'email', 'password', 'age', 'car', 'wishList']
    }
}
