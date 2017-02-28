package studybuddy

class UsersCourseComponents {
    String username
    Integer courseComponentId
    static constraints = {
    username size:8..8
    courseComponentId size:1..10
    }
}
