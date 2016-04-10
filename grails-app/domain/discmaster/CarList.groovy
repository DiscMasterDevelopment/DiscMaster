package discmaster

class CarList {
    static hasMany = [productList: ProductQuantity]
    static belongsTo = [user: User]

    static constraints = {
    }
}
