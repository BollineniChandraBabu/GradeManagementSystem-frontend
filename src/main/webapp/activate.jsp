
<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
 <script src="js/aes.js"></script>
<script>
	function msg() {
		$("#myModal").modal();
	}
</script>
<script>
	function activateEmployee() {
		event.preventDefault();
		var id = document.getElementById("eid").value;
		var email = document.getElementById("email").value;
		var password = document.getElementById("password").value;
		 var hash = CryptoJS.MD5(password);
		var formData = "eid=" + id + "&email=" + email + "&password="+hash;
		console.log(formData);
		var url = "http://localhost:9000/activateEmployee?" + formData;
		$
				.get(
						url,
						function(response) {
							console.log("AddNewEmployee:" + response);
							var data = response;
							if (data) {
								document.getElementById("activatemsg").innerHTML = "successfully activated....";
							}

						});
	}

	function checkEmail() {
		event.preventDefault();
		var email = document.getElementById("email").value;
		var formData = "email=" + email;
		console.log(formData);
		var url = "http://localhost:9000/checkEmail?" + formData;
		$
				.get(
						url,
						function(response) {
							var data = response;
							console.log(response);
							if (data) {
								document.getElementById("activatemsg").innerHTML = "";
							} else {
								document.getElementById("activatemsg").innerHTML = "email doesn't exist....";
								document.getElementById("email").focus();
							}
						});
	}
	function checkdetails() {
		event.preventDefault();
		var eid = document.getElementById("eid").value;
		var email = document.getElementById("email").value;
		var formData = "email=" + email + "&eid=" + eid;
		console.log(formData);
		var url = "http://localhost:9000/checkdetails?" + formData;
		$
				.get(
						url,
						function(response) {
							var data = response;
							console.log(response);
							if (data) {
								document.getElementById("activatemsg").innerHTML = "";
							} else {
								document.getElementById("activatemsg").innerHTML = " ID and email doesn't match....";
								document.getElementById("eid").focus();
							}
						});
	}

	function checkpassword() {
		event.preventDefault();
		var password = document.getElementById("password").value;
		var cpassword = document.getElementById("cpassword").value;
		if (password != cpassword) {
			document.getElementById("activatemsg").innerHTML = "password and confirm password should be same";
			document.getElementById("cpassword").focus();
			document.getElementById("activate").disabled = true;
		} else {
			document.getElementById("activatemsg").innerHTML = "";
			document.getElementById("activate").disabled = false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Activate Account</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="activatemsg" align=center style="color: red;"></div>
					<form method="post" onsubmit="activateEmployee()">
						<div class="form-group">
							<input type="number" class="form-control" name="eid" id="eid"
								placeholder="Employee ID" required="required">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="email" required="required"
								onfocusout="checkEmail()">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="password" required="required"
								onfocus="checkdetails()">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="cpassword"
								id="cpassword" placeholder="confirm password"
								required="required" onkeyup="checkpassword()">
						</div>
						<div class="form-group" align=center>
							<button type="submit" id="activate" class="btn btn-primary btn-xs" disabled>activate</button>
							&nbsp;
							<button type="reset" class="btn btn-primary btn-xs">clear</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	msg();
</script>
</html>