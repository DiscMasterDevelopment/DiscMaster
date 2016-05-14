package discmaster

import grails.util.Environment

class StoreController {

    def index() { }

    def catalog() {
        //def productList   = Product.list() // the whole list of products
        def newest = Product.withCriteria {
            gt('totalInStorage', 0) // with at least one exemplar in storage
            order('added', 'desc')
            maxResults(4)
        }

        def promotions = Product.withCriteria {
            gt('totalInStorage', 0) // with at least one exemplar in storage
            order('discount', 'desc')
            maxResults(12)
        }

        def cheapest = Product.withCriteria {
            gt('totalInStorage', 0) // with at least one exemplar in storage
            order('price', 'asc')
            maxResults(3)
        }

        def lastInStorage = Product.withCriteria {
            gt('totalInStorage', 0) // with at least one exemplar in storage
            order('totalInStorage', 'asc')
            maxResults(3)
        }

        def randomItems = Product.withCriteria {
            gt('totalInStorage', 0) // with at least one exemplar in storage

            // https://stackoverflow.com/a/26492424
            // postgresql rand function is called random()
            sqlRestriction(" 1=1 order by random()")
            maxResults(3)
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

            // Search by an specific tag
            if( params.tag ) {
                tag { like('tag', params.tag) }
            }
        }
        [products: products]
    }
}
