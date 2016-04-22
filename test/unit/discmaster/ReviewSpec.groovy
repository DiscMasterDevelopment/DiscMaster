package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Review)
class ReviewSpec extends Specification {

    static Map<String, Object> fields = [
            rating: 5.0,
            description: "I couldn't really belive that somebody would be able to sell an almost state of the arte technology for only two cents!!!"
    ]

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

    void "Creating a Review"() {
        given: "creating Review from valid parameters"
        def review = new Review(fields)
        review.user = user

        expect: "validating object without a problem without any problem"
        review.validate()
    }

    void "Creating an (invalid) empty Review"() {
        given: "creating Review with no parameters"
        def review = new Review()
        review.user = user

        expect: "a failure while saving"
        !review.validate()
    }

    @Unroll
    void "Creating (invalid) Reviews without a field"() {
        given: "an Review object which doesn't have all the required fields"
        def review = new Review( TestHelpers.removeAField(fields, fieldToRemove) )
        review.user = user

        expect: "failure on validation"
        !review.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ["description"]
    }
}
