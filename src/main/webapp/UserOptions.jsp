
<!DOCTYPE html>
<html lang='en'>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/options.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/viewGrades.js"></script>
<script>    
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
