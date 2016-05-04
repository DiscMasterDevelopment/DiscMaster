package discmaster

class Product {

    String name
    float price
    float discount
    int totalInStorage
    int limitPerUser
    Date added
    String description
    String shortDescription
    String videoClip
    String audioClip
    Image image
    //int totalInOrder

    static hasMany = [tag: Tag]

    static constraints = {
        name nullable: false
        price min: 0.0F
        discount min: 0.0F, max: 1.0F // discount percentage
        totalInStorage min: 0
        limitPerUser nullable: true
        added nullable: false
        description nullable: false
        shortDescription nullable: false
        videoClip   nullable: true
        audioClip   nullable: true
        image       nullable: true
    }
}
