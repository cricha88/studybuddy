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
			dow: [1],
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

<!--<select controller="CalendarController">-->
		<!--<option>Select Subject</option>-->
	<!--&lt;!&ndash; From Western Timetables &ndash;&gt;-->

										<!--<option value="ACTURSCI"  > Actuarial Sciences-->
										<!--<option value="AMERICAN"  > American Studies -->
										<!--<option value="ANATCELL"  > Anatomy and Cell Biology -->
										<!--<option value="ANTHRO"  > Anthropology -->
										<!--<option value="APPLMATH"  > Applied Mathematics -->
										<!--<option value="ARABIC"  > Arabic -->
										<!--<option value="ARTHUM"  > Arts and Humanities -->
										<!--<option value="ASTRONOM"  > Astronomy -->
										<!--<option value="BIBLSTUD"  > Biblical Studies -->
										<!--<option value="BIOCHEM"  > Biochemistry -->
										<!--<option value="BIOLOGY"  > Biology -->
										<!--<option value="BIOPHYS"  > Biophysics -->
										<!--<option value="BIOSTATS"  > Biostatistics -->
										<!--<option value="MTP-RADO"  > Broadcasting-Radio Fanshawe -->
										<!--<option value="MTP-TVSN"  > Broadcasting-TV Fanshawe -->
										<!--<option value="MTP-FLDP"  > Broadcasting-TV-Field Fanshawe -->
										<!--<option value="BUSINESS"  > Business Administration -->
										<!--<option value="CALCULUS"  > Calculus -->
										<!--<option value="CGS"  > Centre for Global Studies -->
										<!--<option value="CBE"  > Chem & Biochem Engineering -->
										<!--<option value="CHEMBIO"  > Chemical Biology -->
										<!--<option value="CHEM"  > Chemistry -->
										<!--<option value="CSI"  > Childhood & Social Institutns -->
										<!--<option value="CHINESE"  > Chinese -->
										<!--<option value="CHURCH"  > Church History -->
										<!--<option value="CHURLAW"  > Church Law -->
										<!--<option value="CHURMUSI"  > Church Music -->
										<!--<option value="CEE"  > Civil & Envrnmntl Engineering -->
										<!--<option value="CLASSICS"  > Classical Studies -->
										<!--<option value="CMBPROG"  > Combined Program Enrollment -->
										<!--<option value="COMMSCI"  > Communication Sci & Disorders -->
										<!--<option value="COMPLIT"  > Comparative Lit & Culture -->
										<!--<option value="COMPSCI"  > Computer Science -->
										<!--<option value="DANCE"  > Dance -->
										<!--<option value="MTP-DEVL"  > Development - Fanshawe -->
										<!--<option value="DIGICOMM"  > Digital Communication -->
										<!--<option value="DIGIHUM"  > Digital Humanities -->
										<!--<option value="DOL"  > Dimensions of Leadership -->
										<!--<option value="DISABST"  > Disability Studies -->
										<!--<option value="EARTHSCI"  > Earth Sciences -->
										<!--<option value="ECONOMIC"  > Economics -->
										<!--<option value="EELC"  > Education English Language Cen -->
										<!--<option value="ECE"  > Elect & Computer Engineering -->
										<!--<option value="ENGSCI"  > Engineering -->
										<!--<option value="ENGLISH"  > English -->
										<!--<option value="ENVIRSCI"  > Environmental Science -->
										<!--<option value="EPID"  > Epidemiology -->
										<!--<option value="EPIDEMIO"  > Epidemiology & Biostatistics -->
										<!--<option value="FAMLYSTU"  > Family Studies -->
										<!--<option value="FLDEDUC"  > Field Education -->
										<!--<option value="FILM"  > Film Studies -->
										<!--<option value="FINMOD"  > Financial Modelling -->
										<!--<option value="FRSTNATN"  > First Nations Studies -->
										<!--<option value="FOODNUTR"  > Foods and Nutrition -->
										<!--<option value="FRENCH"  > French -->
										<!--<option value="GEOGRAPH"  > Geography -->
										<!--<option value="GEOLOGY"  > Geology -->
										<!--<option value="GEOPHYS"  > Geophysics -->
										<!--<option value="GERMAN"  > German -->
										<!--<option value="GREEK"  > Greek -->
										<!--<option value="GPE"  > Green Process Engineering -->
										<!--<option value="HEALTSCI"  > Health Sciences -->
										<!--<option value="HEBREW"  > Hebrew -->
										<!--<option value="HINDI"  > Hindi -->
										<!--<option value="HISTTHEO"  > Historical Theology -->
										<!--<option value="HISTORY"  > History -->
										<!--<option value="HISTSCI"  > History of Science -->
										<!--<option value="HOMILET"  > Homiletics -->
										<!--<option value="HUMANECO"  > Human Ecology -->
										<!--<option value="INTEGSCI"  > Integrated Science -->
										<!--<option value="INTERDIS"  > Interdisciplinary -->
										<!--<option value="INTREL"  > International Relations -->
										<!--<option value="ITALIAN"  > Italian -->
										<!--<option value="JAPANESE"  > Japanese -->
										<!--<option value="JEWISH"  > Jewish Studies -->
										<!--<option value="MTP-BRJR"  > Journalism-Broadcasting Fanshw -->
										<!--<option value="KINESIOL"  > Kinesiology -->
										<!--<option value="LATIN"  > Latin -->
										<!--<option value="LAW"  > Law -->
										<!--<option value="LINGUIST"  > Linguistics -->
										<!--<option value="LITURST"  > Liturgical Studies -->
										<!--<option value="LITURGIC"  > Liturgics -->
										<!--<option value="MOS"  > Management & Organizational St -->
										<!--<option value="MTP-MKTG"  > Marketing - Fanshawe -->
										<!--<option value="MATH"  > Mathematics -->
										<!--<option value="MME"  > Mech & Materials Engineering -->
										<!--<option value="MSE"  > Mechatronic Systems Engineerin -->
										<!--<option value="MIT"  > Media, Information &Technocult -->
										<!--<option value="MEDBIO"  > Medical Biophysics -->
										<!--<option value="MEDHINFO"  > Medical Health Informatics -->
										<!--<option value="MEDSCIEN"  > Medical Science -->
										<!--<option value="MEDIEVAL"  > Medieval Studies -->
										<!--<option value="MICROIMM"  > Microbiology & Immunology -->
										<!--<option value="MORALTHE"  > Moral Theology -->
										<!--<option value="MTP-MMED"  > Multimed Dsgn & Prod Fanshawe -->
										<!--<option value="MUSIC"  > Music -->
										<!--<option value="NEURO"  > Neuroscience -->
										<!--<option value="NURSING"  > Nursing -->
										<!--<option value="PASTTHEO"  > Pastoral Theology -->
										<!--<option value="PATHOL"  > Pathology -->
										<!--<option value="PERSIAN"  > Persian -->
										<!--<option value="PHARM"  > Pharmacology -->
										<!--<option value="PHILST"  > Philosophical Studies -->
										<!--<option value="PHILOSOP"  > Philosophy -->
										<!--<option value="PHYSICS"  > Physics -->
										<!--<option value="PHYSIOL"  > Physiology -->
										<!--<option value="POLISCI"  > Political Science -->
										<!--<option value="PORTUGSE"  > Portuguese -->
										<!--<option value="PSYCHOL"  > Psychology -->
										<!--<option value="REHABSCI"  > Rehabilitation Sciences -->
										<!--<option value="RELEDUC"  > Religious Education -->
										<!--<option value="RELSTUD"  > Religious Studies -->
										<!--<option value="RUSSIAN"  > Russian -->
										<!--<option value="SACRTHEO"  > Sacramental Theology -->
										<!--<option value="SCHOLARS"  > Scholars' Elective -->
										<!--<option value="SCIENCE"  > Science -->
										<!--<option value="SCICOMP"  > Scientific Computing -->
										<!--<option value="SOCLJUST"  > Social Justice & Peace Studies -->
										<!--<option value="SOCWORK"  > Social Work -->
										<!--<option value="SOCIOLOG"  > Sociology -->
										<!--<option value="SE"  > Software Engineering -->
										<!--<option value="SPANISH"  > Spanish -->
										<!--<option value="SPEECH"  > Speech -->
										<!--<option value="SPIRTHEO"  > Spiritual Theology -->
										<!--<option value="STATS"  > Statistical Sciences -->
										<!--<option value="SYSTHEO"  > Systematic Theology -->
										<!--<option value="THANAT"  > Thanatology -->
										<!--<option value="THEATRE"  > Theatre Studies -->
										<!--<option value="THEOETH"  > Theological Ethics -->
										<!--<option value="THEOLST"  > Theological Studies -->
										<!--<option value="THESIS"  > Thesis -->
										<!--<option value="TJ"  > Transitional Justice -->
										<!--<option value="VAHISTRY"  > Visual Arts History -->
										<!--<option value="VASTUDIO"  > Visual Arts Studio -->
										<!--<option value="WTC"  > Western Thought & Civilization -->
										<!--<option value="WOMENST"  > Women's Studies -->
										<!--<option value="WRITING"  > Writing -->
<!--</select>-->

<!--Changing Layout to look like Western exam schedules-->
<!--<select id="course" onChange=>-->
	<!--<option>Select Course Code</option>-->
	<!--<option id='course1'>Course2</option>-->
	<!--<option id='course2'>Course2</option>-->
	<!--<option>Course3</option>-->
	<!--<option>Course4</option>-->
	<!--<option>Course5</option>-->
<!--</select>-->

<!--<select id="section" onChange=>-->
	<!--<option>Select Section</option>-->
	<!--<option id=section1>Section1</option>-->
	<!--<option>Section2</option>-->
<!--</select>-->

<!--<form controller="CalendarController">-->
	<!--<select id="course" value="Select Subject"/>-->

<!--<actionSubmit value="ADD" action="addCourse"/>-->

<!--</form>-->

<!--<style>-->

	<!--body {-->
		<!--margin: 40px 10px;-->
		<!--padding: 0;-->
		<!--font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;-->
		<!--font-size: 14px;-->
	<!--}-->

	<!--#calendar {-->
		<!--max-width: 900px;-->
		<!--margin: 0 auto;-->
	<!--}-->

<!--</style>-->

<div id='calendar'></div>
<br/><br/>

</body>

</html>