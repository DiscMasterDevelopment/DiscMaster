package discmaster

class Image {
    byte[] image
    String type

    static constraints = {
        image nullable: false, maxSize: 3145728 // 3MiB
        type  inList: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
    }
}
