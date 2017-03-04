package studybuddy

class CourseComponentDateTimes {
    String courseComponentId
    String dayOfWeek
    Date startTime
    Date endTime

    static constraints = {
        id column: 'course_component_id', generator: 'assigned', name: 'courseComponentId'
        version false
    }
}