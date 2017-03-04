package studybuddy

class Courses {
    String courseId
    String name

    static mapping = {
        id column: 'course_id', generator: 'assigned', name: 'courseId'
        version false
    }

}
