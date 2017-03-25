package studybuddy

class AuthenticationInformation {
   // String id
    String username
    String password
    static mapping = {
        id column: 'username', generator: 'assigned', name: 'username'
        version: false
    }
    static constraints = {
        username size: 0..12
        password size: 5..20
    }
}
