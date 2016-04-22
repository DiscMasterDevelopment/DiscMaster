package discmaster

class PurchaseOrder {

    float paidPrice
    float totalPrice
    int totalItems
    String status
    Date orderDate
    Date shippedDate

    static hasMany = [products: ProductQuantity]

    static constraints = {
        status inList: ['inConfirmation', 'paid', 'packaging', 'sent', 'received']
    }
}
