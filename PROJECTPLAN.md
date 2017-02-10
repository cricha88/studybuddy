# Project Plan


### 1. User Account 
Visitors will be able to sign up with for an account with their UWO username that we append with @uwo.ca.  They will be able to modify information on their account through the settings page.  This will be done through using some recipient authentication with a REST API such as <kickbox.io>.


### 2. Search for friends
For each class that the user in enrolled in, a list of other students in that class using the application will show up.  By adding a class to their schedule, a user is added to the list of usernames associated with the class.  From this, users can add add features.


### 3. Add and delete friends
After finding a friend, one sees a button request to add them.  If the other party accepts the request.  If a user want to delete a friend, the connection is interrupted without the other party needing to accept. This is similar to Facebook's friend requesting and would be doable to implement.  


### 4. View friends
Friends can be seen on the study buddy panel.  They will be grouped into the respective classes or study groups shared between both users if applicable.  This will be a simple categorization and will be dependent on adding and deleting friends.  


### 5. Chat
By clicking on a friend's name in the study buddy panel, a direct chat between the two people will commence.  Previous messages will show up prior to most recent messages.  There will also be group chats, and class chats.  This can be done using a chat API such as Twilio's Programmable Chat API at <twilio.com/chat>.  


### 6. Select classes
Users will select the subject, course code, and section to add a class to their schedule shown on the home page.  We will need to perform web scraping on the timetable website: http://studentservices.uwo.ca/secure/timetables/mastertt/ttindex.cfm to collect data on class schedules.  Using customizable open source code from such as from <fullcalendar.io>, we will be able to implement the calendar in such a way.  


### 7. Obtain Badges
Users obtain badges for class attendance streaks, logging study time, and other progressions through using the application.  Integrated with the self-accountability feature, the badges feature looks at certain data and gives the user if this fits the criteria for receiving a badge.  


### 8. Self-accountability
Users will be able to check in to class once the class is in session.  A history of classes attended or unattended will result in badges for class attendance streaks, and allows users to be accountable for missing class because it is in their history.  Looking back, a user could see which class they missed to get the notes they need.  Also, users can log study time which will result in badges and holds users responsible for their studying.  This feature is implemented through user input and relies on the class schedule and connects with obtaining badges.  


[Home](README.md)  
[Team Roster](TEAMROSTER.md)  
[Software Design](SOFTWAREDESIGN.md)  
[UI Design](UIDESIGN.md)  
[Project Plan](PROJECTPLAN.md) 