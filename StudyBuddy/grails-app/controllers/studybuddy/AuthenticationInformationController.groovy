package studybuddy

import grails.rest.RestfulController

class AuthenticationInformationController extends RestfulController{

    AuthenticationInformationController(){
        super(AuthenticationInformation)

    }
    def index(){
        render (view: 'login.gsp')
    }
    def attemptLogin(){
        if (AuthenticationInformation.findByUsernameAndPassword(params.username,params.password)){
            session.username = params.username
            flash.message = "Hello ${params.username}!"
            sleep(1500)
            redirect(controller:"", action:"")
        }
        else{
            flash.message = "Sorry, invalid login! Please try again."
            redirect(action:"index")
        }
    }
    def register(){
        if (!AuthenticationInformation.findByUsername(params.username)){
            AuthenticationInformation newUser = new AuthenticationInformation(params.username, params.password)
            index()
        }
    }

}
