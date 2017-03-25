<!doctype html>
<html>
<head>
   <asset:stylesheet src="fullcalendar.min.css"/>
   <asset:javascript src="jquery.min.js"/>
   <asset:javascript src="moment.min.js" />
   <asset:javascript src="fullcalendar.js"/>
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
        left:250px;
        top:50px;
        padding:10px;


    }

    .searchFriends{
        border-style: outset; line-height:15px;overflow-y:scroll; position:absolute; width:200px;height:500px;right:70px;top:30px;
        background: lightblue;
    }

    .acceptRequest{
        border-style: outset;overflow-y:scroll; line-height:15px;position:absolute; width:200px;height:230px;left:30px;top:340px;
        background: lightblue;
    }

    .checkSche{
        border-style: outset;overflow-y:scroll; line-height:15px;position:absolute; width:200px;height:280px;left:30px;top:30px;
        background: lightblue
    }
    .calendar1{
        border-style: outset;overflow-y:scroll; line-height:15px;position:absolute; width:500px;height:380px;left:240px;top:30px;
        background: lightgrey;
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
                // event.preventDefault();
                $.ajax({
                    url        : 'http://localhost:8080/Friend/sendFriendRequest',
                    type       : "POST",
                    data       :  JSON.stringify({"username":text}),
                    contentType:'application/json; charset=utf-8',
                    //dataType   : 'json',
                    success   : function(response) {
                        alert('Works!');
                    },
                    error      : function() {
                        alert('No working!'+text);
                    }
                });
            });
            $.getJSON('http://localhost:8080/Friend/showFriendRequest', function(data) {
                $.each(data, function(item, f) {
                    $('button.acceptPost').css({"font-family": "Arial","width":"70px",
                        "text-align":"center","border-radius": "15%"});
                    var friend = "<tr>" +
                        "<td>" + f.requester + "</td>" + "<td> <button class='acceptPost'>Accept</button> </td>" + "</tr>"
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
                    data       : JSON.stringify({"username":text}),
                    contentType:"application/json; charset=utf-8",
                    //dataType   : 'json',
                    success    : function(response) {
                        alert('Works!');
                    },
                    error      : function() {
                        alert('No working!');
                    }
                });
            });
            $.getJSON('http://localhost:8080/Friend/showFriend', function(data) {
                $.each(data, function(item, f) {

                    var friend = "<tr>" +
                        "<td>" + f.friend2 + "</td>" + "<td> <button class='checkPost'>check scheduel</button> </td>" + "</tr>";
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

                event.preventDefault();


                $.ajax({
                    type       : "POST",
                    url        : "http://localhost:8080/Friend/showcalendar",
                    data       : JSON.stringify({"username":text}),
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

        colours = ['green','red','blue'];
        $(document).ready(function() {
            $('#calendar').fullCalendar({
                weekends: false,
                defaultView: 'agendaWeek',
                minTime: "08:00:00",
                maxTime: "22:00:00",
                editable: true,

                eventClick: function(event) {
                    if (moment(event.end).isBefore(moment())) {
                        var attendance = prompt('Did you attend this class?\nyes/no', attendance);
                        if (attendance == "yes") {
                            var clickMoment= $('#calendar').fullCalendar('getView').start.format('DD-MM-YYYY');
                            console.log(clickMoment);
                            //eventHistoryUpdate(event.belongsto, clickMoment, 1);
                            $(this).css('backgroundColor', 'green');
                        } else if (attendance == "no") {
                            var clickMoment= $('#calendar').fullCalendar('getView').start.format('DD-MM-YYYY');
                            //eventHistoryUpdate(event.belongsto, clickMoment, 2);
                            $(this).css('backgroundColor', 'red');
                        }
                    }
                },

                eventRender: function(event, element){
                    if (event.id == 12345) {
                        element.css('backgroundColor', colours[1]);
                    }
                    return (event.ranges.filter(function(range){
                            return (event.start.isBefore(range.end) && event.end.isAfter(range.start));
                        }).length)>0;

                }


            });



            var calInfo = JSON.parse('${raw(data)}');
            console.log(calInfo);
            console.log(Object.prototype.toString.call(calInfo))
            for(var i = 0; i < calInfo.length; i++) {
                var obj = calInfo[i];
                idText = obj.id; // CHANGE TO TITLE WHEN UPDATED
                console.log(idText); //"id"
                titleText = obj.title;
                console.log(titleText);
                //colorText = obj.color; //RENAME TO WHATEVER
                startText = "9:30"; //10:30 AM
                console.log(startText); //"id"
                endText = "10:30"; //11:30 AM
                console.log(endText); //"id"
                dowText = "["+obj.dow+"]";
                console.log(dowText); //"id"
                startTxt = $.fullCalendar.moment(obj.ranges.start),
                    console.log(startTxt);
                endTxt = $.fullCalendar.moment(obj.ranges.end),
                    console.log(endTxt);
                eventObject = {
                    //id: "12345",
                    belongsto: idText,
                    title: titleText, ////////CHANGE , temp
                    start: startText,
                    end : endText,
                    dow: dowText,
                    ranges: [{
                        start: startTxt,
                        end: endTxt
                    }],
                    allDay:false
                };
                $('#calendar').fullCalendar('renderEvent', eventObject, true);
                console.log(eventObject);

                $('#my-button').click(function() {
                    var moment = $('#calendar').fullCalendar('getDate');
                    alert("The current date of the calendar is " + moment.format());
                });

            }
        });
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
        <div class="calendar1" id="calendar">XXX's schedule

        </div>
    </div>


</div>
<br/>

</body>

</html>