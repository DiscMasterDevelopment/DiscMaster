package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Image)
class ImageSpec extends Specification {

    static Map<String, Object> fields = [
            type: 'image/jpeg',
            image: "SSdtIG5vdCByZWFsbHkgYW4gaW1hZ2UsIGJ1dCB3aGF0ZXZlciBYRAo=".decodeBase64()
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating an Image"() {
        given: "creating Image from valid parameters"
        def image = new Image(fields)

        expect: "validating object without a problem without any problem"
        image.validate()
    }

    void "Creating an (invalid) empty Image"() {
        given: "creating Image with no parameters"
        def image = new Image()

        expect: "a failure while saving"
        !image.validate()
    }

    @Unroll
    void "Creating (invalid) Images without a field"() {
        given: "an Image object which doesn't have all the required fields"
        def image = new Image( TestHelpers.removeAField(fields, fieldToRemove) )

        expect: "failure on validation"
        !image.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ['image', 'type']
    }

    void "If the type is wrong it shouldn't be allowed to be saved"() {
        given: "an image with an invalid type"
        def image = new Image(type: 'faultyType', image: (byte[]) fields.image)

        expect: "the image isn't validated"
        !image.validate()
    }

    void "If the image's size is bigger than 3MiB it shouldn't be allowed to be saved"() {
        given: "an image with an size type"
        def image = new Image(type: 'image/jpeg', image: new byte[5000000])

        expect: "the image isn't validated"
        !image.validate()
    }
}
