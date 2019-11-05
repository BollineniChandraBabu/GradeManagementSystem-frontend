<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset="ISO-8859-1">
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
function getter(){
var roles=(localStorage.getItem("role"));
if(roles=='Admin')
{
	$('#header').load('LoginHeader.jsp');
}
else if(roles=='User')
	{
	$('#header').load('userLoginHeader.jsp');
	}
else
	{
	$('#header').load('header.jsp');
	}
}
</script>
</head>
<body>
	<div id="header"></div>
	<h1 align="center">
		<img src="images/contact-us-banner.jpg" height=300 width=1100></img>
	</h1>
	<h3 align=center>
		<b>we want to hear from you</b>
	</h3>
	<br>
	<h5 align=center>
		<i>Have a question or an exciting new idea? Let's talk</i>
	</h5>
	<table class="table table-hover table-striped" width="100">
		<tr>
			<td align="center">Contact Us</td>
		</tr>
		<tr>
			<td align=center>General Email: info@revature.in</td>
		</tr>
		<tr>
			<td align=center>Academic Partners:universities@revature.in</td>
		</tr>
		<tr>
			<td align=center>Existing Users:support@revature.com</td>
		</tr>
		<tr>
			<td align=center>Chennai - India</td>
		</tr>
	</table>
	<jsp:include page="footer.html"></jsp:include>
</body>
<script>getter();</script>
</html>