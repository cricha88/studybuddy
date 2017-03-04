package studybuddy

class CourseComponents {
    String courseComponentId
    String courseId
    String type
    String section

    static mapping = {
        id column: 'course_component_id', generator: 'assigned', name: 'courseComponentId'
        version false
    }

    static constraints = {
    courseId size:0..20
    type size:1..10
    }
}
