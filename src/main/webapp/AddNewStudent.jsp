
<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
function msg()  
{  
	 $("#myModal").modal();
}  
</script>
<script>
function AddNewStudent(){
    event.preventDefault();
    var name = document.getElementById("name").value;
    var fathername = document.getElementById("fathername").value;
  	var dob = document.getElementById("dob").value;
    var department = document.getElementById("department").value;
    var address = document.getElementById("address").value;
    var formData ="name=" + name + "&fathername=" + fathername+ "&dob=" + dob + "&department=" + department+ "&address=" + address;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/addStudent.do?"+ formData;
    $.get(url, function(response){
        console.log("AddNewstudent:"+response);
       var data=JSON.parse(response);
       if(data!=null){
			document.getElementById("registermsg").innerHTML="successfully added.....<br><b>Student ID:"+data;
           }

     });
    }


function checkDepartment(){
    event.preventDefault();
  	var department = document.getElementById("department").value;
    var formData ="department=" + department;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/checkDepartment.do?"+ formData;
    $.get(url, function(response){
       var data=JSON.parse(response);
       if(data.result==false){
    	   document.getElementById("registermsg").innerHTML="department doesn't exist....";
    	   document.getElementById("department").focus();
       }
       else
           {
    	   document.getElementById("registermsg").innerHTML="";
           }
     });
    }


function checkName()
{
	var name=document.getElementById("name").value;
	var nameRegex= /^[A-Za-z\s]*$/;
	if(nameRegex.test(name))
	{
	document.getElementById("registermsg").innerHTML="";
	}
else
	{
	document.getElementById("registermsg").innerHTML="enter alphabets only";
	   document.getElementById("name").focus();
	}
}

function checkFName()
{
	var name=document.getElementById("fathername").value;
	var nameRegex= /^[A-Za-z\s]*$/;
	if(nameRegex.test(name))
	{
	document.getElementById("registermsg").innerHTML="";
	}
else
	{
	document.getElementById("registermsg").innerHTML="enter alphabets only";
	   document.getElementById("fathername").focus();
	}
}

</script>
<script>
funtion getMaxdate()
{
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 

	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("datefield").setAttribute("max", today);
}
</script>


</head>
<body>
	<jsp:include page="AdminLogin.jsp"></jsp:include>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Add Student</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="registermsg" align=center style="color: red;"></div>
					<form method="post" onsubmit="AddNewStudent()">
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								id="name" placeholder="Student name" required="required" onfocusout="checkName()">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="fathername"
								id="fathername" placeholder="Student father name" required="required" onfocusout="checkFName()">
						</div>
						<div class="form-group">
							<input type="date" class="form-control" name="dob" id="dob" required="required">
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" name="department" id="department"
								placeholder="department" value='1' required="required" onfocusout="checkDepartment()">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="address" id="address"
								placeholder="enter student address" required="required">
						</div>
						
						<div class="form-group" align=center>
							<button type="submit" class="btn btn-primary btn-xs">submit</button>
							&nbsp;
							<button type="reset" class="btn btn-primary btn-xs">clear</button>
						</div>					
					</form>
				</div>			
			</div>
		</div>
	</div>
</body>
<script>msg();</script>
<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear()-'5';
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

var todayStr = yyyy+'-'+mm+'-'+dd;
document.getElementById("dob").setAttribute("max", todayStr);
var minyyyy = today.getFullYear()-'20';

mintoday = minyyyy+'-'+mm+'-'+dd;
document.getElementById("dob").setAttribute("min", mintoday);

</script>

</html>