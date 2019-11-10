
<%
session=request.getSession(false);
if(session!=null)
{
	
session.invalidate();	
}
%>
<jsp:include page="index.jsp"></jsp:include>
<script>
localStorage.removeItem("userdata");
localStorage.setItem("role","new");
localStorage.removeItem("grades");
document.getElementById("logoutmsg").innerHTML="<br><b>successfully logged out...</b>";
</script>
