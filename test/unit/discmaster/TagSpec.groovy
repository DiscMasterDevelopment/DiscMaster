package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Tag)
class TagSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Creating a Tag"() {
        given: "creating Tag from valid parameters"
        def tag = new Tag(tag: 'awesomeness')

        expect: "validating object without a problem without any problem"
        tag.validate()
    }

    void "Creating an (invalid) empty Tag"() {
        given: "creating Tag with no parameters"
        def tag = new Tag()

        expect: "a failure while saving"
        !tag.validate()
    }
}
