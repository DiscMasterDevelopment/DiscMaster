package discmaster

class Administrator {

    String name
    String phone

    static constraints = {
        name nullable: false, matches: /DiscMaster_.+/, unique: true
        phone nullable: true
    }
}
