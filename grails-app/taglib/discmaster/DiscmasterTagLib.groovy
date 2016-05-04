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

        if (p?.image) {
            defaultImg = resource(dir: "images", file: "get/${p?.image.id}")
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
            out << """<s>${price} COP</s> &nbsp;&nbsp;&nbsp; ${newPrice} COP - <b>${discount}</b>"""
        }
    }
}
