package studybuddy

class AuthenticationInformation {
    String username
    String password
    AuthenticationInformation(String username, String password){
        this.username = username
        this.password = password
    }
    static constraints = {
        username size: 0..12
        password size: 5..20
    }
}
