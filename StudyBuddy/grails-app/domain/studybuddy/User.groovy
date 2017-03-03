package studybuddy

class User {
    String username
    String profile_id

    static mapping = {
        id column: 'username', generator: 'assigned', name: 'username'
        version false
    }
    static constraints = {
        username size:8..8
    }

}
