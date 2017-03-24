<!--created by Michael Yixin Zhang-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <script type="text/javascript" src="login.js"></script>
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
    p{
        color: #0F385C;
        font-family: "Rajdhani", sans-serif;
        font-size: 100%;
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
    }

    .darkbutton:hover {
        background-color: #BEE5FB;
        color: #0F385C;
    }

    .lightbutton:active{
        border: none;
    }

    .first {
        text-align: center;
    }
    .second{
        color: #BEE5FB;
        margin-bottom: 5px;
    }
    #third{
        margin-top: 40px;
        margin-left: 50px;
    }
    #login_frame {
        width: 700px;
        height: 260px;
        padding: 30px;
        margin: auto;
        /*margin-top: 50px;*/
        /*margin-left: 250px;*/
        background-color: #0F385C;
        border-radius: 20px;
    }
    #login_control{
        margin-top: 15px;
    }

    </style>
</head>

<body>


<h1 class = "first">STUDY BUDDY</h1>
<p class = "first">Made for students, by students. We want to make studying fun and give you the tools to succeed.  <br/>Track your class schedule, attended classes, weekly statistics, friends, and friends classes.</p>

<div id="login_frame">

        <p class = "second">Log in with your UWO email, and your Study Buddy password. </p>
        <p class = "second"> If you are registering for the first time, choose a memorable and secure password.
        Upon clicking "register", the page will refresh and your account will have been created.
        Then, you will be able to log in. </p>
    <div id="third">
        <g:if test="${flash.message}">
            <div style="color:white" class="message">${flash.message}</div>
        </g:if>
        <g:form controller="authenticationInformation">
            <p class = "second"><label class="label_input">Email: &#160&#160&#160&#160&#160&#160&#160&#160 </label><g:textField name="username" />@uwo.ca</p>
            <p class = "second"><label class="label_input">Password: &#160 <g:passwordField name="password"/>(5-20 characters)<br/>
            </div>

            <div id="login_control">
                <g:actionSubmit value="Sign-in" class = "lightbutton" action="login" style="margin-left: 135px; margin-right: 250px; margin-top: 15px;"/>
                <g:actionSubmit value="Register" class = "lightbutton" action="register"/>
            </div>
        </g:form>
</div>
<div id="pic">
    <asset:image src="studybuddylight.png" width="10%" height="auto" margin="auto"/>
</div>

</body>
</html>