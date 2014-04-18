<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<div class='post'>
<%
	String user = null;
	try{
		session = request.getSession();
		user = (String) session.getAttribute("logged");
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>
<h1>Welcome <%= user %></h1>
<h2>to "<%= com.model.Info.project %>"</h2>
</div>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>