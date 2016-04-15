import discmaster.CarList
import discmaster.Image
import discmaster.Tag
import discmaster.User
import discmaster.Product
import discmaster.ProductQuantity
import discmaster.Description
import discmaster.Administrator
import discmaster.WishList

import grails.util.Environment
import groovy.time.TimeCategory


class BootStrap {

    def init = { servletContext ->
        //if(Environment.current == Environment.DEVELOPMENT) {
        def udb = User.findByName("john")
        if(!udb) { // trying to detect if john user already exists or not. TODO: change this ad-hoc solution for something more robust like http://www.grails.org/plugin/database-migration
            // Defining Products' contents
            def products = [
                [
                    description: "The best description",
                    image: "grails-app/developmentData/ragethedevilstrikes.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        name: "Disc 1",
                        price: 400,
                        discount: 0,
                        totalInStorage: 21,
                        limitPerUser: 20,
                        added: new Date() // getting the current time
                    ]
                ],
                [
                    description: "The 2nd best description",
                    image: "grails-app/developmentData/thunderstone-apocalypse-again-portada-400x400.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        name: "Disc 42",
                        price: 350,
                        discount: 0.3,
                        totalInStorage: 21,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 1.second } // getting the current time and adding one second to it
                    ]
                ],
                [
                    description: "A good description",
                    product: [
                        name: "Disc 13",
                        price: 200,
                        discount: 0,
                        totalInStorage: 0,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 2.second }
                    ]
                ],
                [
                    description: "Description of a product",
                    product: [
                        name: "XXI Disc",
                        price: 10,
                        discount: 0.3,
                        totalInStorage: 20,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 3.second }
                    ]
                ],
                [
                    description: "Üsing this things üäë",
                    product: [
                        name: "Disc pi^2",
                        price: 27.2,
                        discount: 0.2,
                        totalInStorage: 20,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 4.second }
                    ]
                ],
            ]

            // creating Products with descriptions and images (optional)
            def pts = []
            products.each { pnd ->
                Description d
                if(pnd.image) { 
                    File imageFile = new File(pnd.image)
                    Image i = new Image(image: imageFile.bytes, type: pnd.imageType)
                    i.save()

                    d = new Description(description: pnd["description"], image: i)
                    d.save()
                } else {
                    d = new Description(description: pnd["description"])
                    d.save()
                }
                def p = new Product(pnd["product"] + [description: d])
                pts << p
                p.save()
            }
            
            // Adding users
            def u = new User(
                name: "john",
                phone: "123456789",
                realName: "John (Kyon) Smith",
                email: "anemail@candykingdom.ck",
                password: "123456789",
                age: 18
            )
            def carList = new CarList(
                user: u,
                productList: [
                    new ProductQuantity(product: pts[0], quantity: 3, unitaryPrice: pts[0].price, discount: pts[0].discount),
                    new ProductQuantity(product: pts[1], quantity: 1, unitaryPrice: pts[1].price, discount: pts[1].discount),
                    new ProductQuantity(product: pts[4], quantity: 1, unitaryPrice: pts[4].price, discount: pts[4].discount),
                ]
            )
            def wishList = new WishList(user: u)

            wishList.save()
            carList.save()
            u.save()

            //Adding admins
            def admin = new Administrator(
                name: "DiscMaster_Vengarl",
                phone: "311111111",
                password: "holiwish"
            )

            admin.save(flush: true)

            def t1 = new Tag(tag: "Comun")
            def t2 = new Tag(tag: "Poco Comun")
            def t3 = new Tag(tag: "Raro")
            def t4 = new Tag(tag: "Epico")
            def t5 = new Tag(tag: "Legendario")

            t1.save(flush:true)
            t2.save(flush:true)
            t3.save(flush:true)
            t4.save(flush:true)
            t5.save(flush:true)
        }
    }
    def destroy = {
    }
}
