package discmaster

class Administrator {

    String name
    String phone
    String password

    static constraints = {
        name nullable: false, matches: /DiscMaster_.+/, unique: true
        phone nullable: true
        password blank: false, nullable: false, size: 8..15, validator: {val, obj ->
            if (val?.equalsIgnoreCase(obj.name)){
                return false
            }
        }
    }
}
