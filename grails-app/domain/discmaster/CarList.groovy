package discmaster

class CarList {

    String id
    int totalItems

    static belongsTo = [user: User]

    static constraints = {
        id nullable: false
    }
}
