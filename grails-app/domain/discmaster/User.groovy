package discmaster

class User {

    String name
    String phone
    String realName
    String email
    String password
    int    age
    CarList  car
    WishList wishList

    static hasMany = [
        reviews: Review,
        order:   PurchaseOrder
    ]

    static constraints = {
        name  size: 3..20, unique: true
        email email: true
        password size: 8..15, validator: {val, obj ->
            if (val?.equalsIgnoreCase(obj.name)){
                return false
            }
        }
        age       min: 18
        phone     blank: true, matches: /[0-9+ ]+/
        realName  nullable: true
        reviews   nullable: true
        order     nullable: true

        car       nullable: false
        wishList  nullable: false
    }

}




