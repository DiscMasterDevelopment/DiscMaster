package discmaster

class Artist {

    String name
    String officialPage
    Description description
    Image image

    static hasMany = [
        products: Product,
        news: NewsArticle
    ]


    static constraints = {
        image             nullable: true
    }
}
