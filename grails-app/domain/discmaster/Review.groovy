package discmaster

class Review {

    String id
    float rating

    static hasOne = [description: Description]
    static constraints = {
        id nullable: false
    }
}
