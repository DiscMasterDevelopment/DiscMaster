import discmaster.CarList
import discmaster.Image
import discmaster.Tag
import discmaster.User
import discmaster.Product
import discmaster.ProductQuantity
import discmaster.Description
import discmaster.Administrator
import discmaster.WishList
import discmaster.Artist

import grails.util.Environment
import groovy.time.TimeCategory


class BootStrap {

    def init = { servletContext ->
        //if(Environment.current == Environment.DEVELOPMENT) {
        def udb = User.findByName("john")
        if(!udb) { // trying to detect if john user already exists or not. TODO: change this ad-hoc solution for something more robust like http://www.grails.org/plugin/database-migration

            // Defining Tags
            def tagsNames = ["Común", "Poco Común", "Raro", "Épico", "Legendario"]
            def tagList = []
            tagsNames.each {
                Tag t = new Tag(tag: it)
                t.save()
                tagList << t
            }

            String lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat velit ac nunc pharetra, at ultricies sem bibendum. Morbi facilisis diam nec massa semper tristique. Etiam sed hendrerit sem. Sed consequat libero eros. Integer sollicitudin ut massa eu euismod. Aenean nec odio leo. Etiam vel velit sit amet lectus facilisis eleifend. Pellentesque mattis augue ac mi feugiat, vitae gravida augue auctor.\nSuspendisse potenti. Nulla faucibus, ligula ut scelerisque malesuada, tortor elit accumsan est, sit amet laoreet eros turpis et nibh. Sed nulla est, facilisis at lacus sit amet, egestas tristique ligula. Pellentesque ipsum turpis, imperdiet vitae tortor nec, pulvinar varius magna. Vivamus laoreet turpis at lorem tristique, in tempor quam egestas. Donec viverra sed ex in sollicitudin. Integer eget bibendum risus. Curabitur arcu magna, rhoncus ac elit sed, porttitor gravida diam. Vivamus at hendrerit velit, suscipit mollis urna."
            // Defining Artists
            def artists = [
                [
                    image: "grails-app/developmentData/Sylosis-band.jpg",
                    imageType: 'image/jpeg',
                    artist: [name: "Sylosis", officialPage: "http://www.sylosis.com/"],
                    description: [description: "Formada en 2000 por Josh Middleton y Alex Bailey, Sylosis se levanta " +
                            "como la revelación del thrash moderno. Su estilo integra la velocidad del thrash, la " +
                            "brutalidad del death y algunos retoques vocales del metalcore. Una combinacion ganadora al " +
                            "momento de presentarse en tarima.", shortDescription: "La leyenda de Inglaterra"],
                ],
                [
                    artist: [name: "Artists 001", officialPage: "http://aweb-example-page.com"],
                    description: [description: lorem_ipsum, shortDescription: "short lorem ipsum en espalin"],
                ],
                [
                    artist: [name: "Artists 002", officialPage: "http://aweb-example-page.com"],
                    description: [description: lorem_ipsum, shortDescription: "short lorem ipsum en espalin"],
                ],
                [
                    artist: [name: "Artists 003", officialPage: "http://aweb-example-page.com"],
                    description: [description: lorem_ipsum, shortDescription: "short lorem ipsum en espalin"],
                ],
                [
                    artist: [name: "Artists 004", officialPage: "http://aweb-example-page.com"],
                    description: [description: lorem_ipsum, shortDescription: "short lorem ipsum en espalin"],
                ],
                [
                    artist: [name: "Artists 005", officialPage: "http://aweb-example-page.com"],
                    description: [description: lorem_ipsum, shortDescription: "short lorem ipsum en espalin"],
                ],
            ]

            def artistList = []
            artists.each { artist ->


                Description d = new Description(artist["description"])
                d.save()

                Artist ar = new Artist(artist["artist"] + ["description": d, product: [], news: []])
                if(artist.image) {
                    File imageFile = new File(artist.image)
                    Image im = new Image(image: imageFile.bytes, type: artist.imageType)
                    im.save(failOnError: true)
                    ar.image = im
                }

               // Artist a = new Artist(artist["artist"] + [description: d, product: [], news: []])
                ar.save(failOnError: true)
                //ar.save()

                artistList << ar
            }

            // Defining Products
            def products = [
                [
                    image: "grails-app/developmentData/Stabbing_The_Drama.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        shortDescription: "Soilwork llega desde Suecia.",
                        description: "Stabbing the Drama es el sexto álbum de Soilwork, el primer trabajo sin contar en su alineación al guitarrista Peter Wichers",
                        videoClip: "Z83vu-TRF6Y",
                        audioClip: "https://soundcloud.com/nuclearblastrecords/soilwork-stabbing-the-drama",
                        name: "Nightwish - Endless Forms Most Beautiful",
                        price: 420,
                        discount: 0.4,
                        totalInStorage: 60,
                        limitPerUser: 20,
                        added: new Date(), // getting the current time
                        tag: [tagList[1], tagList[4], tagList[3]]
                     ]
                ],
                [
                    image: "grails-app/developmentData/Endless_Forms_Most_Beautiful.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        shortDescription: "Nightwish llega desde Finlandia....",
                        description: "Endless Forms Most Beautiful es el octavo álbum de la banda finlandesa Nightwish",
                        videoClip: "VUb1p8fm7Ag",
                        audioClip: "https://soundcloud.com/nuclearblastrecords/nightwish-endless-forms-most-beautiful",
                        name: "Nightwish - Endless Forms Most Beautiful",
                        price: 450,
                        discount: 0,
                        totalInStorage: 100,
                        limitPerUser: 20,
                        added: new Date(), // getting the current time
                        tag: [tagList[2], tagList[0], tagList[3]]
                    ]
                ],
                [
                    image: "grails-app/developmentData/ragethedevilstrikes.jpg",
                    imageType: 'image/jpeg',
                    artist: artistList[0],
                    product: [
                        shortDescription: "Rage llega desde Alemania....",
                        description: "Formados hace 31 años en la ciudad alemana Herne, RAGE se bautizaron inicialmente como AVENGER, nombre con el que únicamente publicarían un LP, Prayers of Steel, además del EP Depraved to Black, y que no les convencería del todo.",
                        videoClip: "LzbMjGOjleM",
                        audioClip: "https://soundcloud.com/iuploadshitfortabletops/up-the-fucking-ass-tony-orr",
                        name: "Rage - The Devil Strikes Again",
                        price: 400,
                        discount: 0,
                        totalInStorage: 21,
                        limitPerUser: 20,
                        added: new Date(), // getting the current time
                        tag: [tagList[2], tagList[0], tagList[4]]
                    ]
                ],
                [
                    image: "grails-app/developmentData/thunderstone-apocalypse-again-portada-400x400.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        shortDescription: "Thunderstone regresa.",
                        description: "Thunderstone regresa tras un hiatus de casi 7 años tras su produccion Dirte Metal en 2009. Esta vez de la mano de su nuevo album Apocalyse Again, una pieza de power metal sin igual que encantra a los mas exigentes del genero",
                        videoClip: "_UXprCAsqTU",
                        audioClip: "https://soundcloud.com/nuclearblastrecords/rage-my-way",
                        name: "Thunderstone - Apocalypse Again",
                        price: 350,
                        discount: 0.3,
                        totalInStorage: 21,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 1.second }, // getting the current time and adding one second to it
                        tag: [tagList[4]]
                    ]
                ],
                [
                    image: "grails-app/developmentData/AmonAmarthJomsviking.jpg",
                    imageType: 'image/jpeg',

                    product: [
                        shortDescription: "Preparen sus hachas señores!!!",
                        description: "La leyenda del melodeath regresa con Jomsviking, una produccion epica de gran calidad y potencia.",
                        videoClip: "h6-krHfdmGg",
                        audioClip: "https://soundcloud.com/nuclearblastrecords/rage-my-way",
                        name: "Amon Amarth - Jomsviking",
                        price: 200,
                        discount: 0,
                        totalInStorage: 0,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 2.second },
                        tag: [tagList[0]]
                    ]
                ],
                [
                    image: "grails-app/developmentData/katatoniafallcdbigger.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        shortDescription: "La hora triste....",
                        description: "Katatonia, banda de Depressive Metal de Suecia, se presenta tras 20 años de carrera continuada con The Fall of Hearts, una propuesta oscura que pondra a prueba tus sentidos.",
                        videoClip: "bKjQduLxALM",
                        audioClip: "https://soundcloud.com/nuclearblastrecords/rage-my-way",
                        name: "Katatonia - The Fall of Hearts",
                        price: 10,
                        discount: 0.3,
                        totalInStorage: 20,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 3.second },
                        tag: [tagList[1]]
                    ]
                ],
                [
                    image: "grails-app/developmentData/DMOTSF.jpg",
                    imageType: 'image/jpeg',
                    product: [
                        shortDescription: "Pwwnn in ya face!!!",
                        description: "Sylosis, la revelacion del Thrash Metal ingles, ataca de nuevo con este contundente sencillo que pondra en extasis a cualquiera que se predisponga a disfrutar de este poderoso material, .... si se atrave.",
                        videoClip:  "SshPjukHAXM",
                        audioClip: "https://soundcloud.com/nuclearblastrecords/rage-my-way",
                        name: "Sylosis - Different Masks on the Same Face",
                        price: 27.2,
                        discount: 0.2,
                        totalInStorage: 20,
                        limitPerUser: 20,
                        added: use(TimeCategory) { new Date() + 4.second },
                        tag: [tagList[2], tagList[3]]
                    ]
                ],
            ]

            // creating Products with descriptions and images (optional)
            def pts = []
            def Product p
            products.each { pnd ->
                p = new Product(pnd["product"])
                if(pnd.image) { 
                    File imageFile = new File(pnd.image)
                    Image i = new Image(image: imageFile.bytes, type: pnd.imageType)
                    i.save()
                    p.image = i
                }
                if(pnd.artist) { 
                    p.artist = pnd.artist       // setting artist as the artist from the product
                    pnd.artist.addToProducts(p) // adding product to the list of products of the artist
                }
                pts << p
                p.save()
            }
            
            // Creating a User (John)
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

            def wishList = new WishList(user: u, productList: [pts[3], pts[2]])

            wishList.save()
            carList.save()
            u.save()

            // Creating and admin
            def admin = new Administrator(
                name: "DiscMaster_Vengarl",
                phone: "311111111",
                password: "holiwish"
            )

            admin.save(flush: true)

        }
    }
    def destroy = {
    }
}
