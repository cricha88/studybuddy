# Project Retrospective  

In culmination of the CS2212 Project, we would like to summarize the experience looking back now.  

## Workflow    
- Framework: Our application is a Grails application.  We used groovy server pages for our front end and Grails domain and controller classes in the back end.  Our data was stored on a mySQL server.  For build automation, we used, with minor modifications, Grails out of the box gradle build system which uses Maven to handle dependencies.  
- Distribution: We had effective distribution. Tasks were distributed at each weekly meeting to be done for the next meeting or on a specific timeline that would be outlined during the meeting.  Usually there would be a list of tasks needed to be tended to and people would agree to sign their name onto taking responsibility of that task.  If members were not present, Christine would delegate accordingly and ensure the teammate were aware of their responsibility.  Near the end of the project, a lot of the work was done while working together in a common space.  
- GitHub: Each team member made a branch off of development to work on their individual tasks. As people pushed their work at various times, it was hard to know how to merge properly.  We did run into some problems with this, it may have been more effective to assign one person to manage our git branches.  

## MVC Design Pattern  
- The user interface, displayed through the views pages, depended on it's controller for it's functionality, and would interact with the mySQL server for data.  
- We used a combination of REST calls and grails built in forms for interacting with the server.  The built in grails forms were much easier to implement and had about the same functionality.  
- Model classes: AuthenticationInformation, CourseComponentDateTimes, CourseComponentInstructors, CourseComponents, Courses, Friend, FriendRequest, User, UserCourseComponents, (AttendanceHistory, AttendanceLookup)  
- Views: login, welcome, calendarpage, friend_calendarpage, friend   
- Controller classes: AuthenticationInformationController, CalendarController, FriendController, UrlMappings  
- In terms of user action communication with controllers, the controller might have a method that the view page will call.  When signing up or logging in, login.gsp needs the controller authenticationInformation to handle the form submission.  
- The aspects of code organization that we would improve on is that we grouped a lot of the tasks for a views page into one controller class to handle the entire the view page instead of seperate controllers for seperate interactions.  

## Refactor Retrospective  
Strengths:  Our login page functionality design was strong.  When we switched our html files to gsp files and realized there was built in grails functionality for form submission and for email authentication, that feature became one of the most simple after some members learned about g forms.  I would say this was a pretty clean feature and took us the least amount of time to implement after we found out about g forms and that's what made it a simple design.   
Weaknesses:  The calendar was a very tricky subject that took about a month to get operational.  It seemed as though whenever I made a change, it wouldn't build, or run, or show the calendar with the correct data.  A team member spent 12 hours straight trying to figure out what was wrong with the calendar.  There was a lot of stuff going on in that controller and it could have been better organized such that it was easier to find the problems that kept arising.  However, I would say that we are very proud that we got it to work and it seems to be less fragile and more manageable.  I would say were are very proud of this feature from a problem solving standpoint.  

## Project Retrospective    
- Our group did well in communicating our understandings or misunderstandings to eachother.  Even though I did not work on back end, I had a good understanding of what they needed to get done and how I could help on my end.  We felt we all knew what needed to be done and there was a lot of good collaboration, effort, and learning done from everyone on the team.  
- We could have been more focused on deadlines and that if a deadline wasn't being met even with lots of work being done, maybe the way that we were trying to implement needed to be more flexible instead of persistant.  We also needed to better manage git because that was definitely a barrier to successful merging.  
- Grails was pretty powerful and learning on Grails was definitely very beneficial to projects in the future and in jobs.   
- Getting Grails to work was a challenge in itself, and originally learning how Grails works was very daunting.  Grails was doing a lot in the background and making files here and there and it was a bit confusing to follow or find the issue when an error came up.  

## Pages  

[Home](README.md)  
[Team Roster](TEAMROSTER.md)  
[Software Design](SOFTWAREDESIGN.md)  
[UI Design](UIDESIGN.md)  
[Project Plan](PROJECTPLAN.md)  
[Project Retrospective](RETRO.md)   
