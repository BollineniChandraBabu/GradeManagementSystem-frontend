<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
function callModal()  
{  
	 $("#myModal").modal();
}  
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Sign Up</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="registerServlet" method="post">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" name="name"
									placeholder="name" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="email" class="form-control" name="username"
									placeholder="Username" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" name="password"
									placeholder="Password" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="date" class="form-control" name="Date Of Birth"
									placeholder="Date Of Birth" min="2000-01-01" max="2019-11-19"
									required="required">
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock"></i></span>
									<input type="number" class="form-control" name="mobile"
										placeholder="mobile" min="6900000000" max="9999999999"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block btn-lg">Sign
									Up</button>
							</div>
					</form>
				</div>
				<div class="modal-footer">
					have an account? <a href="newLogin.jsp">Sign In</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script>callModal();</script>
</html>