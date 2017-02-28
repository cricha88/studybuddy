package studybuddy

class AuthenticationInformation {
    String username
    String password
    static constraints = {
        username size: 8..8
        password size: 5..20
    }
}
