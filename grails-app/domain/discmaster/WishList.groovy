package discmaster

class WishList {
    static hasMany = [productList: Product]
    static belongsTo = [user: User]

    static constraints = {
    }
}
