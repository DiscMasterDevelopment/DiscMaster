package discmaster

class Tag {

    String tag
    static constraints = {
        tag unique: true
    }
}
