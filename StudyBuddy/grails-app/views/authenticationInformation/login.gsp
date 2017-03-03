<!--created by Michael Yixin Zhang-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>

    <link rel="stylesheet" type="text/css" href="login.css"/>
    <script type="text/javascript" src="login.js"></script>
</head>

<body>
<div id="login_frame">

    <!-- <p id="image_logo"><img src="studybuddy.png"></p>-->

    <p style="color:purple;font-size:50px;"><b>Study Buddy</b></p>
    <p style="color:purple;font-size:25px;"><b>Welcome!</b></p>

    <g:form controller="authenticationInformation">
        <label style="color:purple">Email:</label>
        <g:textField name="username"/><br/>uwo.ca
        <label style="color:purple">Password</label>
        <g:textField name="password"/><br/>
        <g:actionSubmit value="Sign-in" action="attemptLogin"/><g:actionSubmit value="Register" action="register"/>
    </g:form>
</div>

</body>
</html>