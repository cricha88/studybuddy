package studybuddy

class User {
    String username

    static mapping = {
        id column: 'username', generator: 'assigned', name: 'username'
        version false
    }
    static constraints = {
    }

}
