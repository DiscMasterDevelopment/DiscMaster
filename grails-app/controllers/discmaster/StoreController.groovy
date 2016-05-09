package discmaster

import grails.util.Environment

class StoreController {

    def index() { }

    def catalog() {
        //def productList   = Product.list() // the whole list of products
        def newest        = Product.list(max: 4, sort: 'added', order: 'desc', readOnly: true)
        def promotions    = Product.list(max: 12, sort: 'discount', order: 'desc', readOnly: true)
        def cheapest      = Product.list(max: 3, sort: 'price', order: 'asc', readOnly: true)
        def lastInStorage = Product.list(max: 3, sort: 'totalInStorage', order: 'asc', readOnly: true)

        String orderByRandom = {
            if(Environment.current != Environment.PRODUCTION)
                " 1=1 order by rand()" // https://stackoverflow.com/a/26492424
            else
                " 1=1 order by random()" // postgresql rand function is called random()
        }()
        def randomItems   = Product.withCriteria {
                                sqlRestriction orderByRandom
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

    def search() {
        String toSearch = "%${params.string}%"
        
        def products = Product.withCriteria(max: 10, offset: 10) {
            // search on any name, description, or shortDescription the passed string
            or {
                ilike('name', toSearch)
                ilike('description', toSearch)
                ilike('shortDescription', toSearch)
            }

            // Search by artist if the field artist was filled
            if( params.artist ) {
                artist { ilike('name', "%${params.artist}%") }
            }

            // Sort by "price", "discount", "totalInStorage", "added"
            if ( params.sortBy?.matches("price|discount|totalInStorage|added") ) {
                // getting sorting direction "desc" or "asc"
                def dir = params.direction
                if (params.sortBy.equals("price")) dir = dir?.equals("desc") ? "desc" : "asc"
                else                               dir = dir?.equals("asc")  ? "asc"  : "desc"
                params.direction = dir

                order(params.sortBy, dir)
            }

            // Price ranges
            if ( params.minPrice ) ge("price", params.float("minPrice"))
            if ( params.maxPrice ) le("price", params.float("maxPrice"))

            // Search only products since "params.date"
            if ( params.since ) {
               ge("added", Date.parse("yyyy/MM/dd", params.since))
            }
        }
        [products: products]
    }
}
