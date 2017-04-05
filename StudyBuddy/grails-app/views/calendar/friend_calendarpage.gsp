<%@ page import="studybuddy.Courses" %>
<!doctype html>

<asset:stylesheet src="fullcalendar.min.css"/>
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="moment.min.js" />
<asset:javascript src="fullcalendar.js"/>

<title>Calendar</title>
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
            startText = obj.end; //10:30//Backward in database
            console.log(startText); //"id"
            endText = obj.start; //11:30// Backwards in database
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
    <div id='calendar'></div>
</div>

<div>
<style>
.container {
    margin: 30px auto;
    width: 600px;
    height: 300px;
    /*border: 1px solid #000;*/
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

//
//        var atCount = 0;
//        var notCount = 0;
//        function incrementAt() {
//            atCount++;
//        }
//        function incrementNot() {
//            notCount++;
//        }
// (JSON) controal the percentage of each part elelment, just enter the value and this pie will divide by itself
        var dataset = [
            %{--{name: 'ATTENDED', value: ${attended}},--}%
            %{--{name: 'NOT ATTENDED', value: ${not_attended}}--}%
            {name: 'ATTENDED', value: ${atCount},
            {name: 'NOT ATTENDED', value: ${notCount}}
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

</div>
</body>
</html>