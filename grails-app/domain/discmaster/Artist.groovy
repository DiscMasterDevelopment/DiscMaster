package discmaster

class Artist {

    String name
    String officialPage
    Description description

    static hasMany = [
        product: Product,
        news: NewsArticle
    ]


    static constraints = {

    }
}
