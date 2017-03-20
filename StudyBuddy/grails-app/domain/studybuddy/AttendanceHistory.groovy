package studybuddy

import org.apache.commons.lang.builder.HashCodeBuilder

class AttendanceHistory implements Serializable {
    String attendanceId
    String date
    int attended

    boolean equals(other) {
        if (!(other instanceof AttendanceHistory)) {
            return false
        }

        other.attendanceId == attendanceId && other.date == date
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append attendanceId
        builder.append date
        builder.toHashCode()
    }

    static mapping = {

        id composite: ['attendanceId', 'date'], generator: 'assigned'
        version false
    }

}

