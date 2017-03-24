package studybuddy

import grails.rest.RestfulController

class AuthenticationInformationController extends RestfulController{

    AuthenticationInformationController(){
        super(AuthenticationInformation)

    }
    /*def renderWelcome(){
        flash.message = session.username
        render (view:'welcome.gsp')
    }*/
    def index(){
        render (view: 'login.gsp')
    }
    def login(){
        AuthenticationInformation loginAttempt = new AuthenticationInformation(params)
        if (AuthenticationInformation.find(loginAttempt)){
            session.username = params.username
            render (view:'welcome.gsp')
        }
        else{
            redirect( action: 'index')
            flash.message = "invalid login"
        }
    }
    def register(){
        def regAttempt = AuthenticationInformation.findAllWhere(username: params.username)
        if (!regAttempt) {
            session.confirmCode = UUID.randomUUID().toString()
            session.p = params
            if (params.username.contains('@') || params.username.contains('.') || params.username.contains('\\')) {
                flash.message = params.username + "@uwo.ca is not a syntactically valid email address."
                redirect(action: 'index')
            } else {

                sendMail {
                    //this can throw an error if params.username contains invalid chars
                    //javax.mail.internet.AddressException,
                    //Caused by: Domain contains illegal character
                    to params.username + "@uwo.ca"
                    subject "New User Confirmation-StudyBuddy"
                    html g.render(template: "mailtemplate", model: [code: session.confirmCode, username: params.username, password: params.password])
                }
                flash.message = params.username + "@uwo.ca has been sent a confirmation email."
                redirect(action: 'index')
            }
        }


        else{
            flash.message = params.username+" has already been registered"
            redirect(action: 'index')
        }

        if (params.password.length()>20||params.password.length()<5){
            flash.message = "invalid register due to password constraints, enter password between 5 and 20 characters"
        }
        else if (params.username.length()>8||params.username.length()==0){
            flash.message = "Invalid username, must be less than 8 characters"
        }


    }
    def confirm(String id)
    {


        if(id!=session.confirmCode)
        {
            flash.message ="Uh-oh That confirmation code was invalid or has expired! Please try again"
            redirect(action: 'index')
            return
        }


        AuthenticationInformation AiInstance = new AuthenticationInformation(session.p)
        User UserInstance = new User(username: session.p.username)

        if (!AiInstance.save(flush: true)||!UserInstance) {
            flash.message = "there was an issue creating your account"
            redirect(action: 'index')
            return
        }
        flash.message = session.p.username+"@uwo.ca was created"
        redirect(action: 'index')
    }
    def logout() {
        session.username=null
        //params=null
        System.out.println(params)
        render (view: "login.gsp")
    }

    def authenticate(){
        if (session.username==null){
            render (view: "login.gsp")
        }
    }

}
