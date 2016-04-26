package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Description)
class DescriptionSpec extends Specification {

    static Map<String, Object> fields = [
            description: "A really realistic wordy word used in many restricted broad contexts",
            videoclip: "https://youtu.be/YesImAREALLURI",
            audioclip: "https://soundcloud.com/?isthisforrealz=YesImAREALLURI",
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating an Description"() {
        given: "creating Description from valid parameters"
        def description = new Description(fields)

        expect: "validating object without a problem without any problem"
        description.validate()
    }

    void "Creating an (invalid) empty Description"() {
        given: "creating Description with no parameters"
        def description = new Description()

        expect: "a failure while saving"
        !description.validate()
    }

    @Unroll
    void "Creating (invalid) Descriptions without a field"() {
        given: "an Description object which doesn't have all the required fields"
        def description = new Description( TestHelpers.removeAField(fields, fieldToRemove) )

        expect: "failure on validation"
        !description.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ['description']
    }
}
