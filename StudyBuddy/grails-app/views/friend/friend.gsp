<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="https://cdn.bootcss.com/babel-standalone/6.22.1/babel.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <script type="text/javascript" src='jquery-3.1.1.js'></script>

    <style>
    header {
        background-color:black;
        color:white;
        text-align:center;
        padding:5px;
    }
    nav {
        line-height:50px;
        background-color:#eeeeee;
        height:500px;
        width:200px;
        float:left;
        padding:5px;
    }

    .divcss1{
        position:absolute;
        width:1020px;
        height:488px;
        left:190px;
        top:100px;
        padding:10px;
        background: lightblue
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

    dir{
        font-size:12pt;
        font-family:Arial;
        font-weight:bold;
        font-style:italic;
        color:#23238e;
    }
    footer {
        background-color:black;
        color:white;
        clear:both;
        text-align:center;
        padding:5px;
    }
    </style>
</head>

<body>

<header>
    <h1>Search Friends</h1>
</header>

<nav>
    <li><a href="test.html">Home</a></li>
    <li><a href="test.html">Badges</a></li>
    <li><a href="test.html">Find Study Buddies</a></li>
    <li><a href="test.html">Your History</a></li>
    <li><a href="test.html">Settings</a></li>
</nav>

<div class="divcss1">
    <div class="searchFriends" id="example">
        <dir>User List</dir>
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
        <dir>Request List</dir>
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
        <dir>Friend List</dir>
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
<script>
    $(document).ready(function(){
        $.getJSON('url', function(data) {
            $.each(data.users, function(item, f) {
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
            $.ajax({
                type       : "POST",
                url        : "http://localhost:8080/StudyBuddy/friendREST/save",
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
                url        : "url",
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


<footer>
</footer>

</body>
</html>
