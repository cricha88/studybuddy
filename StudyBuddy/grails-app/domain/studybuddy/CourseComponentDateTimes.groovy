package studybuddy

class CourseComponentDateTimes {
    String courseComponentId
    String dayOfWeek
    String startTime
    String endTime

    static constraints = {
        id column: 'course_component_id', generator: 'assigned', name: 'courseComponentId'
        version false
    }
}
