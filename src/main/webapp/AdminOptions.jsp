
<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/viewGrades.js"></script>
<script>
function viewBySubjects(){
	 event.preventDefault();
	   
  var content;
	 content="<div class=container><br><br><br><form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject code/name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
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
	  	 content="<div class=container><br><br><br><form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject code/name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
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
var url ="http://localhost:8080/GMS-api/FrontController/viewEmployees.do";
    $.get(url, function(response){
        console.log(response);
       var data=JSON.parse(response);
       var content;
       content="<br><br><br><table border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Email</th><th>Date of joining</th><th>Department</th></tr>";
       for( let users of data)
		{
			content+="<tr><td>"+users.id+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.email+"</td><td>"+users.dateOfJoining+"</td><td>"+users.department.name+"</td></tr>";
           }
       content+="</table>"
       document.getElementById("viewdetails").innerHTML=content;
     });
    }
function viewStudents(){
    event.preventDefault();
var url ="http://localhost:8080/GMS-api/FrontController/viewStudents.do";
    $.get(url, function(response){
        console.log(response);
       var data=JSON.parse(response);
       var content;
       content="<br><br><br><table border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Address</th><th>Date of Birth</th></tr>";
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



function viewallmarks2(){
    event.preventDefault();
    var url ="http://localhost:8080/GMS-api/FrontController/viewallmarks.do";
    $.get(url, function(response){
        console.log(response);
        var data=JSON.parse(response);
        var content;
        content="<br><br><br><table class='table table-hover' border=1>" ;
        var sid=0;
        var count=0;
        var total=0;
        for( let mark of data){
		try{	if(sid!==parseInt(mark.student.registrationNumber)){
				if(total!=0)
					{
					console.log("count :"+count)
					var sum=Math.ceil(total/6);
					 var grade=calgrade(sum);
					
					console.log("return:" +grade);
					content+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
					content+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
					 localStorage.removeItem("grade");
					total=0;
					count=0;
					}
            sid=parseInt(mark.student.registrationNumber);
        	content += "<tr><th>Student ID</th><th>"+mark.student.registrationNumber +"</th><th>Name</th><th>"+mark.student.name +"</th></tr>";
			content+=  "<tr><th colspan=2>Subject Name</th><th colspan=2>Marks Secured</th></tr>";
    		
        	++count;
			}
			content+=  "<tr><th colspan=2>"+mark.subjects.name +"</th><th colspan=2>"+mark.marks  +"</th></tr>";
			total +=mark.marks;
  		  }
		  catch(error){console.error(error);}}
        content+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
        console.log("count :"+count)
		var sum=Math.ceil(total/6);
		 var grade=calgrade(sum);
		content+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
		 localStorage.removeItem("grade");
    content+="</table>"
        document.getElementById("viewdetails").innerHTML=content;
    });
     }
</script>


</head>
<body>
	<h5 style="color: blue;" align="center"><div id="welcome"></div></h5>
	
	
	<br>
	<br>
	<a href="" onclick="viewGrade()">View grade range</a>
	<br>
	<a href="" onclick="viewTop()">View topper Score</a>
	<br>
	<a href="" onclick="viewBySubjects()">View by subject</a>
	<br>
	<a href="AddNewEmployee.jsp" >Add Employee</a>
	<br>
	<a href="" onclick="viewEmployees()">View all Employee's</a>
	
	<br>
	<a href="AddNewStudent.jsp" >Add Student</a>
	<br>
	<a href="" onclick="viewStudents()">View all students</a>
	
	<br>
	<a href="" onclick="viewallmarks2()">View all Marks</a>
	
	<div id="output"></div>


</body>
<script>displayName();</script>
</html>
