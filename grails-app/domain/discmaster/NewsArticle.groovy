package discmaster

class NewsArticle {

    String title
    String shortDescription
    Date date
    String content

    static constraints = {
        title nullable: false, maxSize: 80
        shortDescription maxSize: 300
    }
}
