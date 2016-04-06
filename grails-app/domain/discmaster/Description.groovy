package discmaster

class Description {

    String description
    byte[] viceoClip
    byte[] audioClip

    //static belongsTo = [
    //        product: Product,
    //        review: Review,
    //        artist: Artist
    //]

    static constraints = {
        description nullable: false
        viceoClip nullable: true, maxSize: 31457280 // 3MiB
        audioClip nullable: true
    }
}
