package discmaster

class User {

    String name
    String phone
    String realNamne
    String email
    String password

    static hasMany = [whishList: WishList,
    review: Review,
    order: PurchaseOrder]

    static hasOne = [car: CarList]

    static constraints = {
        email nullable: true
        phone nullable: true
    }

}
