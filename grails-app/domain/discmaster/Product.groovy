package discmaster

class Product {

    String name
    float price
    int limitPerUser
    float discount
    int totalInStorage
    Description description
    //int totalInOrder

    static hasMany = [tag: Tag]

    static constraints = {
        name nullable: false
        price min: 0.0F
        discount min: 0.0F, max: 1.0F // discount percentage
        totalInStorage min: 0
    }
}
