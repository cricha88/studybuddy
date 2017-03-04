package studybuddy

class BootStrap {

    def init = { servletContext ->
        def userCourseComponent = new UsersCourseComponents(username:"Austin" , courseComponentId: "not null")
        userCourseComponent.save()
    }
    def destroy = {
    }
}
