<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Student Marks</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/options.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/viewGrades.js"></script>
<script>
function clearData()
{
	document.getElementById("viewmarks").innerHTML+="";	
}
function generateRandomString()
{
	document.getElementById("captcha").innerHTML="";
  var text = "";
  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  for (var i = 0; i < 6; i++)
    text += possible.charAt(Math.floor(Math.random() * possible.length));
  document.getElementById("captcha").innerHTML+="<b><label id='cap'>"+text+"</label> &nbsp;&nbsp; &nbsp;<input type='button' class='btn btn-primary btn-xs' onclick='generateRandomString()' value='re captcha'></b>";	
}

function checkCaptcha()
{
	 event.preventDefault();
	 let captcha = document.getElementById("cap").textContent;
	 let userCaptcha = document.getElementById("random").value;
    var result= captcha.localeCompare(userCaptcha)
    console.log("captcha :"+captcha +"  userCaptcha:"+userCaptcha +"  result:"+result);
	 if(result==0)
	 {
		 document.getElementById('viewmarks').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
		 generateRandomString();
		 getMarks();
		 	}
	 else
		 {
		 document.getElementById("viewmarks").innerHTML="Invalid Captcha";
		 document.getElementById("random").focus();
		 }
}
</script>
</head>
<body>
<jsp:include page="blogHeader.html"></jsp:include>
<div class=container >
	<div id='accordion'>
		<div class='card'>
			<div class='card-header'>
				<a class='card-link' data-toggle='collapse'>Examination Information Center</a>
			</div>
	<div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>
	<form method="post" onsubmit="checkCaptcha()" align="center">
						<div class="form-group">
						Enter Hall Ticket Number:
							<input type="number" class="form-control" name="student_id" id="studentid"
								placeholder="Enter Hall Ticket Number" required="required" maxlength=10>
						</div>
						
						<div class="form-group">
						<div id="captcha" align="center"></div>
							<input type="text" class="form-control" name="random" id="random"
								placeholder="Enter Captcha" required="required" >
						</div>
						
						
						<div class="form-group" align=center>
							<button type="submit" class="btn btn-primary btn-xs">Search</button>
							&nbsp;
							<button type="reset" class="btn btn-primary btn-xs" onclick="clearData()">clear</button>
						</div>
					</form>
<div id="viewmarks" align="center"></div>
	
	</div>
</div></div></div></div>
<div class="container">
	<div class="panel panel-default" align=center style="color: blue;">
  <div class="panel-body" >Any discrepancy in the result noted above must be brought to the notice of the Controller of Examinations.</div>
</div>
</div>
<div class="footer">
		<jsp:include page="footer.html"></jsp:include>
	</div>
</body>	

<script>
generateRandomString();
</script>



</html>