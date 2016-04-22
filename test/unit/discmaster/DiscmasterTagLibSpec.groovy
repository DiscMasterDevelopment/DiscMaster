package discmaster

import grails.test.mixin.TestFor
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(DiscmasterTagLib)
class DiscmasterTagLibSpec extends Specification {

    Product product
    Product productWithImage
    Image i
    def setup() {
        Description d = new Description(description: "The best description")
        product = new Product(
                name: "Disc 1",
                description: d,
                price: 400,
                discount: 0,
                totalInStorage: 21,
                limitPerUser: 20,
                added: new Date() // current time
        )

        File imageFile = new File("grails-app/developmentData/ragethedevilstrikes.jpg")
        i = new Image(image: imageFile.bytes, type: 'image/jpeg')
        Description d2 = new Description(description: "The best description", image: i)
        productWithImage = new Product(
                name: "Disc 1",
                description: d2,
                price: 120,
                discount: 0.4,
                totalInStorage: 32,
                limitPerUser: 20,
                added: new Date() // current time
        )
    }

    def cleanup() {
    }

    void "test productImg tag with a product"() {
        expect:
        (
                applyTemplate('<discmaster:productImg product="${product}" />', [product: product])
            ==
                '<img src="/images/sin_imagen.png" >'
        )

    }

    void "test productImg tag without any product"() {
        expect:
        (
                applyTemplate('<discmaster:productImg />', [product: product])
            ==
                '<img src="/images/sin_imagen.png" >'
        )

    }

    void "test productImg tag with a product which has a description with an image"() {
        expect:
        (
                applyTemplate('<discmaster:productImg product="${product}" />', [product: productWithImage])
            ==
                new String("""<img src="/images/get/${i.id}" >""")
        )
    }

    void "test productPrice tag with no product"() {
        when: "A faulty tag call"
        applyTemplate('<discmaster:productPrice />')

        then: "an exception is thrown"
        thrown GrailsTagException
    }

    void "test productPrice tag with a product"() {
        expect:
        // Product without disccount
        '$400' == applyTemplate('<discmaster:productPrice product="${product}" />', [product: product])

        // Product with a disccount
        (
        new String("""
                <s>\$120</s>
                <span style="float:right">
                    \$72 - <b>%40</b>
                </span>
                """)
        == applyTemplate('<discmaster:productPrice product="${product}" />', [product: productWithImage])
        )
    }
}
