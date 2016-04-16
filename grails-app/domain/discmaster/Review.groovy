package discmaster

class Review {

    float rating
    String description

    static belongsTo = [user: User]
    static constraints = {
        description minSize: 80
    }
}
