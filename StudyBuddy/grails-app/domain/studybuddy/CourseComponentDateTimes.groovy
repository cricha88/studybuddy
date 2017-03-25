package studybuddy

import org.apache.commons.lang.builder.HashCodeBuilder

class CourseComponentDateTimes implements Serializable {
    String courseComponentId
    String dayOfWeek
    String startTime
    String endTime


    boolean equals(other) {
        if (!(other instanceof CourseComponentDateTimes)) {
            return false
        }

        other.courseComponentId == courseComponentId && other.dayOfWeek == dayOfWeek
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append courseComponentId
        builder.append dayOfWeek
        builder.append startTime
        builder.append endTime
        builder.toHashCode()
    }

    static mapping = {
        id composite: ['courseComponentId', 'dayOfWeek'], generator: 'assigned'
        version false
    }

}