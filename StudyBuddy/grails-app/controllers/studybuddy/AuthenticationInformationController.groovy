package studybuddy

import grails.rest.RestfulController

class AuthenticationInformationController extends RestfulController{

    AuthenticationInformationController(){
        super(AuthenticationInformation)

    }
    def index(){
        render (view: 'login.gsp')
    }
    def login(){
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
    def logout(){
        session.username=null
        index()
    }

    def authenticate(){
        if (session.username==null){
            flash.message = "You are not logged in. Please Log in."
            index()
        }
    }

}
