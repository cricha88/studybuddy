<!doctype html>
<html>
<head>
    <script src='lib/jquery.min.js'></script>
    <script src='lib/moment.min.js'></script>
    <script src='fullcalendar.js'></script>
    <asset:javascript src="jquery-2.2.0.min.js.js"/>

    <Title>Add Courses</Title>
    <!-- <script src='demos/php/get-events.php'></script> -->
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

    .divcss1{
        position:absolute;
        width:1020px;
        height:488px;
        left:190px;
        top:100px;
        padding:10px;

    }

    .searchFriends{
        border-style: outset; line-height:15px;overflow-y:scroll; position:absolute; width:200px;height:400px;left:100px;top:30px;
        background: #ffffff
    }

    .acceptRequest{
        border-style: outset;overflow-y:scroll; line-height:15px;position:absolute; width:200px;height:280px;left:360px;top:50px;
        background: lightyellow
    }

    .checkSche{
        border-style: outset;overflow-y:scroll; line-height:15px;position:absolute; width:200px;height:280px;left:610px;top:50px;
        background: lightyellow
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
    <script>
        $(document).ready(function(){
            $.getJSON('http://localhost:8080/Friend/addUser', function(data) {
                $.each(data, function(item, f) {
                    var user = "<tr>" +
                        "<td>" + f.username + "</td>" + "<td> <button class='sendPost'>Add</button> </td>" + "</tr>";
                    $('button.sendPost').css({"background-color": "#003366", "color": "white","padding": "5px","font-family": "Arial","width":"70px",
                        "text-align":"center","border-radius": "15%"});
                    $(user).appendTo("#searchF tbody");

                });

            });

            $("#searchF").on('click','.sendPost',function(){
                var text=$(this).closest('td').siblings().contents().text();
                alert("Friend request to "+text+" have been send!");
                this.style.background="lightblue";
                this.style.color="black";
                event.preventDefault();
                $.ajax({
                    url        : "${createLink(controller: 'Friend', action: 'sendFriendRequest')}",
                    type       : "POST",
                    data       : {username : JSON.stringify(text)},
                    //data       :  JSON.stringify(text),
                    contentType:'application/json; charset=utf-8',
                    dataType   : 'json',
                     success   : function(response) {
                        alert('Works!');
                    },
                    error      : function() {
                        alert('No working!'+text);
                    }
                });
            });

            $.getJSON('http://localhost:8080/Friend/showFriendRequest', function(data) {
                $.each(data.requests, function(item, f) {
                    $('button.acceptPost').css({"font-family": "Arial","width":"70px",
                        "text-align":"center","border-radius": "15%"});
                    var friend = "<tr>" +
                        "<td>" + f.username + "</td>" + "<td> <button class='acceptPost'>Accept</button> </td>" + "</tr>"
                    $(friend).appendTo("#acceptR tbody");

                });

            });

            $("#acceptR").on('click','.acceptPost',function(){
                var text=$(this).closest('td').siblings().contents().text();
                alert("You have accepted "+text+"'s add friends request!");
                this.style.background="lightyellow";
                this.style.color="black";
                $.ajax({
                    type       : "POST",
                    url        : "http://localhost:8080/Friend/confirmFriendRequest",
                    data       : {username : JSON.stringify(text)},
                    contentType:"application/json; charset=utf-8",
                    dataType   : 'json',
                    success    : function(response) {
                        alert('Works!');
                    },
                    error      : function() {
                        alert('No working!');
                    }
                });
            });

            $.getJSON('url', function(data) {
                $.each(data.friends, function(item, f) {

                    var friend = "<tr>" +
                        "<td>" + f.username + "</td>" + "<td> <button class='checkPost'>check scheduel</button> </td>" + "</tr>";
                    $('button.checkPost').css({"padding": "5px","font-family": "Arial",
                        "text-align":"center","border-radius": "15%"});
                    $(friend).appendTo("#checkS tbody");

                });

            });

            $("#checkS").on('click','.checkPost',function(){
                var text=$(this).closest('td').siblings().contents().text();
                alert(text+"'s scheduel is: ");
                this.style.background="lightyellow";
                this.style.color="black";
                $.ajax({
                    type       : "POST",
                    url        : "url",
                    data       : {"username" : JSON.stringify(text)},
                    contentType:"application/json; charset=utf-8",
                    dataType   : 'json',
                    success    : function(response) {
                        alert('Works!');
                    },
                    error      : function() {
                        alert('No working!');
                    }
                });
            });


        });

        function search1() {
            // Declare variables
            var input, filter, table, tr, td, i;
            input = document.getElementById("searchName");
            filter = input.value.toUpperCase();
            table = document.getElementById("searchF");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
        function search2() {
            // Declare variables
            var input, filter, table, tr, td, i;
            input = document.getElementById("accept2");
            filter = input.value.toUpperCase();
            table = document.getElementById("acceptR");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
        function search3() {
            // Declare variables
            var input, filter, table, tr, td, i;
            input = document.getElementById("check2");
            filter = input.value.toUpperCase();
            table = document.getElementById("checkS");
            tr = table.getElementsByTagName("tr");

            // Loop through all table rows, and hide those who don't match the search query
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
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

    <li><a  href="#home">Home</a></li>
    <li><a href="#badges">Badges</a></li>
    <li><a class="active" href="http://localhost:8080/Friend/index">Find Study Buddies</a></li>
    <li><a href="#your_history">Your History</a></li>
    <li><a href="http://localhost:8080/calendar/index">Calendar</a></li>
</ul>
<div style="margin-left:20%;padding:10px 16px;height:1000px;">
    <h5>study buddy</h5>
    <div class="divcss1">
        <div class="searchFriends" id="example">
            <div>User List</div>
            <form>
                <input id="searchName" type="text" name="" onkeyup="search1()" placeholder="Search names.." >
            </form>
            <table id= "searchF" >
                <thead>
                <th>UserName    </th>
                <th> AddRequest</th>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="acceptRequest" id="accept">
            <div>Request List</div>
            <form>
                <input id="accept2" type="text" name="" onkeyup="search2()" placeholder="Search names.." >
                <table id= "acceptR" >
                    <thead>
                    <th>UserName    </th>
                    <th> Accept Request</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="checkSche" id="chat_div">
            <div>Friend List</div>
            <form>
                <input id="check2" type="text" name="" onkeyup="search3()" placeholder="Search for friends.." >
                <table id= "checkS" >
                    <thead>
                    <th>UserName    </th>
                    <th> check schedule</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </form>
        </div>
    </div>

</div>
<br/>

</body>

</html>