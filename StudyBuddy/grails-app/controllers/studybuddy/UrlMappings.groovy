package studybuddy

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        //"calendarpage"(view:"/calendarpage")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
