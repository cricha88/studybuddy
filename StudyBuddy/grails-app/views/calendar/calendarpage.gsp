<!doctype html>
<html>
<head>
<script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>
<script src='fullcalendar.js'></script>
	<asset:javascript src="jquery-2.2.0.min.js"/>
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
<script>
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
        			$(this).css('backgroundColor', 'green');
				} else if (attendance == "no") {
        			$(this).css('backgroundColor', 'red');
				}
			}
		},

		eventSources: {
			url: 'demos/php/get-events.php'
		},


		eventRender: function(event){
    		return (event.ranges.filter(function(range){
        		return (event.start.isBefore(range.end) && event.end.isAfter(range.start));
    		}).length)>0;
		},


    });


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

	<li><a class="active" href="#home">Home</a></li>
	<li><a href="#badges">Badges</a></li>
	<li><a href="http://localhost:8080/Friend/index">Find Study Buddies</a></li>
	<li><a href="#your_history">Your History</a></li>
	<li><a href="http://localhost:8080/calendar/index">Calendar</a></li>
</ul>
<div style="margin-left:20%;padding:10px 16px;height:1000px;">
<h5>Courses</h5>

<g:form method="post">
	Course Code:
	<g:textField name="courseCode" value="${courseCode}" />
	Class Type:
	<g:select name="class.type" from="${['Lecture', 'Lab', 'Tutorial']}"
			  valueMessagePrefix="class.type" />
	Section:
	<g:textField name="sectionCode" value="${sectionCode}" maxlength="3" />

	<g:actionSubmit value="Add Course" action="addCourse" />

</g:form>
	<div id="calendar"></div>

</div>
<br/>
<asset:javascript src="fullcalendar.js"/>
<br/>


</body>

</html>