package discmaster

class Artist {

    String name
    String officialPage
    Description description

    static hasMany = [
        products: Product,
        news: NewsArticle
    ]


    static constraints = {

    }
}
