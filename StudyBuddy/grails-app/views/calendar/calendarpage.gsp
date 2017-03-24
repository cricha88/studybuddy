<%@ page import="studybuddy.Courses" %>
<!doctype html>

<asset:stylesheet src="fullcalendar.min.css"/>
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="moment.min.js" />
<asset:javascript src="fullcalendar.js"/>

<Title>Add Courses</Title>
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
				    eventHistoryUpdate(event.belongsto, clickMoment, 1);
        			$(this).css('backgroundColor', 'green');
				} else if (attendance == "no") {
                    var clickMoment= $('#calendar').fullCalendar('getView').start.format('DD-MM-YYYY');
				    eventHistoryUpdate(event.belongsto, clickMoment, 2);
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
console.log(calInfo)
console.log(Object.prototype.toString.call(calInfo))
for(var i = 0; i < calInfo.length; i++) {
    var obj = calInfo[i];
    idText = obj.id; // CHANGE TO TITLE WHEN UPDATED
    console.log(idText); //"id"
    colorText = obj.color //RENAME TO WHATEVER
    startText = "9:30"; //10:30 AM
    console.log(startText); //"id"
    endText = "10:30"; //11:30 AM
    console.log(endText); //"id"
    dowText = "["+obj.dow+"]";
    console.log(dowText); //"id"
    startTxt = $.fullCalendar.moment(obj.ranges.start),
        console.log(startTxt)
    endTxt = $.fullCalendar.moment(obj.ranges.end),
        console.log(endTxt)
    eventObject = {
        //id: "12345",
        belongsto: idText,
        title: idText, ////////CHANGE , temp
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

${raw(data)}

<h1>Courses</h1>
<g:form method="post">
	Course Code:
	<g:field list="courses" name="courseCode" type="search" placeholder="e.g. COMPSCI 2212"/>
	<datalist id="courses">
		<g:each in="${courses}" var="course_Id">
			<option value="${course_Id}">${course_Id}</option>
		</g:each>
	</datalist>
	Class Type:
	<g:select name="class.type" from="${['Lecture', 'Lab', 'Tutorial']}"
			  valueMessagePrefix="class.type" />
	Section:
	<g:textField name="sectionCode" value="${sectionCode}" maxlength="3" placeholder="eg. 001" />

	<g:actionSubmit value="Add Course" action="addCourse" />

</g:form>
<div id='calendar'></div>

</body>

</html>