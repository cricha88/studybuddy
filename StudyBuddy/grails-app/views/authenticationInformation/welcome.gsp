<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
    @import url('https://fonts.googleapis.com/css?family=Rajdhani');

    body {
        background-color: #BEE5FB;
    }

    h1{
        color: #0F385C;
        font-family: "Rajdhani", sans-serif;
        font-size: 400%;
        font-weight: normal;
        margin-bottom: 10px;
        padding-bottom: 0;
    }


    h2{

    }

    h3{
    }

    p{
        color: #0F385C;
        font-family: "Rajdhani", sans-serif;
        font-size: 150%;
        margin-top: 0px;
        margin-bottom: 0px;
        padding-top: 0;
    }

    .lightbutton {
        background-color: #BEE5FB;
        border: none;
        color: #0F385C;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        border-radius: 20px;
        transition-duration: 0.4s;
        cursor: pointer;
    }

    .lightbutton:hover {
        background-color: #0F385C;
        color: #BEE5FB;
    }

    .lightbutton:active{
        border: none;
    }

    .darkbutton {
        background-color: #0F385C;
        border: none;
        color: #BEE5FB;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        border-radius: 20px;
        transition-duration: 0.4s;
        cursor: pointer;
        float: right;
    }

    .darkbutton:hover {
        background-color: #BEE5FB;
        color: #0F385C;
    }

    .lightbutton:active{
        border: none;
    }

    body {
        margin: 0;
    }

    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width: 20%;
        background-color: #0F385C;
        position: fixed;
        height: 100%;
        overflow: auto;
    }

    li a {
        display: block;
        color: #BEE5FB;
        padding: 8px 16px;
        text-decoration: none;
        font-family: "Calibri", sans-serif;
        text-align: left;
    }

    li a.active {
        background-color: #BEE5FB;
        color: #0F385C;
    }

    li a:hover:not(.active) {
        background-color: #BEE5FB;
        color: #0F385C;
    }

    </style>
</head>

<body>
<ul>
    <asset:image src="studybuddylight.png" width="100%" height="auto"/>

    <p>&#160&#160</p>
    <p>&#160&#160</p>

    <li><a class="active" href="http://localhost:8080/authenticationInformation/welcome.gsp">Welcome</a></li>
    <li><a href="http://localhost:8080/Friend/index">Study Buddies</a></li>
    <li><a href="http://localhost:8080/calendar/index">Calendar</a></li>
</ul>

<div style="margin-left:20%;padding:10px 16px;height:1000px;">
    <g:form controller="authenticationInformation">
          <g:actionSubmit value="Log Out" class = "darkbutton" action="logout"/>
    </g:form>

    <h1>STUDY BUDDY</h1>
    <p>Welcome to StudyBuddy! Your developing app, specific to your courses at Western, your friends, and your success.</p><br/>

    <p>Have you ever experienced not knowing anyone in your classes? Losing track of your schedule? Missing the notes from a
    certain lecture with no one to ask?</p><br/>

    <p>StudyBuddy is here to help.  Our application, named “StudyBuddy” features real data from from Western’s timetable data,
    adding people to friends lists, seeing friend's schedules, confirming attendance, and more.  In the future, we hope to
    update features, add chat with friends options, record time studying, reward study time and attendance streaks with badges,
    compete against friends, and more.</p><br/>

    <p>Stay tuned Western, we'll be your StudyBuddy.</p><br/><br/>


</div>

</body>
</html>