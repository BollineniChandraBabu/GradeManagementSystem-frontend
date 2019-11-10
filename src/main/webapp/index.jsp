
<!DOCTYPE html>
<html lang='en'>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/look.css">
<script type="text/javascript" src="js/viewGrades.js"></script>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();"
	onUnload="">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">

		<marquee>
			<h2>
				<b><i>welcome to grade management system.....</i></b>
			</h2>
		</marquee>
	</div>
</body>
<div id="logoutmsg" align="center" style="color: green;"></div>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="footer.html"></jsp:include>

</html>