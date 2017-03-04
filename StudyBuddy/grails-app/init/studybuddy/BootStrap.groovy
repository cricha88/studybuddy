package studybuddy

class BootStrap {


    def init = { servletContext ->
        String foo = "W"
        def User = new User(username: "cgraha84", profile_id: "12345").save()
        def austinsRockingList = Courses.withCriteria {
            projections {
                distinct("subject")
            }
        }
        System.out.println(austinsRockingList)

    }
    def destroy = {
    }
}
