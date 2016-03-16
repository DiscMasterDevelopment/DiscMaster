package discmaster

class Review {

    String id
    float rating

    static hasOne = [description: Description]
    static belongsTo = [artist: Artist]
    static constraints = {
        id nullable: false
    }
}
