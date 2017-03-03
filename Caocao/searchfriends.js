$(document).ready(function(){
  $.getJSON('courselist.json', function(data) {
      $.each(data.cliu567, function(item, f) {
        var cn=f.coursename;
         var tbl = "<p class='request1'>" + cn + "</p>";
         $("p").css({"background-color": "#003366", "font-size": "200%","color": "white","padding": "5px","font-family": "Arial",
       "width":"200", "height":"50",  "text-align":"center","border-radius": "15%"});
         $("p").attr('id', cn);
          $(tbl).appendTo("#small6");

          $("p").on('click',function(){
            $('p.request1').css({"background-color": "#003366", "font-size": "200%","color": "white","padding": "5px","font-family": "Arial",
          "width":"200", "height":"50",  "text-align":"center","border-radius": "15%"});
            var text=$(this).closest('p').contents().text();
            event.preventDefault();
          //alert( $(this).attr('id'));

          this.style.background="#004d00";
          $(function() {
          var courses = [];
          //var va=elmnt.alt;
          $.getJSON('courses.json', function(data) {
           $('#userdata tbody').empty();

             $.each(data.courses, function(item, f) {
               if(f.course==text){
                var tblRow = "<tr>" +
                 "<td>" + f.lastName + "</td>" + "<td> <button class='request'>Request</button> </td>" + "</tr>";
                 $(tblRow).appendTo("#userdata tbody");
               }
             });
          });
          });

                });

});

  });

  $("#userdata").on('click','.request',function(){
    var text=$(this).closest('td').siblings().contents().text();
    alert("Friend request to "+text+" have been send!");

    $.ajax({
      type       : "POST",
      url        : "url",
      data       : {username : JSON.stringify(text)},
      dataType   : 'json',
      success    : function(response) {
          alert('Works!');
      },
      error      : function() {
          alert('No working!');
      }
  });
  });
});

function search() {
  // Declare variables
  var input, filter, table, tr, td, i;
  input = document.getElementById("searchName");
  filter = input.value.toUpperCase();
  table = document.getElementById("userdata");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
