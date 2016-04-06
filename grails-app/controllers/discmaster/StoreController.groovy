package discmaster

class StoreController {

    def index() { }

    def catalog() {
        def productList = Product.list()
        def model = [productList: productList]

        respond productList, model: model
    }
}
