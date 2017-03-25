package studybuddy

import grails.rest.RestfulController

class FriendController extends RestfulController {
    static responseFormats = ['json', 'xml']

    FriendController(){
        super(User);
    }
    def index() {
        render (view: 'Friend.gsp')
    }

//    def searchByName(){
//        def uname = params.userName
//        def account = User.find{username == uname}
//        if(account){
//            response.status=200
//            respond account
//
//        }
//        else{
//            flash.message="User not found."
//            response.status=404
//            redirect(action:"searchByName")
//
//        }
//
//    }
//
//    def searchByEmail(){
//        def mail = params.email
//        def account = User.find{email==mail}
//        if(account){
//            response.status=200
//            respond account
//
//        }
//        else{
//            flash.message="User not found."
//            redirect(action:"searchByEmail")
//
//        }
//    }
    def addUser(){
        def UserList=User.findAll()
        respond UserList,[formats:['json']]

    }

    def sendFriendRequest(){
        def sender=session.username
        def receiver=request.JSON.username
        if(!receiver){
            System.out.println("asdjfkhaglksdf")
        }
        if(sender&&receiver){
            def fr=new FriendRequest(requester:sender,requested: receiver)
            fr.save(flush:true)
            flash.message="Request sent."
        }
        else{
            flash.message="User doesn't exist."
        }


    }

    def showFriendRequest(){
        def r=session.username
        def friendRequestList=FriendRequest.findAll(receiver:r)
        respond friendRequestList
    }

    def confirmFriendRequest(){
        def r=session.username
        def s=request.JSON.username

        def fs=new Friend(friend1: r,friend2:s)
        fs.save(flush:true)

        flash.massage= s "is now your friend"
    }

    def showFriend(){
        def r=session.username
        def a=Friend.findAll(friend1:r)
        respond a,[formats:['json']]
    }

    def showcalendar() {
        //Initialize a json builder for attendance history json object
        def ca=request.JSON.username
        def courses = Courses.findAll()
        def courseList = []
        for (item in courses) {
            courseList << item.courseId
        }
        //Fetch attendance history for the user
        def attendanceIdLookup = AttendanceLookup.findAllWhere(username: ca)
        //attendanceIdLookup = AttendanceLookup.findAllWhere(username: session.username)
        def dataz = new StringWriter()
        dataz << '['


        def courseComponents = UsersCourseComponents.findAllWhere(username: session.username)
        courseComponents.each() { courseComponent ->
            def course_name
            def courseComponentTemp = CourseComponents.findWhere(courseComponentId: courseComponent.courseComponentId)
            course_name = courseComponentTemp.courseId

            def dateTimes = CourseComponentDateTimes.findAllWhere(courseComponentId: courseComponent.courseComponentId)

            dateTimes.each() { dateTime ->


                def event_id = courseComponent.courseComponentId + "_" + dateTime.dayOfWeek.toString()
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
        jsonString = jsonString.substring(0, jsonString.length()-1)
        jsonString = jsonString+"]"
        //System.out.println(jsonString)
        render (view: 'calendarpage.gsp', model: [data : jsonString, courses:courseList])
    }

}