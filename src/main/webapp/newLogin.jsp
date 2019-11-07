<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
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
    var hash = CryptoJS.MD5(password);
    var formData = "email=" + email + "&password=" + hash;
    console.log(formData);
var url ="http://localhost:9000/login?"+ formData;
    $.get(url, function(response){
        console.log("response.id:"+response.id);
        console.log("response:"+response);
       var data=response;
       console.log("data:"+data);
       window.localStorage.setItem('userdata', email);
       if (data.length!=0)
      {
           <% session.setAttribute("emails", "@gmail.com");%>
           
       if(data.roles)
           {
 		  document.getElementById('login').innerHTML = '<br><br><center><img src="images/squarespace-logo-symbol-black.gif" width=500px height=500px /></center>';
    	   window.localStorage.setItem('role', 'Admin');
             window.location.href="AdminLogin.jsp";
           }
       else
           {
   		  document.getElementById('login').innerHTML = '<br><br><center><img src="images/squarespace-logo-symbol-black.gif" width=500px height=500px /></center>';
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
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
</head>
<body id="login" onLoad="noBack();"
	onpageshow="if (event.persisted) noBack();" onUnload="">
	<jsp:include page="index.jsp"></jsp:include>

	<div id="myModal" class="modal fade" align="center">
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