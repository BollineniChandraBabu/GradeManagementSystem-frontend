
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

function getStudents(){
    let url ="http://localhost:9000/viewStudents";
    $.get(url, function(response){
    	data=response;
    	console.log(data);
    	let content="";
    	content +="<select class='custom-select custom-select-sm' id='id'>";
    	for(let students of data)
    		{
    		console.log(students.registrationNumber+students.name);
    		content+="<option value="+students.registrationNumber+">"+students.name+"</option>";
    		}
       content+=" </select>";
       document.getElementById("student").innerHTML=content;
    });  
}
function getSubjects(){
    let url ="http://localhost:9000/viewAvailableSubjects";
    $.get(url, function(response){
    	data=response;
    	console.log(data);
    	let content="";
    	content +="<select class='custom-select custom-select-sm' id='subject'>";
    	for(let students of data)
    		{
    		console.log(students.id+students.name);
    		content+="<option value="+students.id+">"+students.name+"</option>";
    		}
       content+=" </select>";
       document.getElementById("subjects").innerHTML=content;
    });  
}
/*
function checksubjectId(){
    event.preventDefault();
    var subject = document.getElementById("subject").value;
    var formData="subjectdetails=" +subject.trim(); 
       console.log(formData);
   var url ="http://localhost:8080/GMS-api/FrontController/checkSubject.do?"+formData;
  $.get(url, function(response){
      console.log(response);
      var data=JSON.parse(response);
      var content;
      if(data!=null)
      {
    	   document.getElementById("marksinsertmsg").innerHTML="Subject Name: "+data.name ;
       }
       else
           {
    	   document.getElementById("marksinsertmsg").innerHTML="subject not available...";
    	   document.getElementById("subject").focus();
           }
     });
    }
*/
function insertMarks(){
    event.preventDefault();
	var id = document.getElementById("id").value;
    var subject = document.getElementById("subject").value;
	var marks = document.getElementById("marks").value;
    var formData="subjectdetails=" +subject.trim()+"&id=" +id +"&marks=" +marks; 
       console.log(formData);
   var url ="http://localhost:9000/insertMarks?"+formData;
   console.log(url);
  $.get(url, function(response){
      console.log(response);
      var data=response;
      if(data)
      {
    	   document.getElementById("marksinsertmsg").innerHTML="successfully added..." ; 
       }
       else
           {
    	   document.getElementById("marksinsertmsg").innerHTML="successfully updated...";
           }
     }).fail(function() {
  	   document.getElementById("marksinsertmsg").innerHTML="Marks Available";
     });
    }


</script>
<script>


</script>
</head>
<body>
	<jsp:include page="UserLogin.jsp"></jsp:include>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">update student marks</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="marksinsertmsg" align=center style="color: red;"></div>
					<form method="post" onsubmit="insertMarks()">
						<div class="form-group" id="student"></div>
						<div class="form-group" id="subjects"></div>
						<div class="form-group">
							<input type="number" class="form-control" name="marks" id="marks"
								placeholder="marks" required="required" min=0 max=100>
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
<script>getStudents();</script>
<script>getSubjects();</script>
</html>