
<!DOCTYPE html>
<html>
<head>
<title>Grade Management system</title>
<link rel="icon" href="images/gms-logo.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/viewGrades.js"></script>
<script type="text/javascript" src="js/file.js"></script>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
<script>
function getter(){
var roles=(localStorage.getItem("role"));
if(roles=='New')
{
	 window.location.href="index.jsp";
}
}
</script>

</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
<jsp:include page="userLoginHeader.jsp"></jsp:include>
<div class="container">
  <div class="row">
    <div class="col-sm">
    <jsp:include page="UserOptions.jsp"></jsp:include>
    </div>
     <div class="col-sm" id="viewdetails">
    
    </div>
    
    
    </div>
</div>
<br><br>
  <jsp:include page="footer.html"></jsp:include>
  
		
</body>
<script>getter();</script>
</html>