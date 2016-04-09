package discmaster

class StoreController {

    def index() { }

    def catalog() {
        def productList = Product.list()
        [productList: productList]
    }
}
