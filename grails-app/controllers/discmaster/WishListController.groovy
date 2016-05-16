package discmaster

//@Transactional(readOnly = true)
class WishListController {

    def show(){
        if(session.user) {
            // this is necessary because the hibernate session close itself really quickly, so we need to make a query again
            def u = User.get(session.user.id) // TODO: use sql join to improve querying times
            return [wishList: u.wishList]
        } else { // if there is no user logged, redirect to register
            redirect controller: "user", action: "register"
        }
    }

    def deleteProduct(Product prodToDelete) {

        if(session.user) {
            // getting wishList from user
            WishList wl = User.get(session.user.id).wishList
            // removing product from
            wl.removeFromProductList(prodToDelete)
            wl.save(flush: true)

            redirect action: "show"
        } else {
            redirect controller: "user", action: "register"
        }

    }

    def addProduct(Product p) {
        if(session.user) {
            def wishList = User.get(session.user.id).wishList

            // if the product isn't in wishList's productList then added, otherwise do nothing
            if(! wishList.productList.find { it == p } ) {
                wishList.addToProductList(p)
                wishList.save(flush: true)
            }

            redirect action: "show"
            
        } else {
            redirect controller: "user", action: "register"
        }
    }
}
