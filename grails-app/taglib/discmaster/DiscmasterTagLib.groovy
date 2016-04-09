package discmaster

import discmaster.Image
import discmaster.Product
import discmaster.Description

class DiscmasterTagLib {
    static namespace = "discmaster"
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def productImg = { attr, body ->
        Product p = attr.product
        String defaultImg

        if (p.description?.image) {
        //    // Really ugly hack to create the src attribute for the image :S. It would be better if it was possible to create the src attribute from a controller, action and id attributes as with g:link
            defaultImg = resource(dir: "images", file: "get/${p.description.image.id}")
        } else {
            defaultImg = resource(dir: "images", file: "sin_imagen.png")
        }

        out << """<img src="${defaultImg}" """
        attr.remove("product")
        attr.each { attribute, value ->
            out << """${attribute}="${value}" """
        }
        out << ">"
    }
}
