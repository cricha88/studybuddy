package studdybuddy

class User {
    String id

    static mapping = {
        id column: 'username', generator: 'assigned'
        version false
    }

    static constraints = {
        id maxSize: 30
    }
}
