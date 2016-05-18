package discmaster

class Product {

    String name
    float price
    float discount
    int totalInStorage
    Description description
    int limitPerUser
    Date added
    int calif



    static hasMany = [tag: Tag]

    static constraints = {
        name nullable: false
        price min: 0.0F
        discount min: 0.0F, max: 1.0F // discount percentage
        totalInStorage min: 0
        limitPerUser nullable: true
        added nullable: false


    }
}
