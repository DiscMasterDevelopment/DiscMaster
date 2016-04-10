package discmaster

class CarList {
    static hasMany = [productList: Product]
    static belongsTo = [user: User]

    static constraints = {
    }
}
