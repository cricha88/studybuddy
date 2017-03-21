package studybuddy

class CourseComponents {
    String courseComponentId
    String courseId
    String type
    String sectionCode

    static mapping = {
        id column: 'course_component_id', generator: 'assigned', name: 'courseComponentId'
        version false
    }

    static constraints = {
    courseId size:3..3
    type size:1..10
    }
}
