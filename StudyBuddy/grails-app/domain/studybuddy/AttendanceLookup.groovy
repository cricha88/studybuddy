package studybuddy

import org.apache.commons.lang.builder.HashCodeBuilder

class AttendanceLookup implements Serializable {
    String username
    String courseComponentId
    String dayOfWeek

    boolean equals(other) {
        if (!(other instanceof AttendanceLookup)) {
            return false
        }

        other.username == username && other.courseComponentId == courseComponentId && other.dayOfWeek == dayOfWeek
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append username
        builder.append courseComponentId
        builder.append dayOfWeek
        builder.toHashCode()
    }

    static mapping = {

        id composite: ['username', 'courseComponentId', 'dayOfWeek'], generator: 'assigned'
        version false
    }

}

