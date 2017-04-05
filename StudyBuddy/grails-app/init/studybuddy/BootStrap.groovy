package studybuddy

class BootStrap {


    def init = { servletContext ->
        def user1=new User(username:"aaa").save()
        def user2=new User(username:"bbb").save()
        def user3=new User(username:"ccc").save()
        def user4=new User(username:"ddd").save()
        def user5=new User(username:"eee").save()
        def user6=new User(usernmae:"fff").save()
        def aut1=new AuthenticationInformation(username:"aaa",password: "12345").save()
        def aut2=new AuthenticationInformation(username:"bbb",password: "12345").save()
        def aut3=new AuthenticationInformation(username:"ccc",password:"12345").save()
        def aut4=new AuthenticationInformation(username:"ddd",password:"12345").save()
        def aut5=new AuthenticationInformation(username:"eee",password:"12345").save()
        def aut6=new AuthenticationInformation(username:"fff",password:"12345").save()

    }
    def destroy = {
    }
}
