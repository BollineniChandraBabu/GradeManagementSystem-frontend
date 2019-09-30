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
</script>
<script>
function login(){
	
    event.preventDefault();
  	var email = document.getElementById("email").value;
  	
    var password = document.getElementById("password").value;
    var formData = "email=" + email + "&password=" + password;
    console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/login.do?"+ formData;
    $.get(url, function(response){
        console.log(response);
       var data=JSON.parse(response);
       window.localStorage.setItem('userdata', email);
       if(data!=null){
           <%
           session.setAttribute("emails", "@gmail.com");%>
           
       if(data.roles)
           {
    	   window.localStorage.setItem('role', 'Admin');
           window.location.href="AdminLogin.jsp";
           }
       else
           {
    	   window.localStorage.setItem('role', 'User');
           console.log("user login");
           window.location.href="UserLogin.jsp";
           }
       }
       else
           {
    	   window.localStorage.setItem('role', 'New');
			document.getElementById("loginmsg").innerHTML="<b><i>Access Denied! Invalid credentials</i></b>";
           }

     });
    }

</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Sign In</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="loginmsg" align=center style="color: red;"></div>
					<form method="post" onsubmit="login()">
						<div class="form-group">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="E-mail Id" required="required">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="Password" required="required">
						</div>
						<div class="form-group" align=center>
							<button type="submit" class="btn btn-primary btn-xs">Sign
								In</button>
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
</html>