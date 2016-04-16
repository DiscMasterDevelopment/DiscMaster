package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(CarList)
class CarListSpec extends Specification {

    def user
    def setup() {
        user = new User(
                name: "john",
                phone: "123456789",
                realName: "John (Kyon) Smith",
                email: "anemail@candykingdom.ck",
                password: "123456789",
                age: 18
            )
    }

    def cleanup() {
    }

    void "Creating a CarList"() {
        given: "creating CarList from valid parameters"
        def car = new CarList(user: user, productList: [])

        expect: "validating object without a problem without any problem"
        car.validate()
    }

    void "Creating an (invalid) empty CarList"() {
        given: "creating CarList with no parameters"
        def car = new CarList()

        expect: "a failure while saving"
        !car.validate()
    }
}
