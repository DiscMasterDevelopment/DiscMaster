package discmaster

class ProductQuantity {
    Product product
    int quantity
    float unitaryPrice // price paid without discount
    float discount     // discount applied when ordering

    static constraints = {
        quantity     min: 1
        unitaryPrice min: 0.0F
        discount     min: 0.0F, max: 1.0F
    }
}
