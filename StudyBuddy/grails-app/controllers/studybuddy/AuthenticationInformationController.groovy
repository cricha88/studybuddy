package studybuddy

import grails.rest.RestfulController

import javax.servlet.http.Cookie

class AuthenticationInformationController extends RestfulController{

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
            Cookie usernameCookie = new Cookie('username', params.username)
            usernameCookie.path = '/'
            response.addCookie usernameCookie
            render usernameCookie.value

        }
    }
    def register(){
        render "reg"
    }

}
