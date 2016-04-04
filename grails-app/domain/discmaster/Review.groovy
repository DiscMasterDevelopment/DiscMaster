package discmaster

class Review {

    float rating

    static hasOne = [description: Description]
    static belongsTo = [artist: Artist]
    static constraints = {
        id nullable: false
    }
}
