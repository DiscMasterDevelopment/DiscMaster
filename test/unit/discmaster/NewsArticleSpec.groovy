package discmaster

import grails.test.mixin.TestFor
import spock.lang.Specification
import spock.lang.Unroll

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(NewsArticle)
class NewsArticleSpec extends Specification {

    static Map<String, Object> fields = [
            title: "The most boring Title ever ...",
            shortDescription: "A very very very...",
            content: 'A very very very very "long" description: The most boring Title never was produced just for the fun of seen people reading at it while drinking a non-alcoholic beverage from andromeda centaury in the region know for hitchhikers as the least pleasant place to be in the entire universe',
            date: new Date()
    ]

    def setup() {
    }

    def cleanup() {
    }

    void "Creating a NewsArticle"() {
        given: "creating NewsArticle from valid parameters"
        def news = new NewsArticle(fields)

        expect: "validating object without a problem without any problem"
        news.validate()
    }

    void "Creating an (invalid) empty NewsArticle"() {
        given: "creating NewsArticle with no parameters"
        def news = new NewsArticle()

        expect: "a failure while saving"
        !news.validate()
    }

    @Unroll
    void "Creating (invalid) NewsArticles without a field"() {
        given: "an NewsArticle object which doesn't have all the required fields"
        def news = new NewsArticle( TestHelpers.removeAField(fields, fieldToRemove) )

        expect: "failure on validation"
        !news.validate()

        where: "each field to be removed is passed one at the time"
        fieldToRemove << ['title', 'shortDescription', 'date', 'content']
    }
}
