package discmaster

class Product {

    String id
    String name
    float price
    int limitPerUser
    float discount
    int totalInStorage
    int totalInOrder

    static hasOne = [description: Description,
    rev: Review]

    static  hasMany = [tag: Tag]


    static constraints = {
        id nullable: false
        name nullable: false
    }
}
