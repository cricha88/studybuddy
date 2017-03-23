package studybuddy

import grails.rest.RestfulController

class FriendController extends RestfulController {
    static responseFormats = ['json', 'xml']

    FriendController(){
        super(User);
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
        def receiver=params.username

        if(sender&&receiver){
            def fr=new FriendRequest(requester:sender,requested: receiver)
            fr.save()
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
        def s=params.username
        if(r<s){
            def fs=new Friend(friend1: r,friend2:s)
            fs.save()}
        else{
            def fs=new Friend(friend1:s,friend2:r)
            fs.save()
        }
        flash.massage= s "is now your friend"
    }

    def showCalendar(){
        def courseList=UsersCourseComponents.findAll(user:params.username)
        //a list to store all the course ids of the current user
        List<String> idList=new ArrayList<>()

        for(UsersCourseComponents ucc:courseList){
            def id=ucc.courseComponentId
            idList.add(id)
        }
        List<String> nameList=new ArrayList<>()
        List<String> startTime=new ArrayList<>()
        List<String> endTime=new ArrayList<>()
        List<String> dow=new ArrayList<>()
        for(String id:idList){
            def timeinfo=CourseComponentDateTimes.findAll(courseComponentId:id)
            for(CourseComponentDateTimes day:timeinfo)
            {
                startTime.add(day.startTime)
                endTime.add(day.endTime)
                dow.add(day.dayOfWeek)
                def courseId=CourseComponents.find(courseComponentId:id).courseId
                def course=Courses.find(courseId:courseId).name
                nameList.add(course)

            }




        }


    }


    def index() { }
}
