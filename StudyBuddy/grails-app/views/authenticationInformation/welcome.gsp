<!--created by Michael Yixin Zhang-->
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
        font-family: "Calibri", sans-serif;
        font-size: 100%;
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
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>
    <p>&#160&#160</p>

    <li><a class="active" href="#home">Home</a></li>
    <li><a href="#badges">Badges</a></li>
    <li><a href="http://localhost:8080/Friend/index">Find Study Buddies</a></li>
    <li><a href="#your_history">Your History</a></li>
    <li><a href="http://localhost:8080/calendar/index">Calendar</a></li>
</ul>

<div style="margin-left:20%;padding:10px 16px;height:1000px;">
    <h1 style="margin-top =0px; ">STUDY BUDDY</h1>
    <p>Your courses will be displayed here once you add them. </p>

</div>

</body>
</html>