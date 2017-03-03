package studybuddy
import javax.servlet.http.Cookie

class AuthenticationInformationController {

    AuthenticationInformationController(){
        super(AuthenticationInformation)
    }
    def index(){
        render (view: 'login.gsp')
    }
    def attemptLogin(){
        if (AuthenticationInformation.findByUsernameAndPassword(params.username,params.password)){
            render "Login Successful"
            //create a cookie to store user info
            Cookie usernameCookie = new Cookie('username', params.username)
            usernameCookie.path = '/'
            response.addCookie usernameCookie
        }
        else{
            session.putValue("username",params.username)
            render session.getValue("username")
        }
    }
    def register(){
        render "reg"
    }

}
