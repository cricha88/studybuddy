package studybuddy

class Courses {
    Integer courseId
    String name
    static constraints = {
        courseId size:3..3
        name size:1..20
    }
}
