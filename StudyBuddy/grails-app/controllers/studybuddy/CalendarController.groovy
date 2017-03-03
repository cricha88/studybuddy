package studybuddy

class CalendarController {

    def index() {
        render (view: 'calendar.gsp')
    }

    def getCourses(params){
        def subject = params.subject

    }

    def addCourse(params){
        def userCourseComponent = new UsersCourseComponents()
        userCourseComponent.username = session.username
        userCourseComponent.courseComponentId = params.componentId
        userCourseComponent.save()
    }

}
