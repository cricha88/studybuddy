package studybuddy

import org.apache.commons.lang.builder.HashCodeBuilder

class CourseComponentInstructors implements Serializable{
    String courseComponentId
    String instructor

    boolean equals(other) {
        if (!(other instanceof CourseComponentInstructors)) {
            return false
        }

         other.courseComponentId == courseComponentId && other.instructor == instructor
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append courseComponentId
        builder.append instructor
        builder.toHashCode()
    }

    static mapping = {

        id composite: ['courseComponentId', 'instructor'], generator: 'assigned'
        version false
    }

}
