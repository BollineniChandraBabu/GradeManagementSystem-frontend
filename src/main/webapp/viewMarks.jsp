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
  <script type="text/javascript">
      function get_action() 
      {
          var v = grecaptcha.getResponse();
          if(v.length == 0)
          {
              return false;
          }
          else
          {
              return true; 
          }
      }
    </script>

<script>
function checkCaptcha()
{
	 event.preventDefault();
	 let result = get_action();
	
	 if(result==0)
	 {
		 document.getElementById("viewmarks").innerHTML="You can't leave Captcha Code empty";
		 	}
	 else
		 {
		 document.getElementById('viewmarks').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
		 grecaptcha.reset();
		 getMarks();
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
						<div class="g-recaptcha" align="center" data-sitekey="6LcafcEUAAAAALxQKwXQYXT0qaoh9UkMhYFLUcs9"></div>
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
<!-- The defer attribute tells the browser that it should go on working with the page, and load the script in background, then run the script when it loads.-->
<!--async: script is completely independent, The page doesn’t wait for async scripts-->
<script src="https://www.google.com/recaptcha/api.js" async defer>
</script>
</html>