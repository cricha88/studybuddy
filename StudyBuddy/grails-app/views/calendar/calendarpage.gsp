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

    });
</script>

${raw(dataz)}
${dataz}

<body>
<ul>
    <asset:image src="studybuddylight.png" width="100%" height="auto"/>

    <p>&#160&#160</p>
    <p>&#160&#160</p>

    <li><a href="http://localhost:8080/authenticationInformation/welcome">Welcome</a></li>
    <li><a href="http://localhost:8080/Friend/index">Study Buddies</a></li>
    <li><a class="active" href="http://localhost:8080/calendar/index">Calendar</a></li>
</ul>

<div style="margin-left:20%;padding:10px 16px;height:1000px;">
    <h1>Courses</h1>
    <g:form method="post">
        Course Code:
        <g:field list="courses" name="courseCode" type="search" placeholder="e.g. COMPSCI 2212B"/>
        <datalist id="courses">
            <g:each in="${courses}" var="course_Id">
                <option value="${course_Id}">${course_Id}</option>
            </g:each>
        </datalist>
        Class Type:
        <g:select name="class.type" from="${['Lecture', 'Lab', 'Tutorial']}"
                  valueMessagePrefix="class.type" />
        Section:
        <g:textField name="sectionCode" value="${sectionCode}" maxlength="3" placeholder="e.g. 001" />

        <g:actionSubmit value="Add Course" action="addCourse" />

    </g:form>
    <div id='calendar'></div>
</div>


<style>
.container {
    margin: 30px auto;
    width: 600px;
    height: 300px;
    border: 1px solid #000;
}
polyline {
    fill: none;
    stroke: #000000;
    stroke-width: 2px;
    stroke-dasharray: 5px;
}
</style>

<div class="container">
    <svg width="100%" height="100%"></svg>
</div>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script>
    window.onload = function() {
        var width = 600, height = 300;
        var main = d3.select('.container svg').append('g')
            .classed('main', true)
            .attr('transform', "translate(" + width/2 + ',' + height/2 + ')');


// (JSON) controal the percentage of each part elelment, just enter the value and this pie will divide by itself
        var dataset = [
            {name: 'ATTENDED', value: ${attended}},
            {name: 'NOT ATTENDED', value: ${not_attended}}
        ];




        var pie = d3.layout.pie()
            .sort(null)
            .value(function(d) {
                return d.value;
            });

        var pieData = pie(dataset);

        var radius = 100;
        var arc = d3.svg.arc()
            .innerRadius(0)
            .outerRadius(radius);
        var outerArc = d3.svg.arc()
            .innerRadius(1.2 * radius)
            .outerRadius(1.2 * radius);
        var oArc = d3.svg.arc()
            .innerRadius(1.1 * radius)
            .outerRadius(1.1 * radius);
        var slices = main.append('g').attr('class', 'slices');
        var lines = main.append('g').attr('class', 'lines');
        var labels = main.append('g').attr('class', 'labels');

        var arcs = slices.selectAll('g')
            .data(pieData)
            .enter()
            .append('path')
            .attr('fill', function(d, i) {
                return getColor(i);
            })
            .attr('d', function(d){
                return arc(d);
            });
        // text label
        var texts = labels.selectAll('text')
            .data(pieData)
            .enter()
            .append('text')
            .attr('dy', '0.35em')
            .attr('fill', function(d, i) {
                return getColor(i);
            })
            .text(function(d, i) {
                return d.data.name;
            })
            .style('text-anchor', function(d, i) {
                return midAngel(d)<Math.PI ? 'start' : 'end';
            })
            .attr('transform', function(d, i) {
                var pos = outerArc.centroid(d);
                pos[0] = radius * (midAngel(d)<Math.PI ? 1.5 : -1.5);

                return 'translate(' + pos + ')';
            })
            .style('opacity', 1);

        var polylines = lines.selectAll('polyline')
            .data(pieData)
            .enter()
            .append('polyline')
            .attr('points', function(d) {
                return [arc.centroid(d), arc.centroid(d), arc.centroid(d)];
            })
            .attr('points', function(d) {
                var pos = outerArc.centroid(d);
                pos[0] = radius * (midAngel(d)<Math.PI ? 1.5 : -1.5);
                return [oArc.centroid(d), outerArc.centroid(d), pos];
            })
            .style('opacity', 0.5);
    };
    function midAngel(d) {
        return d.startAngle + (d.endAngle - d.startAngle)/2;
    }
    function getColor(idx) {
        var palette = [
            '#DF151A', '#00DA3C'
        ]
        return palette[idx % palette.length];
    }
</script>

</body>
</html>