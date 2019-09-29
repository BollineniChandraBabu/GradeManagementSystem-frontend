
<%
session=request.getSession(false);
if(session!=null)
{
session.invalidate();	
}
%>
<jsp:include page="index.jsp"></jsp:include>
<script>
window.localStorage.setItem('role', 'New');
document.getElementById("logoutmsg").innerHTML="<br><b>successfully logged out...</b>";
</script>
