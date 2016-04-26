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

            //Defining tags
            def t1 = new Tag(tag: "Común")
            def t2 = new Tag(tag: "Poco Común")
            def t3 = new Tag(tag: "Raro")
            def t4 = new Tag(tag: "Épico")
            def t5 = new Tag(tag: "Legendario")

            t1.save()
            t2.save()
            t3.save()
            t4.save()
            t5.save(flush:true)
            // NOTE: Flush only once, only in the last save

            // Defining Products' contents
            def products = [
                [
                    shortDescription: "The best description",
                    description: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                    image: "grails-app/developmentData/ragethedevilstrikes.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        name: "Disc 1",
                        price: 400,
                        discount: 0,
                        totalInStorage: 21,
                        limitPerUser: 20,
                        added: new Date(), // getting the current time
                        tag: t5
                    ]
                ],
                [
                    shortDescription: "The second best description",
                    description: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                    image: "grails-app/developmentData/thunderstone-apocalypse-again-portada-400x400.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        name: "Disc 42",
                        price: 350,
                        discount: 0.3,
                        totalInStorage: 21,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 1.second }, // getting the current time and adding one second to it
                        tag: t5
                    ]
                ],
                [
                    shortDescription: "insert description here",
                    description: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                    product: [
                        name: "Disc 13",
                        price: 200,
                        discount: 0,
                        totalInStorage: 0,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 2.second },
                        tag: t1
                    ]
                ],
                [
                    shortDescription: "Description...",
                    description: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                    product: [
                        name: "XXI Disc",
                        price: 10,
                        discount: 0.3,
                        totalInStorage: 20,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 3.second },
                        tag: t2
                    ]
                ],
                [
                    shortDescription: "This thing is used to...",
                    description: "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                    product: [
                        name: "Disc pi^2",
                        price: 27.2,
                        discount: 0.2,
                        totalInStorage: 20,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 4.second },
                        tag: t3
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

                    d = new Description(description: pnd["description"], shortDescription: pnd["shortDescription"], image: i)
                    d.save()
                } else {
                    d = new Description(description: pnd["description"], shortDescription: pnd["shortDescription"])
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

            admin.save()

        }
    }
    def destroy = {
    }
}
