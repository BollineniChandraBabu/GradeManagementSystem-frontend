
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
function AddNewEmployee(){
    event.preventDefault();
    var name = document.getElementById("name").value;
    var fathername = document.getElementById("fathername").value;
  	var email = document.getElementById("email").value;
    var department = document.getElementById("department").value;
    var formData ="name=" + name + "&fathername=" + fathername+ "&email=" + email + "&department=" + department;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/addEmployee.do?"+ formData;
    $.get(url, function(response){
        console.log("AddNewEmployee:"+response);
       var data=JSON.parse(response);
       if(data!=null){
			document.getElementById("registermsg").innerHTML="successfully added.....<br><b>Employee ID:"+data;
           }

     });
    }

function checkEmail(){
    event.preventDefault();
  	var email = document.getElementById("email").value;
    var formData ="email=" + email;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/checkEmail.do?"+ formData;
    $.get(url, function(response){
       var data=JSON.parse(response);
       if(data.result){
    	   document.getElementById("registermsg").innerHTML="email id already exist....";
    	   document.getElementById("email").focus();
       }
       else
       {
	   document.getElementById("registermsg").innerHTML="";
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
	var nameRegex=/^[A-Za-z]*$/;
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
	var nameRegex=/^[A-Za-z]*$/;
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
</head>
<body>
	<jsp:include page="AdminLogin.jsp"></jsp:include>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Add new Employee</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="registermsg" align=center style="color: red;"></div>
					<form method="post" onsubmit="AddNewEmployee()">
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								id="name" placeholder="employee name" required="required" onfocusout="checkName()">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="fathername"
					id="fathername" placeholder="employee father name" required="required" onfocusout="checkFName()">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="email" required="required" onfocusout="checkEmail()">
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="department" id="department"
								placeholder="department" required="required" onfocusout="checkDepartment()">
						</div>
						<div class="form-group" align=center>
							<button type="submit" class="btn btn-primary btn-xs">Submit
								</button>
							&nbsp
							<button type="reset" class="btn btn-primary btn-xs">clear</button>
						</div>					
					</form>
				</div>			
			</div>
		</div>
	</div>
</body>
<script>msg();</script>
</html>
