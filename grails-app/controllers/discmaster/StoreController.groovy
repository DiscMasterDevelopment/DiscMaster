package discmaster

class StoreController {

    def index() { }

    def catalog() {
        //def productList   = Product.list() // the whole list of products
        def newest        = Product.list(max: 4, sort: 'added', order: 'desc', readOnly: true)
        def promotions    = Product.list(max: 12, sort: 'discount', order: 'desc', readOnly: true)
        def cheapest      = Product.list(max: 3, sort: 'price', order: 'asc', readOnly: true)
        def lastInStorage = Product.list(max: 3, sort: 'totalInStorage', order: 'asc', readOnly: true)
        def randomItems   = Product.withCriteria {
                                sqlRestriction " 1=1 order by rand()" // https://stackoverflow.com/a/26492424
                                maxResults 3
                            }

        [
            //productList:   productList,
            newest:        newest,
            promotions:    promotions,
            cheapest:      cheapest,
            lastInStorage: lastInStorage,
            randomItems:   randomItems,
        ]
    }
}
