package discmaster

class Description {

    String description
    String videoClip
    String audioClip
    Image image

    //static belongsTo = [
    //        product: Product,
    //        review: Review,
    //        artist: Artist
    //]

    static constraints = {
        description nullable: false
        videoClip   nullable: true
        audioClip   nullable: true
        image       nullable: true
    }
}
