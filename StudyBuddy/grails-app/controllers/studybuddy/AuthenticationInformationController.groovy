package studybuddy

import grails.rest.RestfulController

class AuthenticationInformationController extends RestfulController{
    static responseFormats = ['json']
    def index() { }
    AuthenticationInformationController(){
        super(AuthenticationInformation)
    }
    def attemptLogin(String username, String password){
        AuthenticationInformation loginRequest = AuthenticationInformation.create()
        loginRequest.username = username
        loginRequest.password = password
        if(AuthenticationInformation.find(loginRequest)){
            respond true
        }
        else respond false
    }

}
