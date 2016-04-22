package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Artist)
class ArtistSpec extends Specification {

    static Map<String, Object> fields = [
            name: "The Bestest",
            officialPage: "http://thebestestofficial.com",
    ]

    def description

    def setup() {
        description = new Description(description: "THE BESTES are the BESTESTEST!")
    }

    def cleanup() {
    }

    void "Creating an Artist"() {
        given: "creating Artist from valid parameters"
        def artist = new Artist(fields)
        artist.description = description

        expect: "validating object without a problem without any problem"
        artist.validate()
    }

    void "Creating an (invalid) empty Artist"() {
        given: "creating Artist with no parameters"
        def artist = new Artist()

        expect: "a failure while saving"
        !artist.validate()
    }

    @Unroll
    void "Creating (invalid) Artists without a field"() {
        given: "an Artist object which doesn't have all the required fields"
        def artist = new Artist( TestHelpers.removeAField(fields, fieldToRemove) )
        artist.description = description

        expect: "failure on validation"
        !artist.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ['name', 'officialPage']
    }
}
