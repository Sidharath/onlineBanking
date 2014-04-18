<%@ include file="header.jsp"%>
<%@ include file="leftsidebar.jsp"%>
	<%
		String loantype = request.getParameter("ct");
		loan = util.getLoan(loantype);
		out.println("<div class='post'>");
		out.println("<h2 class='title'>Type of Loan : <a href='#' rel='bookmark' title=''>" + loan.getLoanType() + "</a></h2>");
		out.println("<div class='entry'>");
		out.println("<div style='width:60%;float:left;margin-left:10px;'>");
		out.println("Minimum Amount : " + loan.getMinAmount() + "<br/>");
		out.println("Maximum Amount : " + loan.getMaxAmount() + "<br/>");
		out.println("Rate of Interest : " + loan.getROI() + "<br/>");
		out.println("Minimum Duration : " + loan.getMinDuration() + "<br/>");
		out.println("Maximum Duration : " + loan.getMaxDuration() + "<br/>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
	%>
<%@ include file="rightsidebar.jsp"%>
<%@ include file="footer.jsp"%>