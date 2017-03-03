<!--created by Michael Yixin Zhang-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="..\..\assets\stylesheets\application.css" type="text/css">
    <script type="text/javascript" src="login.js"></script>
    <style>
    .first {
        margin-left: 150px;
        margin-right: 100px;
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
        height: 180px;
        padding: 30px;
        position: absolute;
        margin-top: 50px;
        margin-left: 250px;
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
<p class = "first">Made for students, by students. We want to make studying fun and give you the tools to succeed.</p>
​
<p class = "first">Track your academic dedication with badges, compete with friends, and meet classmates to study with!</p>
<div id="login_frame">
    <form method="post" action="login.js">

        <p class = "second">Log in with your UWO email, and your Study Buddy password. </p>
        <p class = "second"> If you are registering for the first time, choose a memorable and secure password.
        Upon clicking "register", the page will refresh and your account will have been created.
        Then, you will be able to log in. </p>
    <div id="third">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:form controller="authenticationInformation">
            <p class = "second"><label class="label_input">Email: &#160&#160&#160&#160&#160&#160&#160&#160 </label><g:textField name="username" />@uwo.ca(8 characters)<br/>
                &#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160&#160 New to Study Buddy? </p>
            <p class = "second"><label class="label_input">Password: &#160 <g:passwordField name="password"/>(5-20 characters)<br/>
            </div>

            <div id="login_control">
                <g:actionSubmit value="Sign-in" class = "lightbutton" action="login" style="margin-left: 135px; margin-right: 250px; margin-top: 15px;"/>
                <g:actionSubmit value="Register" class = "lightbutton" action="register"/>
            </div>
        </g:form>
</div>

</body>
</html>