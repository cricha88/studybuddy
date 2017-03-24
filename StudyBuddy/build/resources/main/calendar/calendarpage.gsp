<html>
<head>
<asset:stylesheet src="fullcalendar.min.css"/>
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="moment.min.js" />
<asset:javascript src="fullcalendar.js"/>

<script>

var calInfo = JSON.parse('${raw(data)}');
colours = ['green','red','blue'];
$(document).ready(function() {
    $('#calendar').fullCalendar({
  		weekends: false,
		defaultView: 'agendaWeek',
		minTime: "08:00:00",
		maxTime: "22:00:00",
		editable: true,
		events: [{
  		    id: 12345,
  		    title: calInfo.title,
  			start: calInfo.start,
			end: calInfo.end,
			dow: calInfo.dow,
			ranges: [{
  		        start: $.fullCalendar.moment(calInfo.ranges.start),
				end: $.fullCalendar.moment(calInfo.ranges.end)
			}]

  		}],


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



		eventRender: function(event, element){
  		    if (event.id == 12345) {
  		        element.css('backgroundColor', colours[1]);
			}
    		return (event.ranges.filter(function(range){
        		return (event.start.isBefore(range.end) && event.end.isAfter(range.start));
    		}).length)>0;

		}


    });

//    function dropdown(items){
//
//		if (document.form.subject.value != "null") {
//			document.location.href = items
//		}
//		if (document.form.course.value != "null") {
//			document.location.href = items
//		}
//		if (document.form.section.value != "null") {
//			document.location.href = items
//		}
//	}

});



</script>

</head>
<script>
    $('.fc-button-prev').click(function(){

    });
</script>
${data}
BUT ALSO THIS
${raw(newdat)}
<!--<div id='settings'>-->
<!--<h1>Courses and Settings</h1>-->
<!--<h5>Profile</h5>-->
<!--<button>Edit Profile Picture</button>-->
<!--<button>Edit Name</button> -->
<!--<button>Edit Password</button>-->
<!--</div>-->
<h1>Courses</h1>
<g:form method="post">
	Course Code:
	<g:textField name="courseCode" value="${courseCode}" />
	Class Type:
	<g:select name="class.type" from="${['lecture', 'lab', 'tutorial']}"
			  valueMessagePrefix="class.type" />
	Section:
	<g:textField name="sectionCode" value="${sectionCode}" maxlength="3" />

	<g:actionSubmit value="Add Course" action="addCourse" />

</g:form>

<div id='calendar'></div>
<br/><br/>

</body>

</html>