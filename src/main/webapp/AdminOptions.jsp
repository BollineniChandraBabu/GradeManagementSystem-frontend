
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
	 content="<div class=container><br><br><br><form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
document.getElementById("viewdetails").innerHTML=content;
	     }
function viewBySubject(){
	 event.preventDefault();
	      var subjectcode = document.getElementById("subjectdetail").value;
	      var formData="subjectdetails=" +subjectcode.trim(); 
	         console.log(formData);
	     var url ="http://localhost:8080/GMS-api/FrontController/viewBySubject.do?"+formData;
	    $.get(url, function(response){
	        console.log(response);
	        var data=JSON.parse(response);
	        var content;
	  	 content="<div class=container><br><br><br><form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
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
	      var url ="http://localhost:8080/GMS-api/FrontController/viewAvailableSubjects.do";
	    $.get(url, function(response){
	        console.log(response);
	        var data=JSON.parse(response);
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
	     
function viewEmployees(){
    event.preventDefault();
  
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
var url ="http://localhost:8080/GMS-api/FrontController/viewEmployees.do";
    $.get(url, function(response){
        console.log(response);
       var data=JSON.parse(response);
       var content;
       checkDepartments();
       content="<br><br><div id='dept'> </div><br><table class='table table-hover' border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Email</th><th>Date of joining</th><th>Department</th></tr>";
       for( let users of data)
		{
			content+="<tr><td>"+users.id+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.email+"</td><td>"+users.dateOfJoining+"</td><td>"+users.department.name+"</td></tr>";
           }
       
       content+="</table>"
       document.getElementById("viewdetails").innerHTML=content;
     });
    }
function checkDepartments(){
	
	var url ="http://localhost:8080/GMS-api/FrontController/viewDepartments.do";
    $.get(url, function(response){
    	data=JSON.parse(response);
    	console.log(data);
    	var content="";
    	
    	content +="Select subject :<select class='custom-select custom-select-sm' id='bydept' onchange='viewEmployeesByDept()'>";
    	content+="<option value='0'>--select--</option>";
    	content+="<option value='all'>View All</option>";
    	for(let department of data)
    		{
    		
    		content+="<option value="+department.name+">"+department.name+"</option>";
    		}
       content+=" </select><p id='viewdetails'>";
       document.getElementById("dept").innerHTML=content;
     });
    }
function viewEmployeesByDept(){
	
    event.preventDefault();
var url ="http://localhost:8080/GMS-api/FrontController/viewEmployees.do";
    $.get(url, function(response){
        console.log(response);
       var data=JSON.parse(response);
       var content;
     
  	var checkgrade = document.getElementById("bydept").value;
     content="<br><div id='dept'></div><br><table class='table table-hover' border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Email</th><th>Date of joining</th><th>Subject</th></tr>";
    

     for( let users of data)
		{
    	 if(checkgrade==='all')
         {
    	 viewEmployees();
			break;
         }
   		if(users.department.name===checkgrade)
			content+="<tr><td>"+users.id+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.email+"</td><td>"+users.dateOfJoining+"</td><td>"+users.department.name+"</td></tr>";
           }
       content+="</table>"
    	   checkDepartments();
       document.getElementById("viewdetails").innerHTML=content;
     });
    }

function viewStudents(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
var url ="http://localhost:8080/GMS-api/FrontController/viewStudents.do";
    $.get(url, function(response){
        console.log(response);
       var data=JSON.parse(response);
       var content;
       content="<br><br><br><table class='table table-hover' border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Address</th><th>Date of Birth</th></tr>";
       for( let users of data)
		{
			content+="<tr><td>"+users.registrationNumber+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.Address+"</td><td>"+users.dateOfBirth+"</td></tr>";
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
    console.log(content);
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

<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">

	
	<div class="vertical-menu">
	
 <a href="" onclick="viewGrade()">View grade range</a>
 <a href="" onclick="viewTop()">View topper Score</a>
 <a href="" onclick="viewBySubjects()">Search by subject ID/Name</a>
 <a href="AddNewEmployee.jsp" >Add Employee</a>
 <a href="" onclick="viewEmployees()">View all Employee's</a>
 <a href="AddNewStudent.jsp" >Add Student</a>
 <a href="" onclick="viewStudents()">View all students</a>
  <a href="" onclick="viewbyid()">View student Marks</a>
    <a href="" onclick="viewbygrade()">View Marks By Grade</a>
 <a href="" onclick="viewallmarks2()">View all students Marks</a>
 <div id="output"></div>
</div>

</body>
<script>
displayName();</script>
</html>
