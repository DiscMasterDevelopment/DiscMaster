package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(WishList)
class WishListSpec extends Specification {

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

    void "Creating a WishList"() {
        given: "creating WishList from valid parameters"
        def wish = new WishList(user: user, productList: [])

        expect: "validating object without a problem without any problem"
        wish.validate()
    }

    void "Creating an (invalid) empty WishList"() {
        given: "creating WishList with no parameters"
        def wish = new WishList()

        expect: "a failure while saving"
        !wish.validate()
    }
}
