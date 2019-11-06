
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
		        		  if(n!=subjectcode){ throw "exception";}
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
	        		        var content="";
	        		        content="<div class=container><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Search by Subject ID/Name....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
	        			  	 content+="<form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div></div></div></div></div></div>"      
	        			        		        
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
  
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
var url ="http://localhost:9000/viewEmployees";
    $.get(url, function(response){
        console.log(response);
       var data=response;
       var content;
       checkDepartments();
       content="<br><br><div id='dept'> </div>";
       content+="<div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' >Viewing Available Employee's Details....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
         content+="<table class='table table-hover' border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Email</th><th>Date of joining</th><th>Department</th></tr>";
       for( let users of data)
		{
    	   let date = new Date( Date.parse(users.dateOfJoining) );
    	   var days = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
    	    var months = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
    	    	   
			content+="<tr><td>"+users.id+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.email+"</td><td>"+date.getDate()+"-"+ months[date.getMonth()]+"-"+date.getFullYear()+"</td><td>"+users.department.name+"</td></tr>";
           }
       
       content+="</table>"
       document.getElementById("viewdetails").innerHTML=content;
     });
    }
function checkDepartments(){
	
	var url ="http://localhost:9000/viewDepartments";
    $.get(url, function(response){
    	data=response;
    	console.log(data);
    	var content="";
    	content+="  <div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' >Select subject....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
    	content +="<select class='form-control' id='bydept' onchange='viewEmployeesByDept()'>";
    	content+="<option value='0'>--select--</option>";
    	content+="<option value='all'>View All</option>";
    	for(let department of data)
    		{
    		
    		content+="<option value="+department.name+">"+department.name+"</option>";
    		}
       content+=" </select><p id='viewdetails'></div></div>";
       document.getElementById("dept").innerHTML=content;
     });
    }
function viewEmployeesByDept(){
    event.preventDefault();
var url ="http://localhost:9000/viewEmployees";
    $.get(url, function(response){
        console.log(response);
       var data=response;
       var content;    
  	var checkgrade = document.getElementById("bydept").value;
    content="<br><br><div id='dept'> </div>";
    content+="<div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' >Viewing Available Employee's Details based on subject "+checkgrade.toLowerCase()+"....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
    content+="<table class='table table-hover' border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Email</th><th>Date of joining</th><th>Subject</th></tr>";
     for( let users of data)
		{
    	 if(checkgrade==='all')
         {
    	 viewEmployees();
			break;
         }
   		if(users.department.name===checkgrade){
     	   let date = new Date( Date.parse(users.dateOfJoining) );
    	   var days = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
    	    var months = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");

			content+="<tr><td>"+users.id+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.email+"</td><td>"+date.getDay()+"-"+ months[date.getMonth()]+"-"+date.getFullYear()+"</td><td>"+users.department.name+"</td></tr>";


	   		} }
       content+="</table>"
    	   checkDepartments();
       document.getElementById("viewdetails").innerHTML=content;
     });
    }

function displayName()
{
    var user=(localStorage.getItem("userdata"));
    var content=user;
    content+=" (ADMIN)"
    document.getElementById("welcome").innerHTML="Welcome......     " + content;
   return name;
}
</script>

<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
</head>
<!--onLoad=onLoading a page it will call that method onpageshow=it will execute when page is showing-->
<!-- The persisted property returns a Boolean value that indicates if the webpage is loaded directly from the server, or if the page is cached, when an onpageshow or onpagehide event occurs. -->
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" >
	<div class="vertical-menu"><br><br>
		<a href="" onclick="viewGrade()">View/Upgrade grade range</a>
		 <a	href="" onclick="viewTop()">View topper Score</a> 
		 <a href="" onclick="viewBySubjects()">Search by subject ID/Name</a> 
		 <a	href="AddNewEmployee.jsp">Add Employee</a> 
		 <a href=""	onclick="viewEmployees()">View all Employee's</a> 
		 <a	href="AddNewStudent.jsp">Add Student</a> 
		 <a href=""	onclick="viewStudents()">View all students</a> 
		 <a href="" onclick="viewbyid()">View student Marks</a> 
		 <a href=""	onclick="viewbygrade()">View Marks By Grade</a> 
		 <a href="" onclick="viewallmarks2()">View all students Marks</a>
		<div id="output"></div>
	</div>
</body>
<script>
displayName();</script>
</html>
