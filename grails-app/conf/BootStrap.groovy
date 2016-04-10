import discmaster.Image
import discmaster.User
import discmaster.Product
import discmaster.Description
import discmaster.Administrator
import grails.util.Environment


class BootStrap {

    def init = { servletContext ->
        if(Environment.current == Environment.DEVELOPMENT) {
            // Adding Products
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
                        added: new Date()
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
                        added: new Date()
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
                        added: new Date()
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
                        added: new Date()
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
                        added: new Date()
                    ]
                ],
            ]

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
                p.save()
            }
            
            // Adding users

            def user = new User(
                name: "john",
                phone: "123456789",
                realName: "John (Kyon) Smith",
                email: "anemail@candykingdom.ck",
                password: "123456789",
                age: 18
            )

            user.save(flush: true)

            //Adding admins
            def admin = new Administrator(
                name: "DiscMaster_Vengarl",
                phone: "311111111",
                password: "holiwis"
            )

            admin.save(flush: true)
        }
    }
    def destroy = {
    }
}
