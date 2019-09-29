<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
		<marquee>
			<h2>Grade Management system</h2>
		</marquee>

		<a href="#login" data-toggle="modal">Login</a>
		<div class="modal fade" id="login" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>

						<form method="post" action="/loginController" align=center>
							<table bgcolor="#00FF00" ; align=center class="table table-hover"
								class="table table-condensed">
								<tr>
									<td>User Id:</td>
									<td><input type="email" name="email"
										placeholder="example@gmail.com" required autofocus></td>
								</tr>
								<tr>
									<td>Password</td>
									<td><input type="password" name="password"
										placeholder="********" required></td>
								</tr>
								<tr>
									<td colspan=2 align=center><input type="reset"
										class="btn btn-info btn-xs" value="reset">&nbsp&nbsp<input
										type="button" class="btn btn-info btn-xs" value="submit"
										onclick="validateDetails()"></td>
								</tr>
							</table>
						</form>


					</div>

				</div>
			</div>

		</div>
</body>
</html>
