<!DOCTYPE html>
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

		events: {
			url: 'demos/php/get-events.php'
		},


		eventRender: function(event){
    		return (event.ranges.filter(function(range){
        		return (event.start.isBefore(range.end) && event.end.isAfter(range.start));
    		}).length)>0;
		}


    });


});


</script>
</head>

<body>


<h5>Courses</h5>

<g:select name="subjects" from="">
	<option>Select Subject</option>
	<!-- From Western Timetables -->

	<option value="ACTURSCI"  > Actuarial Sciences</option>
	<option value="AMERICAN"  > American Studies </option>
	<option value="ANATCELL"  > Anatomy and Cell Biology </option>
	<option value="ANTHRO"  > Anthropology </option>
	<option value="APPLMATH"  > Applied Mathematics </option>
	<option value="ARABIC"  > Arabic </option>
	<option value="ARTHUM"  > Arts and Humanities </option>
	<option value="ASTRONOM"  > Astronomy </option>
	<option value="BIBLSTUD"  > Biblical Studies </option>
	<option value="BIOCHEM"  > Biochemistry </option>
	<option value="BIOLOGY"  > Biology </option>
	<option value="BIOPHYS"  > Biophysics </option>
	<option value="BIOSTATS"  > Biostatistics </option>
	<option value="MTP-RADO"  > Broadcasting-Radio Fanshawe </option>
	<option value="MTP-TVSN"  > Broadcasting-TV Fanshawe </option>
	<option value="MTP-FLDP"  > Broadcasting-TV-Field Fanshawe </option>
	<option value="BUSINESS"  > Business Administration </option>
	<option value="CALCULUS"  > Calculus </option>
	<option value="CGS"  > Centre for Global Studies </option>
	<option value="CBE"  > Chem & Biochem Engineering </option>
	<option value="CHEMBIO"  > Chemical Biology </option>
	<option value="CHEM"  > Chemistry </option>
	<option value="CSI"  > Childhood & Social Institutns </option>
	<option value="CHINESE"  > Chinese </option>
	<option value="CHURCH"  > Church History </option>
	<option value="CHURLAW"  > Church Law </option>
	<option value="CHURMUSI"  > Church Music </option>
	<option value="CEE"  > Civil & Envrnmntl Engineering </option>
	<option value="CLASSICS"  > Classical Studies </option>
	<option value="CMBPROG"  > Combined Program Enrollment </option>
	<option value="COMMSCI"  > Communication Sci & Disorders </option>
	<option value="COMPLIT"  > Comparative Lit & Culture </option>
	<option value="COMPSCI"  > Computer Science </option>
	<option value="DANCE"  > Dance </option>
	<option value="MTP-DEVL"  > Development - Fanshawe </option>
	<option value="DIGICOMM"  > Digital Communication </option>
	<option value="DIGIHUM"  > Digital Humanities </option>
	<option value="DOL"  > Dimensions of Leadership </option>
	<option value="DISABST"  > Disability Studies </option>
	<option value="EARTHSCI"  > Earth Sciences </option>
	<option value="ECONOMIC"  > Economics </option>
	<option value="EELC"  > Education English Language Cen </option>
	<option value="ECE"  > Elect & Computer Engineering </option>
	<option value="ENGSCI"  > Engineering </option>
	<option value="ENGLISH"  > English </option>
	<option value="ENVIRSCI"  > Environmental Science </option>
	<option value="EPID"  > Epidemiology </option>
	<option value="EPIDEMIO"  > Epidemiology & Biostatistics </option>
	<option value="FAMLYSTU"  > Family Studies </option>
	<option value="FLDEDUC"  > Field Education </option>
	<option value="FILM"  > Film Studies </option>
	<option value="FINMOD"  > Financial Modelling </option>
	<option value="FRSTNATN"  > First Nations Studies </option>
	<option value="FOODNUTR"  > Foods and Nutrition </option>
	<option value="FRENCH"  > French </option>
	<option value="GEOGRAPH"  > Geography </option>
	<option value="GEOLOGY"  > Geology </option>
	<option value="GEOPHYS"  > Geophysics </option>
	<option value="GERMAN"  > German </option>
	<option value="GREEK"  > Greek </option>
	<option value="GPE"  > Green Process Engineering </option>
	<option value="HEALTSCI"  > Health Sciences </option>
	<option value="HEBREW"  > Hebrew </option>
	<option value="HINDI"  > Hindi </option>
	<option value="HISTTHEO"  > Historical Theology </option>
	<option value="HISTORY"  > History </option>
	<option value="HISTSCI"  > History of Science </option>
	<option value="HOMILET"  > Homiletics </option>
	<option value="HUMANECO"  > Human Ecology </option>
	<option value="INTEGSCI"  > Integrated Science </option>
	<option value="INTERDIS"  > Interdisciplinary </option>
	<option value="INTREL"  > International Relations </option>
	<option value="ITALIAN"  > Italian </option>
	<option value="JAPANESE"  > Japanese </option>
	<option value="JEWISH"  > Jewish Studies </option>
	<option value="MTP-BRJR"  > Journalism-Broadcasting Fanshw </option>
	<option value="KINESIOL"  > Kinesiology </option>
	<option value="LATIN"  > Latin </option>
	<option value="LAW"  > Law </option>
	<option value="LINGUIST"  > Linguistics </option>
	<option value="LITURST"  > Liturgical Studies </option>
	<option value="LITURGIC"  > Liturgics </option>
	<option value="MOS"  > Management & Organizational St </option>
	<option value="MTP-MKTG"  > Marketing - Fanshawe </option>
	<option value="MATH"  > Mathematics </option>
	<option value="MME"  > Mech & Materials Engineering </option>
	<option value="MSE"  > Mechatronic Systems Engineerin </option>
	<option value="MIT"  > Media, Information &Technocult </option>
	<option value="MEDBIO"  > Medical Biophysics </option>
	<option value="MEDHINFO"  > Medical Health Informatics </option>
	<option value="MEDSCIEN"  > Medical Science </option>
	<option value="MEDIEVAL"  > Medieval Studies </option>
	<option value="MICROIMM"  > Microbiology & Immunology </option>
	<option value="MORALTHE"  > Moral Theology </option>
	<option value="MTP-MMED"  > Multimed Dsgn & Prod Fanshawe </option>
	<option value="MUSIC"  > Music </option>
	<option value="NEURO"  > Neuroscience </option>
	<option value="NURSING"  > Nursing </option>
	<option value="PASTTHEO"  > Pastoral Theology </option>
	<option value="PATHOL"  > Pathology </option>
	<option value="PERSIAN"  > Persian </option>
	<option value="PHARM"  > Pharmacology </option>
	<option value="PHILST"  > Philosophical Studies </option>
	<option value="PHILOSOP"  > Philosophy </option>
	<option value="PHYSICS"  > Physics </option>
	<option value="PHYSIOL"  > Physiology </option>
	<option value="POLISCI"  > Political Science </option>
	<option value="PORTUGSE"  > Portuguese </option>
	<option value="PSYCHOL"  > Psychology </option>
	<option value="REHABSCI"  > Rehabilitation Sciences </option>
	<option value="RELEDUC"  > Religious Education </option>
	<option value="RELSTUD"  > Religious Studies </option>
	<option value="RUSSIAN"  > Russian </option>
	<option value="SACRTHEO"  > Sacramental Theology </option>
	<option value="SCHOLARS"  > Scholars' Elective </option>
	<option value="SCIENCE"  > Science </option>
	<option value="SCICOMP"  > Scientific Computing </option>
	<option value="SOCLJUST"  > Social Justice & Peace Studies </option>
	<option value="SOCWORK"  > Social Work </option>
	<option value="SOCIOLOG"  > Sociology </option>
	<option value="SE"  > Software Engineering </option>
	<option value="SPANISH"  > Spanish </option>
	<option value="SPEECH"  > Speech </option>
	<option value="SPIRTHEO"  > Spiritual Theology </option>
	<option value="STATS"  > Statistical Sciences </option>
	<option value="SYSTHEO"  > Systematic Theology </option>
	<option value="THANAT"  > Thanatology </option>
	<option value="THEATRE"  > Theatre Studies </option>
	<option value="THEOETH"  > Theological Ethics </option>
	<option value="THEOLST"  > Theological Studies </option>
	<option value="THESIS"  > Thesis </option>
	<option value="TJ"  > Transitional Justice </option>
	<option value="VAHISTRY"  > Visual Arts History </option>
	<option value="VASTUDIO"  > Visual Arts Studio </option>
	<option value="WTC"  > Western Thought & Civilization </option>
	<option value="WOMENST"  > Women's Studies </option>
	<option value="WRITING"  > Writing </option>

	<label>Course Code (e.g. CS2212) *Optional*</label>
	<g:textField name="course"/>

<g:actionSubmit value="SEARCH" action="searchCourse"/>
</g:select>

<br/><br/>

<g:form controller="CalendarController">
%{----}%
<g:actionSubmit value="ADD" action="addCourse"/>
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
<br/><br/>
<div id='calendar'></div>
</body>

</html>