/*
 * Created by Michael Yixin Zhang
 */

 
function register() {
  
    var email = document.getElementById("email");
    var pass = document.getElementById("password");  
  
    if (email.value == "") {
  
        alert("Please enter a valid uwo email");
  
    } else if (pass.value  == "") {  
  
        alert("Please enter your password");
  
    } else if(email.value == "newbuddy" && pass.value == "123456"){
  
        window.location.href="welcome.gsp";
  
    } else {  
  
        alert("Please enter a valid uwo email or password.")
  
    }  
}  
