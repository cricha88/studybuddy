package studdybuddy

import java.util.Date;

class CourseComponentDateTimes {
    int id
    Date dateAndTime

    static mapping = {
        id column: 'course_component_id', generator: 'assigned'
        version false
    }

    static constraints = {
    }
}
