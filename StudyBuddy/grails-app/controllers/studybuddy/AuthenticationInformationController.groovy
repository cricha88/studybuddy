package studybuddy

import grails.rest.RestfulController

class AuthenticationInformationController extends RestfulController{

    AuthenticationInformationController(){
        super(AuthenticationInformation)

    }
    def renderWelcome(){
        flash.message = session.username
        render (view:'welcome.gsp')
    }
    def index(){
        render (view: 'login.gsp')
    }
    def login(){
        AuthenticationInformation loginAttempt = new AuthenticationInformation(params)
        if (AuthenticationInformation.find(loginAttempt)){
            session.username = params.username
            redirect( action: 'renderWelcome')
        }
        else{
            redirect( action: 'index')
            flash.message = "invalid login"
        }
    }
    def register(){
        sendMail {
            to "caseyrhgraham@gmail.com"
            subject "Theres no way this is gonna work"
            text "Please work"
        }
        def regAttempt = AuthenticationInformation.findAllWhere(username: params.username)
        if (!regAttempt) {
            def newUser = new AuthenticationInformation(params).save(flush: true)
            flash.message = params.username+" has been registered"
            redirect(action: 'index')
        }
        if (params.password.length()>20||params.password.length()<5){
            flash.message = "invalid login due to username and password constraints"
        }

    }
    def logout(){
        session.username=null
        render (view: "login.gsp")
    }

    def authenticate(){
        if (session.username==null){
            render (view: "login.gsp")
        }
    }

}
