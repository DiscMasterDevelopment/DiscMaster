package discmaster

class Image {
    byte[] image
    String type

    static constraints = {
        image nullable: false, maxSize: 31457280 // 3MiB
        type  nullable: false
    }
}
