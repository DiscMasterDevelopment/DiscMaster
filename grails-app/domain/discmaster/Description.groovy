package discmaster

class Description {

    String description
    String viceoClip
    String audioClip

    static belongsTo = [product: Product,
    review: Review, artist: Artist]

    static constraints = {
        description nullable: false
    }
}
