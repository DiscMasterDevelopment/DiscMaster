package discmaster

class Artist {

    String name
    String officialPage

    static hasOne = [description: Description]
    static hasMany = [product: Product,
    news: NewsArticle]


    static constraints = {

    }
}
