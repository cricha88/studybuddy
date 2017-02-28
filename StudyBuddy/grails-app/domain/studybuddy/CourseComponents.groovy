package studybuddy

class CourseComponents {
    Integer courseComponentId
    Integer courseId
    String type
    static constraints = {
    courseId size:3..3
    type size:1..10
    }
}
