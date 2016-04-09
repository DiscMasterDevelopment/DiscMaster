package discmaster

class Review {

    float rating
    Description description

    static belongsTo = [artist: Artist]
    static constraints = {

    }
}
