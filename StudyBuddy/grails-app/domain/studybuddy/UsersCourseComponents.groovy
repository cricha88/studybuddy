package studybuddy

import org.apache.commons.lang.builder.HashCodeBuilder

class UsersCourseComponents implements Serializable {
    String username
    String courseComponentId

    boolean equals(other) {
        if (!(other instanceof UsersCourseComponents)) {
            return false
        }

        other.username == username && other.courseComponentId == courseComponentId
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append username
        builder.append courseComponentId
        builder.toHashCode()
    }

    static mapping = {

        id composite: ['username', 'courseComponentId'], generator: 'assigned'
        version false
    }

}
