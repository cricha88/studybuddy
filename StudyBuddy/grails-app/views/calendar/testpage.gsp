<!doctype html>
<html>
<head>

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

</style>

<div id='calendar'></div>
</body>

</html>