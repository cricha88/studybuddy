package studybuddy

class CalendarController {

    def index() {
        //Initialize a json builder for attendance history json object
        def courses = Courses.findAll()
        def courseList = []
        for (item in courses) {
            courseList << item.courseId
        }
        //Fetch attendance history for the user
        def attendanceIdLookup = AttendanceLookup.findAllWhere(username: username)
        //attendanceIdLookup = AttendanceLookup.findAllWhere(username: session.username)
        def dataz = new StringWriter()
        dataz << '['


        def courseComponents = UsersCourseComponents.findAllWhere(username: session.username)
        System.out.println(courseComponents)
        courseComponents.each() { courseComponent ->
            def course_name
            System.out.println(courseComponent.courseComponentId)
            def courseComponentTemp = CourseComponents.findWhere(courseComponentId: courseComponent.courseComponentId)
            course_name = courseComponentTemp.courseId

            def dateTimes = CourseComponentDateTimes.findAllWhere(courseComponentId: courseComponent.courseComponentId)

            dateTimes.each() { dateTime ->
                System.out.println(dateTime.courseComponentId)

                def event_id = courseComponent.courseComponentId + "_" + dateTime.dayOfWeek.toString()
                System.out.println(event_id)
                def start_time = dateTime.startTime
                def end_time = dateTime.endTime
                def d_o_w = dateTime.dayOfWeek

                def builder = new groovy.json.JsonBuilder()
                builder {
                    id event_id
                    title course_name
                    start start_time
                    end end_time
                    dow d_o_w
                    ranges(
                            start: "2017-01-04",
                            end: "2017-05-04"
                    )
                }
                dataz << builder.toString()
                System.out.println(dataz)
                dataz << ','
            }

        }
        def jsonString = dataz.toString()
        jsonString = jsonString.substring(0, jsonString.length()-1)
        jsonString = jsonString+"]"
        System.out.println(jsonString)
        render (view: 'calendarpage.gsp', model: [data : jsonString, courses:courseList])
    }



    def addCourse(params){

        def username = session.username
        def courseComponent
        def courseComponentId

        System.out.println("Entered addCourse successfully. username: " + username)


        if (username==null){                                        //If user is signed in
            System.out.println("Username was not set")
            redirect(action: 'index')
        }

        def courseCode = params.courseCode           //Course code ie CS2212B
        def classType = params.class.type.toUpperCase().substring(0,3)             //Lecture, Lab, or Tutorial
        def sectionCode = params.sectionCode                        //Section code ie 010, 001, 002
        courseComponent = CourseComponents.findWhere(courseId: courseCode, type: classType, sectionCode: sectionCode)
        if(courseComponent!=null) {
            courseComponentId = courseComponent.courseComponentId
        }
        System.out.println("course code: "+courseCode+"\nclass type: "+classType+"\nsectionCode: "+sectionCode)
        System.out.println("courseComponentId: "+courseComponentId)
        /*
        def courseComponent
        if(CourseComponents.list()!=null) {
            //Finds course component with the specified criteria
            courseComponent = CourseComponents.find {
                it.sectionCode().equals(sectionCode) && it.courseId().equals(courseCode) && it.type().equals(classType)
            }
        }*/
        def userCourseComponent
        if (courseComponentId!=null){
            userCourseComponent = new UsersCourseComponents(username:username , courseComponentId: courseComponentId)
            userCourseComponent.save(flush: true)
        }
        if (username!=null) {
            redirect(action: 'index')
        }
    }


}
