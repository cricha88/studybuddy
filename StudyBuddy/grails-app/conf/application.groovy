grails {
   mail {
     host = "smtp.gmail.com"
     port = 465
     username = "studybuddynotreply@gmail.com"
     password = "studybuddy"
     props = ["mail.smtp.auth":"true",
              "mail.smtp.socketFactory.port":"465",
              "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
              "mail.smtp.socketFactory.fallback":"false"]
   }
}
