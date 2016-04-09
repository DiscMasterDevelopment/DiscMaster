package discmaster

class User {

    String name
    String phone
    String realName
    String email
    String password
    int    age
    static hasMany = [whishList: WishList,
    reviews: Review,
    order: PurchaseOrder]

    static hasOne = [car: CarList]

    static constraints = {
        email nullable: false, unique:true
        password blank: false, nullable: false, size: 8..15, validator: {val, obj ->
            if (val?.equalsIgnoreCase(obj.name)){
                return false
            }
        }
        age min: 18
        phone nullable: true
        realName nullable: true, unique:true
        whishList nullable: true
        reviews nullable: true
        order nullable: true
        car nullable: true
    }

}




