package studybuddy


class CalendarController {

    def index() {
        //Initialize a json builder for attendance history json object
        //Fetch attendance history for the user
        def attendanceIdLookup = AttendanceLookup.findAllWhere(username: 'cgraha84')
        //attendanceIdLookup = AttendanceLookup.findAllWhere(username: session.username)
        System.out.println(attendanceIdLookup);
        def historyBuilder = new groovy.json.JsonBuilder()

        /*
        historyBuilder {
              history (attendanceIdLookup.collect { ail ->
                  //{
                      ccid:
                      ail.courseComponentId,
                      dow:
                      ail.dayOfWeek,
                      attendances:
                      AttendanceHistory.findAllWhere(attendanceId: "cgraha84" + "_" + ail.courseComponentId + "_" + ail.dayOfWeek).collect { attn ->
                         // [
                                  date    : attn.date,
                                  attended: attn.attended
                          //]
                      }
                 // }
            })
        }
        */


        /**
                def attHist = AttendanceHistory.findAllWhere(attendanceId: username + '_' + ccid + '_' + dow)
                attHist.collect {
                    def aDate = it.date.toString()
                    def attend = it.attended
                    dates {
                        d aDate
                        a attend
                    }
                }
                 */




        def builder = new groovy.json.JsonBuilder()
        builder {
            title "CS2209 Applied Logic for Computer Science"
            start "9:30"
            end "11:30"
            dow  "[2,3]"
            ranges(
                    start : "2017-01-04",
                    end : "2017-05-04"
            )
        }
        render (view: 'calendarpage.gsp', model: [data : builder.toString(), newdat :  historyBuilder.toString()])
    }
    /**
    def getCourses(params){
        def thisSubject = params.subject
        def courseCode = params.courseCode
        def courses
        courses = Courses.findAllWhere(subject: thisSubject)
        if (!courseCode.equals("")){
            //Courses.findAllWhere(courseId: courseCode)
        }



        def courseList = [] as LinkedList<String>
        for (Courses c in courses){
            courseList.add(c.name)
        }
        return [lsOut:courseList]
    } */

    def addCourse(params){

        def username
        def courseComponentId = "def not null"

        System.out.println("Entered addCourse successfully. username: " + session.username)

        def classType = params.class.type                            //Lecture, Lab, or Tutorial
        if (session.username!=null){                                //If user is signed in
            username = session.username         //gets current user username
        }
        else{ //temporary
            username = "Austin88"//User.get(new User(first:"Austin", last:"Abell") //CHANGE *************
        }
        def sectionCode = params.sectionCode                        //Section code ie 010, 001, 002
        def courseCode = params.courseCode                          //Course code ie CS2212

        def courseComponent
        /*
        if(CourseComponents.list()!=null) {
            //Finds course component with the specified criteria
            courseComponent = CourseComponents.find {
                it.sectionCode().equals(sectionCode) && it.courseId().equals(courseCode) && it.type().equals(classType)
            }
        }*/
        if (courseComponent!=null){
            courseComponentId = courseComponent.courseComponentId //Sets courseComponentId for user's course addition
        }
        else{
            //could not find course Component with specifications
        }
        def userCourseComponent = new UsersCourseComponents(username:username , courseComponentId: courseComponentId)
        System.out.println(userCourseComponent.username)
        System.out.println(userCourseComponent.courseComponentId)
        userCourseComponent.save(flush: true)
        redirect action: ''
    }


}
