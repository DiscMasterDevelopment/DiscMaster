package discmaster

class CarList {
    int totalItems
    Product productList = []

    static belongsTo = [user: User]

    static constraints = {
    }
}
