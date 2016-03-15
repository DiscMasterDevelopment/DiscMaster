package discmaster

class NewsArticle {

    String id
    String title
    String shortDescription
    Date date
    String content

    static hasMany = [news: NewsArticle]

    static constraints = {
        id nullable: false
        title nullable: false
    }
}
