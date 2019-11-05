
<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/options.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/viewGrades.js"></script>
<script>
/*function viewBySubjects(){
	 event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/squarespace-logo-symbol-black.gif" width=300px height=150px/>';
  var content;
	 content="<div class=container><br><form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject Id/name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
document.getElementById("viewdetails").innerHTML=content;
	     }
	     
function viewBySubject(){
	 event.preventDefault();
	      var subjectcode = document.getElementById("subjectdetail").value;
	      var formData="subjectdetails=" +subjectcode.trim(); 
	         console.log(formData);
	     var url ="http://localhost:9000/viewBySubject?"+formData;
	    $.get(url, function(response){
	        console.log(response);
	        var data=response;
	        var content;
	  	 content="<div class=container><br><br><br><form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject Id/name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
	        if(data.length!=0)
	       {
	       for( let mark of data)
			{ 
	       content+="<table border=1><tr><th>Student ID</th><th>Student Name</th><th>Subject Name</th><th>Marks</th><th>Grade</th></tr>";
			break;}
		
		for( let mark of data)
			{
			content +="<tr><td>"+mark.student.id +"</td><td>"+mark.student.name+"</td><td>"+mark.subjects.name+"</td><td>"+mark.marks+ "</td><td>"+mark.grade+"</td></tr>";
			}

	       document.getElementById("viewdetails").innerHTML=content;
	     }
	     else
	     {
	      var url ="http://localhost:9000/viewAvailableSubjects";
	    $.get(url, function(response){
	        console.log(response);
	        var data=response;
	    	content+="<br><h3>subject not available.....<br></h3>select from available options...";
	     	content+="<table border=1><tr><th>Subject ID</th><th>Subject Name</th></tr>";
	     	for( let subject of data)
			{
			content +="<tr><td>"+subject.id +"</td><td>"+subject.name+"</td></tr>";
			}
	     	content+="</table>";
	     	
	     	
	      document.getElementById("viewdetails").innerHTML=content;
	      });}
	      
	     });
	     }
	*/
	function viewBySubjects(){
		 event.preventDefault();
		  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
	  var content;
	  content="<div class=container><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Search by Subject ID/Name....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
		 content+="<form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
	document.getElementById("viewdetails").innerHTML=content;
		     }
	function viewBySubject(){
		 event.preventDefault();
		      var subjectcode = document.getElementById("subjectdetail").value;
		         console.log(subjectcode);
				var n;
			         try{
			        	 n=parseInt(subjectcode);
			        	 console.log("n: "+n);
			        	 if(!isNaN(n)){
			        	 var formData="subjectdetails=" +n; 
			       	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
			        	 var url ="http://localhost:9000/viewBySubjectCode?"+formData;}
			        	 else
				        	 {
			        		 var subjectname = document.getElementById("subjectdetail").value;
			        		 console.log("subjectcode: "+subjectname);
				        	 var formData="subjectdetails=" +subjectname; 
					       	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
				        	 var url ="http://localhost:9000/viewBySubjectName?"+formData;
				        	 }
			        	 }
		        	 catch(err){
		        		  var url ="http://localhost:9000/viewAvailableSubjects";
		        		    $.get(url, function(response){
		        		        console.log(response);
		        		        var data=response;
		        		    	content+="<br><h3>subject not available.....<br></h3>select from available options...";
		        		     	content+="<table border=1><tr><th>Subject ID</th><th>Subject Name</th></tr>";
		        		     	for( let subject of data)
		        				{
		        				content +="<tr><td>"+subject.id +"</td><td>"+subject.name+"</td></tr>";
		        				}
		        		     	content+="</table>";
		        		     	
		        		     	
		        		      document.getElementById("viewdetails").innerHTML=content;
		        		      });
		        		}
		    $.get(url, function(response){
		        console.log(response);
		        var data=response;
		        var content;
		        content="<div class=container><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Search by Subject ID/Name....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
		  	 content+="<form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div></div></div></div></div></div>"      
		        if(data.length!=0)
		       {
		       for( let mark of data)
				{ 
			       content+="<table class=table table-hover border=1><tr><th>Student ID</th><th>Student Name</th><th>Subject Name</th><th>Marks</th><th>Grade</th></tr>";
				break;}
			
			for( let mark of data)
				{
				
				content +="<tr><td>"+mark.student.registrationNumber +"</td><td>"+mark.student.name+"</td><td>"+mark.subjects.name+"</td><td>"+mark.marks+ "</td><td>"+calgrade(mark.marks);+"</td></tr>";
				
				}

		       document.getElementById("viewdetails").innerHTML=content;
		     }
		     else
		     {
		      var url ="http://localhost:9000/viewAvailableSubjects";
		    $.get(url, function(response){
		        console.log(response);
		        var data=response;
		    	content+="<br><h3>subject not available.....<br></h3>select from available options...";
		     	content+="<table class=table table-hover border=1><tr><th>Subject ID</th><th>Subject Name</th></tr>";
		     	for( let subject of data)
				{
				content +="<tr><td>"+subject.id +"</td><td>"+subject.name+"</td></tr>";
				}
		     	content+="</table>";
		     	
		     	
		      document.getElementById("viewdetails").innerHTML=content;
		      });}
		      
		     });
		     }     
function viewEmployees(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/1.gif" width=300px height=150px/>';
var url ="http://localhost:9000/viewEmployees";
    $.get(url, function(response){
        console.log(response);
       var data=response;
       var content;
       content="<br><table border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Email</th><th>Date of joining</th><th>Department</th></tr>";
       for( let users of data)
		{
			content+="<tr><td>"+users.id+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.email+"</td><td>"+users.dateOfJoining+"</td><td>"+users.department.name+"</td></tr>";
           }
       content+="</table>"
       document.getElementById("viewdetails").innerHTML=content;
     });
    }
     
function displayName()
{
    var user=(localStorage.getItem("userdata"));
    console.log(user);
    var content=user;
    content+=" (Employee)"
    console.log(content);
    document.getElementById("welcome").innerHTML="Welcome......     " + content;
   return name;
}


function viewGrades()
{
	    event.preventDefault();
		  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
	    var url ="http://localhost:9000/viewgrade";
	    $.get(url, function(response){
	        console.log(response);
	       var data=response;
	       var content="";
		       content+="<div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' ><center>Available Grade Range....</center></a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
		       content+="<table class='table table-hover' border=1><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
		for( let grades of data)
			{
			content +="<tr><td>"+grades.grade +"</td><td>"+grades.minMark+"</td><td>"+grades.maxMark+ "</td></tr>";
			}       
	       document.getElementById("viewdetails").innerHTML=content;
	     });
	    }
</script>

</head>
<body>

	<div class="vertical-menu">
		<a href="" onclick="viewGrades()">View grade range</a> <a href=""
			onclick="viewTop()">View topper Score</a> <a href=""
			onclick="viewBySubjects()">Search by Subject ID/Name</a> <a
			href="updatemarks.jsp">Add Student Marks</a> <a href=""
			onclick="viewStudents()">View all Students</a> <a href=""
			onclick="viewbyid()">View student Marks</a> <a href=""
			onclick="viewbygrade()">View Marks By Grade</a> <a href=""
			onclick="viewallmarks2()">View all students Marks</a>
		<div id="output"></div>
	</div>

</body>
<script>displayName();</script>
</html>
