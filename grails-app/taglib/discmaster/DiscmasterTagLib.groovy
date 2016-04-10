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

    def productPrice = { attr, body ->
        Product p = attr.product
        String priceFormat = "\$#,###,###0.##"
        String price = formatNumber(number: p.price, format: priceFormat)

        if (p.discount == 0) {
            out << price
        } else {
            String newPrice = formatNumber(number: p.price*(1-p.discount), format: priceFormat)
            String discount = formatNumber(number: p.discount, format: "%#0.##")
            out << """
                <s>${price}</s>
                <span style="float:right">
                    ${newPrice} - <b>${discount}</b>
                </span>
                """
        }
    }
}
