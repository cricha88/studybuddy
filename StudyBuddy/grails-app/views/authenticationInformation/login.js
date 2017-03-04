/*
 * Created by Michael Yixin Zhang
 */

 
function login() {
    var a,b,x;
    var email = document.getElementById("email");
    var pass = document.getElementById("password");
    //var txt = '{ "user" : [' +
    //'{ "email":"austin" , "password":"123456" },' +
    //'{ "email":"michael" , "password":"123456" },' +
    //'{ "email":"casey" , "password":"123456" },' +
    //'{ "email":"will" , "password":"123456" },' +
    //'{ "email":"caocao" , "password":"123456" },' +
    //'{ "email":"christine" , "password":"123456" },' +
    //'{ "email":"vivian" , "password":"123456" },' +
    //'{ "email":"maya" , "password":"123456" } ]}';
    
    var txt = {
        "user":[
                { "email":"austin", "password":"123456" },
                { "email":"maya", "password":"123456" },
                { "email":"casey", "password":"123456" },
                { "email":"will", "password":"123456" },
                { "email":"caocao", "password":"123456" },
                { "email":"christine", "password":"123456" },
                { "email":"vivian", "password":"123456" },
                { "email":"michael", "password":"123456" }
        ]
    }
    
    var obj = eval(txt);
    //var obj = JSON.parse(txt);
    for( x in obj.user){
        a = obj.user[x].email;
        b = obj.user[x].password;
        
    }
    

    
    if (email.value == "") {
  
        alert("Please enter your uwo email");
  
    } else if (pass.value  == "") {  
  
        alert("Please enter your password");
  
    } else if(email.value ==  a && pass.value == b ){
  
        window.location.href="welcome.gsp";
  
    } else {  
  
        alert("Please enter a valid uwo email or password.")
  
    }  
}  
