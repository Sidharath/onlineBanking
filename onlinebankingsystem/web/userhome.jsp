<%@ include file="userheader.jsp"%>
<%@ include file="leftsidebaruser.jsp"%>
<div class='post'>
</div>
<%
	try{
		session = request.getSession();
		u = util.getCustomer(Integer.parseInt(session.getAttribute("logged").toString()));
		out.println("<div class='post'>");
		out.println("<h2 class='title'>Customer ID : <a href='#' rel='bookmark' title=''>" + u.getCustomerId() + "</a></h2>");
		out.println("<p class='meta'><small style='color:black;'>Belong To : " + u.getCity() + ", " + u.getState() + ", " + u.getCountry());
		out.println(" - " + u.getPincode() + "</small></p>");
		out.println("<div class='entry'>");
		out.println("<div style='width:60%;float:left;margin-left:10px;'>");
		out.println("<table cellspacing='15'>");
		out.println("<tr><td>Name</td><td>" + u.getFirstname() + " " + u.getLastname() + "</td></tr>");
		out.println("<tr><td>D.O.B.</td><td>" + u.getDob() + "</td></tr>");
		out.println("<tr><td>Gender</td><td>" + u.getGender() + "</td></tr>");
		out.println("<tr><td>Mobile</td><td>" + u.getMobile() + "</td></tr>");
		out.println("<tr><td>Email ID</td><td>" + u.getEmail() + "</td></tr>");
		out.println("<tr><td>Address</td><td>" + u.getAddress() + "</td></tr>");
		out.println("</table>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
	}catch(Exception ex){
		ex.printStackTrace();
	}
%>
<%@ include file="rightsidebaruser.jsp"%>
<%@ include file="footer.jsp"%>