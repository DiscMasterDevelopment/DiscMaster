package discmaster

class NewsArticle {

    String title
    String shortDescription
    Date date
    String content

    static hasMany = [news: NewsArticle]

    static constraints = {
        title nullable: false
    }
}
