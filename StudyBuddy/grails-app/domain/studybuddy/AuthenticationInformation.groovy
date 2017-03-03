package studybuddy

class AuthenticationInformation {
    String password
    String username

    static mapping = {
        id column: 'username', generator: 'assigned', name: 'username'
        version false
    }

    static constraints = {
        username size: 8..8
        password size: 5..20
    }
}
