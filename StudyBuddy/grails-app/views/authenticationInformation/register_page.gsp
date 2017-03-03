<!--created by Michael Yixin Zhang-->
<!DOCTYPE html>
<html>
<head>  
    <meta charset="UTF-8">
    <title>Register Page</title>
  
    <link rel="stylesheet" type="text/css" href="register.css"/>
    <script type="text/javascript" src="register.js"></script>
</head>  
  
<body>
<div id="register_frame">
    
    <p style="color:purple;font-size:50px;"><b>Welcome!</b></p>
    
    <p style="color:purple;font-size:25px;"><b>Please register with your UWO email.</b></p>
  
    <form method="post" action="register.js">
  
        <p style="color:purple;"><b><label class="label_input">Email Address</label><input type="text" id="email" class="text_field"/></b></p>
        <p><label class="label_input" style="color:purple;"><b>Enter Password</b></label><input type="text" id="password" class="text_field"/></p>
  
        <div id="register_control">
            <input type="button" id="btn_register" value="Register" onclick="register();"/>
            <a id="Back" href="login.gsp">Back</a>
        </div>  
    </form>  
</div>  
  
</body>  
</html>  
