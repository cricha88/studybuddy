package studybuddy

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Calendar

class CalendarController {

    def index() {

        //Initialize a json builder for attendance history json object
        def courses = Courses.findAll()
        def courseList = []
        for (item in courses) {
            courseList << item.courseId
        }
        //Fetch attendance history for the user
        def attendanceIdLookup = AttendanceLookup.findAllWhere(username: session.username)
        //attendanceIdLookup = AttendanceLookup.findAllWhere(username: session.username)
        def dataz = new StringWriter()
        dataz << '['


        def courseComponents = UsersCourseComponents.findAllWhere(username: session.username)
        courseComponents.each() { courseComponent ->
            def course_name
            def course = Courses.findWhere(courseId: courseComponent.courseComponentId)
            course.each() {
                course_name = it.name
            }

            def dateTimes = CourseComponentDateTimes.findAllWhere(courseComponentId: courseComponent.courseComponentId)

            dateTimes.each() { dateTime ->


                def event_id = course_name.toString() + "_" + dateTime.dayOfWeek.toString()
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


            }
            dataz << ','
        }
        def jsonString = dataz.toString()
        jsonString = jsonString.substring(0, jsonString.length() - 1)
        jsonString = jsonString + "]"
        System.out.println(jsonString)
        render(view: 'calendarpage.gsp', model: [data: jsonString])
    }

    def showCalendar() {
        def courseList = UsersCourseComponents.findAll(user: session.username)
        //a list to store all the course ids of the current user
        List<String> idList = new ArrayList<>()
        for (UsersCourseComponents ucc : courseList) {
            def id = ucc.courseComponentId
            idList.add(id)
        }
        List<String> nameList = new ArrayList<>()
        List<String> startTime = new ArrayList<>()
        List<String> endTime = new ArrayList<>()
        List<String> dow = new ArrayList<>()
        for (String id : idList) {
            def timeinfo = CourseComponentDateTimes.findAll(courseComponentId: id)
            for (CourseComponentDateTimes day : timeinfo) {
                startTime.add(day.startTime)
                endTime.add(day.endTime)
                dow.add(day.dayOfWeek)
                def courseId = CourseComponents.find(courseComponentId: id).courseId
                def course = Courses.find(courseId: courseId).name
                nameList.add(course)
            }
        }
    }


    def addCourse(params) {

        def username = session.username
        def courseComponent
        def courseComponentId

        System.out.println("Entered addCourse successfully. username: " + username)


        if (username == null) {                                        //If user is signed in
            System.out.println("Username was not set")
            redirect(action: 'index')
        }

        def courseCode = params.courseCode           //Course code ie CS2212B
        def classType = params.class.type.toUpperCase().substring(0, 3)             //Lecture, Lab, or Tutorial
        def sectionCode = params.sectionCode                        //Section code ie 010, 001, 002
        courseComponent = CourseComponents.findWhere(courseId: courseCode, type: classType, sectionCode: sectionCode)
        if (courseComponent != null) {
            courseComponentId = courseComponent.courseComponentId
        }
        System.out.println("course code: " + courseCode + "\nclass type: " + classType + "\nsectionCode: " + sectionCode)
        System.out.println("courseComponentId: " + courseComponentId)


        def dateTimes = CourseComponentDateTimes.findAllWhere(courseComponentId: courseComponentId)
        dateTimes.each() { dt ->
            def dow = dt.dayOfWeek
            new AttendanceLookup(username: session.username, courseComponentId: courseComponentId, dayOfWeek: dow).save(flush: true)
            switch (dow) {
                case 1:
                    def earliest_date = "09-01-2017"
                    def latest_date = "03-04-2017"
                    break
                case 2:
                    def earliest_date = "10-01-2017"
                    def latest_date = "04-04-2017"
                    break
                case 3:
                    def earliest_date = "04-01-2017"
                    def latest_date = "29-03-2017"
                    break
                case 4:
                    def earliest_date = "05-01-2017"
                    def latest_date = "30-03-2017"
                    break
                case 5:
                    def earliest_date = "06-01-2017"
                    def latest_date = "31-03-2017"
                    break
                default:
                    break
            }
        }

        /*
        def courseComponent
        if(CourseComponents.list()!=null) {
            //Finds course component with the specified criteria
            courseComponent = CourseComponents.find {
                it.sectionCode().equals(sectionCode) && it.courseId().equals(courseCode) && it.type().equals(classType)
            }
        }*/
        def userCourseComponent
        if (courseComponentId != null) {
            userCourseComponent = new UsersCourseComponents(username: username, courseComponentId: courseComponentId)
            userCourseComponent.save(flush: true)
        }
        redirect(action: 'index')
    }

    def eventHistoryUpdate(id, weekStart, value) {
        def (courseComponentId, dayOfWeek) = id.tokenize( '_' )
        def username = session.username

        DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");

        Date date = new Date();
        String todate = dateFormat.format(date);

        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -7);
        Date todate1 = cal.getTime();
        String fromdate = dateFormat.format(todate1);
    }


}