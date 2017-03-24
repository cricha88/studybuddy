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
            //events: 'demos/php/get-events.php',
            /*events: [
                {
                    title: 'CS2209 Applied Logic for Computer Science',
                    start: '9:30',
                    end: '11:30',
                    dow: [2,4],
                    ranges: [{
                        start: moment('2017-01-04', 'YYYY-MM-DD'),
                        end: moment('2017-05-04', 'YYYY-MM-DD')
                    }]
                },
                {
                    title: 'CS3342 Organization of Programming Languages' ,
                    start: '13:30',
                    end: '15:00',
                    dow: [2,5],
                    ranges: [{
                        start: moment('2017-01-04', 'YYYY-MM-DD'),
                        end: moment('2017-05-04', 'YYYY-MM-DD')
                    }]
                },
                {
                    title: 'CS2212 Introduction to Software Engineering',
                    start: '10:30',
                    end: '12:30',
                    dow: [1,3],
                    ranges: [{
                        start: moment('2017-01-04', 'YYYY-MM-DD'),
                        end: moment('2017-05-04', 'YYYY-MM-DD')
                    }]
                },
                {
                    title: 'CS2212 Introduction to Software Engineering',
                    start: '12:30',
                    end: '14:30',
                    dow: [4],
                    ranges: [{
                        start: moment('2017-01-04', 'YYYY-MM-DD'),
                        end: moment('2017-05-04', 'YYYY-MM-DD')
                    }]
                }
            ],*/
            eventRender: function(event){
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
    var calInfo = JSON.parse('${raw(data)}');
    console.log(Object.prototype.toString.call(calInfo))
    //for(var i = 0; i < calInfo.length; i++) {
        var obj = calInfo[0];
        idText = obj.id;
        console.log(idText); //"id"
        startText = "9:30"; //10:30 AM
        console.log(startText); //"id"
        endText = "11:30"; //11:30 AM
        console.log(endText); //"id"
        dowText = "[[2,3]]";
        console.log(dowText); //"id"
        startTxt = $.fullCalendar.moment("2017-01-04"),
            console.log(startTxt)
        endTxt = $.fullCalendar.moment("2017-01-04"),
            console.log(endTxt)
        eventObject = {
            //id: "12345",
            title: "2212B", ////////CHANGE , temp
            start: startText,
            end : endText,
            dow: [2,3],
            ranges: [{
                start: startTxt,
                end: endTxt
            }],
            allDay:false
        };
        $('#calendar').fullCalendar('renderEvent', eventObject, true);
        console.log(eventObject);

    //}
</script>

${raw(data)}

<h1>Courses</h1>
<g:form method="post">
	Course Code:
	<g:field list="courses" name="courseCode" type="search" value="e.g. COMPSCI 2212"/>
	<datalist id="courses">
		<g:each in="${courses}" var="course_Id">
			<option value="${course_Id}">${course_Id}</option>
		</g:each>
	</datalist>
	Class Type:
	<g:select name="class.type" from="${['Lecture', 'Lab', 'Tutorial']}"
			  valueMessagePrefix="class.type" />
	Section:
	<g:textField name="sectionCode" value="${sectionCode}" maxlength="3" />

	<g:actionSubmit value="Add Course" action="addCourse" />

</g:form>
<div id='calendar'></div>

</body>

</html>