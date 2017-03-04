<!doctype html>
<html>
<head>
<link rel='stylesheet' href='fullcalendar.css' />
<script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>
<script src='fullcalendar.js'></script>
<!-- <script src='demos/php/get-events.php'></script> -->

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
	<style>
	body {
margin: 40px 10px;
padding: 0;
font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
font-size: 14px;
}

#calendar {
max-width: 900px;
margin: 0 auto;
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


<div style="margin-left:20%;padding:10px 16px;height:1000px;">
		<h1>STUDY BUDDY</h1>
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
		<li><a href="#find_study_buddies">Find Study Buddies</a></li>
		<li><a href="#your_history">Your History</a></li>
		<li><a href="http://localhost:8080/calendar/index">Calendar</a></li>
	</ul>
</div>
</body>

</html>