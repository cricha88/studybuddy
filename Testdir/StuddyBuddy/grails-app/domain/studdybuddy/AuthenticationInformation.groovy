package studdybuddy

class AuthenticationInformation {
    String password
    String id

    static mapping = {
        id column: 'username', generator: 'assigned'
        version false
    }
}
