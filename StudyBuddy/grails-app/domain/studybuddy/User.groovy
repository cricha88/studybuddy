package studybuddy

class User {
    String id
    String profile_id

    static mapping = {
        id column: 'username', generator: 'assigned'
        version false
    }

}
