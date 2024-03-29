<!DOCTYPE html>
<html lang="en">
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
var url ="http://localhost:9000/addEmployee?"+ formData;
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
var url ="http://localhost:9000/checkEmail?"+ formData;
    $.get(url, function(response){
       var data=response;
       console.log(data);
       if(data){
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
	var url ="http://localhost:9000/viewDepartments";
    $.get(url, function(response){
    	data=response;
    	console.log(data);
    	let content="";
    	content +="Select Department :<select class='custom-select custom-select-sm' id='department'>";
    	for(let department of data)
    		{
    		content+="<option value="+department.id+">"+department.name+"</option>";
    		}
       content+=" </select>";
       document.getElementById("dept").innerHTML=content;
     });
    }
	
</script>
</head>
<body>
	<jsp:include page="AdminLogin.jsp"></jsp:include>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Add Employee</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="registermsg" align=center style="color: red;"></div>
					<form method="post" onsubmit="AddNewEmployee()">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="name" pattern="^[A-Za-z\s]*$" title="Name should contain alphabets only"
								placeholder="employee name" required="required">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="fathername" pattern="^[A-Za-z\s]*$" title="Name should contain alphabets only"
								id="fathername" placeholder="employee father name"
								required="required">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="email" required="required"
								onfocusout="checkEmail()">
						</div>
						<div class="form-group" id="dept"></div>
						<div class="form-group" align=center>
							<button type="submit" class="btn btn-primary btn-xs">Submit
							</button>
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
<script>checkDepartment();</script>
</html>
