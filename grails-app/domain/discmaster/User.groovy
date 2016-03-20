package discmaster

class User {

    String name
    String phone
    String realName
    String email
    String password

    static hasMany = [whishList: WishList,
    reviews: Review,
    order: PurchaseOrder]

    static hasOne = [car: CarList]

    static constraints = {
        email nullable: false
        password nullable: false
        phone nullable: true
        realName nullable: true
        whishList nullable: true
        reviews nullable: true
        order nullable: true
        car nullable: true
    }

}
