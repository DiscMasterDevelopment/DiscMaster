package discmaster

class Address {

    String city
    String address
    Date lastTimeUsed
    String contactPhone
    String contactName
    int postalCode

    static constraints = {
        // Colombian postal codes: XXYYZZ (XX department, YY postal zones, ZZ postal districts)
        // Antioquia has the smallest XX number == 05
        postalCode min: 50000, max: 999999
    }
}
